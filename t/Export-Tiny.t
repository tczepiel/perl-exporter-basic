use strict;
use warnings;

use Test::More tests => 1;
use t::Export::Tiny qw(a);

is(a(),1);


