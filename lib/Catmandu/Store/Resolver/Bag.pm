package Catmandu::Store::Resolver::Bag;

use Moo;
use JSON;

use Catmandu::Sane;
use Catmandu::Store::Resolver::API;

with 'Catmandu::Bag';

has api => (is => 'lazy');

sub _build_api {
    my $self = shift;
    my $api = Catmandu::Store::Resolver::API->new(
        url => $self->store->url,
        username => $self->store->username,
        password => $self->store->password
    );
    return $api;
}

sub generator {
    my $self = shift;
}

sub get {
    my ($self, $id) = @_;
    return $self->api->get($id);
}

sub add {
    my ($self, $data) = @_;
    return $self->api->post($data);
}

sub update {
    my ($self, $id, $data) = @_;
    return $self->api->put($id, $data);
}

sub delete {
    my ($self, $id) = @_;
    return $self->api->delete($id);
}

sub delete_all {
    my $self = shift;
}

1;