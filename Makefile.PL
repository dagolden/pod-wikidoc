# Note: this file was custom written
use ExtUtils::MakeMaker;
WriteMakefile
(
    'INSTALLDIRS' => 'site',
    'NAME' => 'Pod::WikiDoc',
    'VERSION_FROM' => 'lib/Pod/WikiDoc.pm',
    'PL_FILES' => { 
        # don't Build.PL or any other .PL file
    },
    'EXE_FILES' => [ 'scripts/wikidoc' ],
    'PREREQ_PM' => {
        'Scalar::Util' => '1.02',
        'Getopt::Long' => '2.17',
        'Pod::Usage' => 1,
        'IO::String' => '1.06',
        'File::pushd' => '0.30',
        'File::Spec' => 3,
        'Parse::RecDescent' => '1.94',
        'Test::More' => '0.45',
        'File::Find' => 1,
        'Text::Balanced' => '1.95',
        'File::Temp' => '0.14',
        'IPC::Run3' => '0.033'
    }
)
;
