use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'Export::Tiny',
    VERSION_FROM      => 'lib/Export/Tiny.pm',
    PREREQ_PM         => {
        'Package::Stash' => 0,
    },
    ($] >= 5.005 ?
      (ABSTRACT       => 'yet another symbol exporter...',
       AUTHOR         => '<tjmc@cpan.org>') : ()),
);
