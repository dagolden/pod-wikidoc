use Module::Build;

my $class = Module::Build->subclass(
    class => "Module::Build::WikiDoc",
    code => <<'SUBCLASS',

    sub ACTION_wikidoc {
        my $self = shift;
        eval "use Pod::WikiDoc";
        if ( $@ eq '' ) {
            my $parser = Pod::WikiDoc->new( 
                { comment_blocks => 1 } 
            );
            for my $src ( keys %{ $self->find_pm_files() } ) {
                (my $tgt = $src) =~ s{\.pm$}{.pod};
                $parser->filter( {
                    input   => $src,
                    output  => $tgt,
                });
                print "Creating $tgt\n";
                $self->_add_to_manifest( 'MANIFEST', $tgt );
            }
        }
        else {
            warn "Pod::WikiDoc not available. Skipping wikidoc.\n";
        }
    }

    sub ACTION_testpod {
        my $self = shift;
        $self->depends_on('wikidoc');
        $self->SUPER::ACTION_testpod;
    }

    sub ACTION_distdir {
        my $self = shift;
        $self->depends_on('wikidoc');
        $self->SUPER::ACTION_distdir;
    }

SUBCLASS
);
            
$class->new( 
    module_name         => 'Pod::WikiDoc',
    dist_author         => 'David A Golden <dagolden@cpan.org>',
    dist_abstract       => 'Generate Pod from inline wiki style text',
    license             => 'perl',
    create_readme       => 0,
    create_makefile_pl  => 'traditional',
    requires        => {
        File::Find          => 1,       #build_requires
        File::pushd         => 0.20,    #build_requires
        File::Spec          => 3,       #build_requires 
        File::Temp          => 0.16,    #build_requires
        Getopt::Long        => 2.17,
        IO::String          => 1.06,
        IPC::Run3           => "0.020", #build_requires
        Parse::RecDescent   => 1.94,
        Pod::Usage          => 1,
        Scalar::Util        => 1.02,
        Test::More          => 0.48,    #build_requires
        Text::Balanced      => 1.95,
    },
)->create_build_script;
