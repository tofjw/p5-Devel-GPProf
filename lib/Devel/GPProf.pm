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

Devel::GPProf - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Devel::GPProf;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Devel::GPProf, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Toshimitsu FUJIWARA

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2020 by Toshimitsu FUJIWARA

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself,


=cut
