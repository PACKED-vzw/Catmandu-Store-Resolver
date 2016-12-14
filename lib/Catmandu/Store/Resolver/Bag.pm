package Catmandu::Store::Resolver::Bag;

use Moo;
use JSON;

use Catmandu::Sane;
use Catmandu::Store::Resolver::API;

with 'Catmandu::Bag';

has cookie_jar => (is => 'lazy');

sub _build_cookie_jar {
    my $self = shift;
    my $api = Catmandu::Store::Resolver::API->new(
        url => $self->store->url,
        username => $self->store->username,
        password => $self->store->password
    );
    my $cookie_jar = $api->login();
    return $cookie_jar;
}

sub generator {
    my $self = shift;
}

sub get {
    my ($self, $id) = @_;
    my $url = sprintf('%s/resolver/api/entity/%s', $self->store->url, $id);

    $self->store->client->cookie_jar($self->cookie_jar);
    my $response = $self->store->client->get($url);
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

sub add {
    my $self = shift;
}

sub update {
    my $self = shift;
}

sub delete {
    my $self = shift;
}

sub delete_all {
    my $self = shift;
}

1;