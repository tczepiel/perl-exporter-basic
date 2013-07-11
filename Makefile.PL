use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'Exporter::Basic',
    VERSION_FROM      => 'lib/Exporter/Basic.pm',
    PREREQ_PM         => {
        'Package::Stash' => 0,
        'Scalar::Util'   => 0,
        'Carp'           => 0,
    },
    ($] >= 5.005 ?
      (ABSTRACT       => 'yet another symbol exporter...',
       AUTHOR         => '<tjmc@cpan.org>') : ()),
);
