# NAME

Catmandu::Store::Resolver - Store/retrieve items from the Resolver

# SYNOPSIS

A module that can be used to retrieve or store PIDS for records in the [Resolver](https://github.com/PACKED-vzw/resolver).

# DESCRIPTION

Configure the [Resolver](https://github.com/PACKED-vzw/resolver) as a [store](http://librecat.org/Catmandu/#stores) for [Catmandu](http://librecat.org/).

Museum objects and records require a PID to be uniquely identifiable. The Resolver tool generates and resolves these PIDs. By using this store, PIDs can be queried (based on the object number of the record as stored in the resolver), created, updated and deleted from Catmandu. 

Data is returned as JSON.

# CONFIGURATION

The Resolver API requires a username and password. These must be provided.

- `url`

    base url of the Resolver (e.g. \_http://www.resolver.be\_).

- `username`

    username for the Resolver.

- `password`

    password for the Resolver.

# USAGE

See [the Catmandu documentation](http://librecat.org/Catmandu/#stores) for more information on how to use Stores.

# SEE ALSO

[Catmandu](https://metacpan.org/pod/Catmandu)

# AUTHORS

Pieter De Praetere, `pieter at packed.be`

# CONTRIBUTORS

Pieter De Praetere, `pieter at packed.be`

# COPYRIGHT AND LICENSE

This package is copyright (c) 2016 by PACKED vzw.
This is free software; you can redistribute it and/or modify it under the same terms as the Perl 5 programming language system itself.
