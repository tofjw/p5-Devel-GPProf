# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Devel-GPProf.t'

#########################

use strict;
use warnings;

use Test::More tests => 2;
BEGIN { use_ok('Devel::GPProf') };

#########################

unlink "test.prof";
my $x = Devel::GPProf::profiler_start("test.prof");

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


Devel::GPProf::profiler_flush;
Devel::GPProf::profiler_stop;

ok(-s "test.prof");
unlink "test.prof";
