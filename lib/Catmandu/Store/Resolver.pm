package Catmandu::Store::Resolver;

our $VERSION = '0.01';

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

=head1 NAME

Catmandu::Store::Resolver - Store/retrieve items from the Resolver

=head1 SYNOPSIS

A module that can be used to retrieve or store PIDS for records in the [Resolver](https://github.com/PACKED-vzw/resolver).

Supports retrieving PIDs.

=head1 DESCRIPTION

Configure the [Resolver](https://github.com/PACKED-vzw/resolver) as a [store](http://librecat.org/Catmandu/#stores) for [Catmandu](http://librecat.org/).

Museum objects and records require a PID to be uniquely identifiable. The Resolver tool generates and resolves these PIDs. By using this store, PIDs can be queried (based on the object number of the record as stored in the resolver), created, updated and deleted from Catmandu. 

Data is returned as JSON.

=head1 CONFIGURATION

The Resolver API requires a username and password. These must be provided.

=over

=item C<url>: base url of the Resolver (e.g. _http://www.resolver.be_).

=item C<username>: username for the Resolver.

=item C<password>: password for the Resolver.

=back

=head1 USAGE

See [the Catmandu documentation](http://librecat.org/Catmandu/#stores) for more information on how to use Stores.

=head1 SEE ALSO

L<Catmandu>

=head1 AUTHORS

=over

=item Pieter De Praetere, C<< pieter at packed.be >>

=back

=head1 CONTRIBUTORS

=over

=item Pieter De Praetere, C<< pieter at packed.be >>

=back

=head1 COPYRIGHT AND LICENSE

This package is copyright (c) 2016 by PACKED vzw.
This is free software; you can redistribute it and/or modify it under the same terms as the Perl 5 programming language system itself.

=cut