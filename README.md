# NAME

<div>
    <a href="https://travis-ci.org/PACKED-vzw/Catmandu-Store-Resolver"><img src="https://travis-ci.org/PACKED-vzw/Catmandu-Store-Resolver.svg?branch=master"></a>
</div>

Catmandu::Resolver - Store/retrieve items from the Resolver

# SYNOPSIS

    # From the command line
    $ catmandu export Resolver --id 1234 --url http://www.resolver.be --username demo --password demo to YAML
    ---
    data:
        data_pids:
            - https://resolver.be/collection/work/data/9031
        documents:
            - 88682
            - 88683
        domain: https://resolver.be
        id: '9031'
        persistentURIs:
            - https://resolver.be/collection/9031
            - https://resolver.be/collection/9031/untitled
            - https://resolver.be/collection/work/data/9031/html
            - https://resolver.be/collection/work/data/9031/html/untitled
            - https://resolver.be/collection/work/data/9031
            - https://resolver.be/collection/work/representation/9031/1
            - https://resolver.be/collection/work/representation/9031/1/untitled
            - https://resolver.be/collection/work/representation/9031
        type: work
        work_pid: https://resolver.be/collection/9031

    ...

    # From a Catmandu Fix
    lookup_in_store(
        objectNumber,
        Resolver,
        username: username,
        password: password,
        url: http://www.resolver.be
    )

    # Create or retrieve a PID from a fix
    make_pid(
        path,
        'http://www.resolver.be',
        username,
        password,
        -type: work
    )

# DESCRIPTION

Configure the [Resolver](https://github.com/PACKED-vzw/resolver) as a [store](http://librecat.org/Catmandu/#stores) for [Catmandu](http://librecat.org/).

Museum objects and records require a PID to be uniquely identifiable. The Resolver tool
generates and resolves these PIDs. By using this store, PIDs can be queried (based on
the object number of the record as stored in the resolver), created, updated and deleted
from Catmandu.

# MODULES

- [Catmandu::Store::Resolver](https://metacpan.org/pod/Catmandu::Store::Resolver)
- [Catmandu::Fix::make\_pid](https://metacpan.org/pod/Catmandu::Fix::make_pid)

# SEE ALSO

[Catmandu](https://metacpan.org/pod/Catmandu)

# AUTHORS

Pieter De Praetere, `pieter at packed.be`

# CONTRIBUTORS

Pieter De Praetere, `pieter at packed.be`

# COPYRIGHT AND LICENSE

This package is copyright (c) 2016 by PACKED vzw.
This is free software; you can redistribute it and/or modify it under the same terms as the Perl 5 programming language system itself.
