package Catmandu::Store::Resolver::API;

use Moo;
use JSON;
use LWP::UserAgent;

use Catmandu::Sane;

has url      => (is => 'ro', required => 1);
has username => (is => 'ro', required => 1);
has password => (is => 'ro', required => 1);

has ua => (is => 'lazy');

sub _build_ua {
    my $self = shift;
    my $ua = LWP::UserAgent->new();
    $ua->cookie_jar({});
    return $ua;
}

sub login {
    my $self = shift;
    my $auth_url = '%s/resolver/api/login';
    my $req_url = sprintf($auth_url, $self->url);
    my $form = {
        'username' => $self->username,
        'password' => $self->password
    };
    my $response = $self->ua->post($req_url, Content => $form);
    if ($response->is_success) {
        return $self->ua->cookie_jar;
    } else {
        Catmandu::HTTPError->throw({
            code             => $response->code,
            message          => $response->status_line,
            url              => $response->request->uri,
            method           => $response->request->method,
            request_headers  => [],
            request_body     => $response->request->decoded_content,
            response_headers => [],
            response_body    => $response->decoded_content
        });
        return undef;
    }
}

sub get {
    my ($self, $id) = @_;
    my $url = '%s/resolver/api/entity/original/%s';
    my $req_url = sprintf($url, $self->url, $id);

    $self->ua->cookie_jar($self->login());

    my $response = $self->ua->get($req_url);

    if ($response->is_success) {
        # New API
        return decode_json($response->decoded_content);
    } else {
        # Try with the old API
        # Please note: this doesn't work with the original object number
        # so it could say 'does not exist' because the original object number
        # is not equal to the PID
        $url = '%s/resolver/api/entity/%s';
        $req_url = sprintf($url, $self->url, $id);
        $response = $self->ua->get($req_url);
        if ($response->is_success) {
            return decode_json($response->decoded_content);
        } else {
            # Give up
            Catmandu::HTTPError->throw({
                code             => $response->code,
                message          => $response->status_line,
                url              => $response->request->uri,
                method           => $response->request->method,
                request_headers  => [],
                request_body     => $response->request->decoded_content,
                response_headers => [],
                response_body    => $response->decoded_content
            });
            return undef;
        }
    }
}

sub post {
    my ($self, $data) = @_;
    my $json_data = encode_json($data);
    my $url = '%s/resolver/api/entity';
    my $req_url = sprintf($url, $self->url);

    $self->ua->cookie_jar($self->login());

    my $response = $self->ua->post($req_url, Content_Type => 'application/json', Content => $json_data);

    if ($response->is_success) {
        return decode_json($response->decoded_content);
    } else {
        Catmandu::HTTPError->throw({
                code             => $response->code,
                message          => $response->status_line,
                url              => $response->request->uri,
                method           => $response->request->method,
                request_headers  => [],
                request_body     => $response->request->decoded_content,
                response_headers => [],
                response_body    => $response->decoded_content
            });
        return undef;
    }

}

sub put {
    my ($self, $id, $data) = @_;
    my $json_data = encode_json($data);
    my $url = '%s/resolver/api/entity/%s';
    my $req_url = sprintf($url, $self->url, $id);

    $self->ua->cookie_jar($self->login());

    my $response = $self->ua->put($req_url, Content_Type => 'application/json', Content => $json_data);

    if ($response->is_success) {
        return decode_json($response->decoded_content);
    } else {
        Catmandu::HTTPError->throw({
                code             => $response->code,
                message          => $response->status_line,
                url              => $response->request->uri,
                method           => $response->request->method,
                request_headers  => [],
                request_body     => $response->request->decoded_content,
                response_headers => [],
                response_body    => $response->decoded_content
            });
        return undef;
    }
}

sub delete {
    my ($self, $id) = @_;
    my $url = '%s/resolver/api/entity/%s';
    my $req_url = sprintf($url, $self->url, $id);

    $self->ua->cookie_jar($self->login());

    my $response = $self->ua->delete($req_url);

    if ($response->is_success) {
        return $response->decoded_content;
    } else {
        Catmandu::HTTPError->throw({
                code             => $response->code,
                message          => $response->status_line,
                url              => $response->request->uri,
                method           => $response->request->method,
                request_headers  => [],
                request_body     => $response->request->decoded_content,
                response_headers => [],
                response_body    => $response->decoded_content
            });
        return undef;
    }
}

1;