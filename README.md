# NAME

<div>
    <a href="https://travis-ci.org/PACKED-vzw/Catmandu-Store-Resolver"><img src="https://travis-ci.org/PACKED-vzw/Catmandu-Store-Resolver.svg?branch=master"></a>
</div>

Catmandu::Store::Resolver - Store/retrieve items from the Resolver

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

# DESCRIPTION

    # From a Catmandu Fix
    lookup_in_store(
        objectNumber,
        Resolver,
        username: username,
        password: password,
        url: http://www.resolver.be
    )

Configure the [Resolver](https://github.com/PACKED-vzw/resolver) as a [store](http://librecat.org/Catmandu/#stores) for [Catmandu](http://librecat.org/).

Museum objects and records require a PID to be uniquely identifiable. The Resolver tool
generates and resolves these PIDs. By using this store, PIDs can be queried (based on
the object number of the record as stored in the resolver), created, updated and deleted
from Catmandu.

The `_id` attribute of the data after a [add\_to\_store](https://metacpan.org/pod/Catmandu::Fix::add_to_store)
is set to the _workPid_, which is the first item of the _presistenURIs_ array.

The _Store_ returns the following data:

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

# PARAMETERS

The Resolver API requires a username and password. These must be provided.

- `url`

    base url of the Resolver (e.g. _http://www.resolver.be_).

- `username`

    username for the Resolver.

- `password`

    password for the Resolver.

# SEE ALSO

[Catmandu::Resolver](https://metacpan.org/pod/Catmandu::Resolver)

# AUTHORS

Pieter De Praetere, `pieter at packed.be`

# CONTRIBUTORS

Pieter De Praetere, `pieter at packed.be`

# COPYRIGHT AND LICENSE

This package is copyright (c) 2016 by PACKED vzw.
This is free software; you can redistribute it and/or modify it under the same terms as the Perl 5 programming language system itself.
