package Devel::GPProf;

use strict;
use warnings;

require Exporter;
use AutoLoader qw(AUTOLOAD);

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Devel::GPProf ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
profiler_start profiler_stop profiler_flush	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Devel::GPProf', $VERSION);

# Preloaded methods go here.

my $started_by_option;

sub import {
    my ($package, $filename, $line) = caller;
    if ($package eq "main" && $line == 0) {
	&profiler_start("prof.out");
	$started_by_option = 1;
    }
    goto &Exporter::import;
}

sub END {
    if ($started_by_option) {
	&profiler_stop;
	$started_by_option = 0;
    }
}

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Devel::GPProf - Perl interface for Google Performance Tools

=head1 SYNOPSIS

  use Devel::GPProf qw(:all);

  profiler_start("prof.out");

  # your heavy code

  profiler_stop;

or run from command line:

    $ perl -MDevel::GPProf your_script.pl

=head1 DESCRIPTION

This module is NOT a profiler for Perl code but a native code.
You can profile functions used in XS module and Perl internals.

=head2 FUNCTIONS

=over 4

=item profiler_start(fname)

Start profiling and write profile info into fname.

=item profiler_stop

Stop profiling. 

=item profiler_flush

Flush any currently buffered profiling state to the profile file.

=back

=head2 EXPORT

None by default.

All functions are exported with tag :all.

=head1 SEE ALSO

https://github.com/gperftools/gperftools
(CPU PROFILER section)

=head1 AUTHOR

Toshimitsu FUJIWARA

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2020 by Toshimitsu FUJIWARA

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself,


=cut
