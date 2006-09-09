use Module::Build;
# See perldoc Module::Build for details of how this works

Module::Build->new( 
    module_name         => 'Pod::WikiDoc',
    dist_author         => 'David A Golden <dagolden@cpan.org>',
    license             => 'perl',
    create_readme       => 1,
    create_makefile_pl  => 'traditional',
    requires        => {
        File::Find          => 1,    
        File::pushd         => 0.20,    #build_requires
        File::Spec          => 3,       
        File::Temp          => 0.16,    #build_requires
        IO::String          => 1.06,
        IPC::Run3           => "0.030", #build_requires
        Parse::RecDescent   => 1.94,
        Scalar::Util        => 1.02,
        Test::More          => 0.48,    #build_requires
    },
)->create_build_script;
