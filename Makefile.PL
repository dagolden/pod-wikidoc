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
        Getopt::Lucid       => 0.14,    
        IO::String          => 1.06,
        Parse::RecDescent   => 1.94,
        Pod::Usage          => 1,
        Scalar::Util        => 1.02,
        Text::Balanced      => 1.95,
        Cwd                 => 0,       #build_requires
        Test::More          => 0.45,    #build_requires
        IPC::Run3           => 0.033,   #build_requires
        Probe::Perl         => 0.01,    #build_requires
        File::Find          => 1,       #build_requires
        File::pushd         => 0.30,    #build_requires
        File::Spec          => 3,       #build_requires 
        File::Temp          => 0.14,    #build_requires
        File::Basename      => 0,       #build_requires
    }
)
;
