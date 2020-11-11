# NAME

Devel::GPProf - Perl interface for Google Performance Tools

# SYNOPSIS

    use Devel::GPProf qw(:all);

    profiler_start("prof.out");

    # your heavy code

    profiler_stop;

or run from command line:

    $ perl -MDevel::GPProf your_script.pl

# DESCRIPTION

This module is NOT a profiler for Perl code but a native code.
You can profile functions used in XS module and Perl internals.

## FUNCTIONS

- profiler\_start(fname)

    Start profiling and write profile info into fname.

- profiler\_stop

    Stop profiling. 

- profiler\_flush

    Flush any currently buffered profiling state to the profile file.

## EXPORT

None by default.

All functions are exported with tag :all.

# SEE ALSO

https://github.com/gperftools/gperftools
(CPU PROFILER section)

# AUTHOR

Toshimitsu FUJIWARA

# COPYRIGHT AND LICENSE

Copyright (C) 2020 by Toshimitsu FUJIWARA

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself,
