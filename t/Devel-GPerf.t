# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Devel-GPerf.t'

#########################

use strict;
use warnings;

use Test::More tests => 2;
BEGIN { use_ok('Devel::GPerf') };

#########################

unlink "test.prof";
my $x = Devel::GPerf::profiler_start("test.prof");

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


Devel::GPerf::profiler_flush;
Devel::GPerf::profiler_stop;

ok(-s "test.prof");
unlink "test.prof";
