package t::Exporter::Tiny;

use Exporter::Tiny qw(foo A %a);
use constant A => 1;

sub foo { 1 }

our %a = (a => 1);

1;
