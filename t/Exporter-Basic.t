use strict;
use warnings;

use Test::More tests => 3;
use t::Exporter::Basic qw(foo %a A);

is(foo(),1);

is($a{a},1);

is(A,1);

