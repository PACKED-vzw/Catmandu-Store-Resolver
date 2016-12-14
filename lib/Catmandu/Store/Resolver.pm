package Catmandu::Store::Resolver;

use Catmandu::Sane;

use Moo;
use Catmandu::Store::Resolver::Bag;
use Catmandu::Store::Resolver::API;

use LWP::UserAgent;

with 'Catmandu::Store';

has url      => (is => 'ro', required => 1);
has username => (is => 'ro', required => 1);
has password => (is => 'ro', required => 1);

has client => (is => 'lazy');

sub _build_client {
    my $self = shift;
    return LWP::UserAgent->new();
}


1;