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

1;