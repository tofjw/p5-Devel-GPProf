use strict;
use warnings;

use Test::More tests => 2;
BEGIN { use_ok('Devel::GPProf') };

use Devel::GPProf qw(:all);

#########################

unlink "export.prof";
my $x = profiler_start("export.prof");

sub fib {
    my $n = shift;
    if ($n <= 0) {
	return 0;
    }
    elsif ($n == 1) {
	return 1;
    }
    else {
	return fib($n - 1) + fib($n - 2);
    }
}

my $f = fib(10);


profiler_flush;
profiler_stop;

ok(-s "export.prof");
unlink "export.prof";


