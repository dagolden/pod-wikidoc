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
        File::pushd         => 0.20,
        Parse::RecDescent   => 1.94,
        Test::More          => 0.48,
    },
)->create_build_script;
