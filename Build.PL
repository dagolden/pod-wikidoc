use Module::Build;

my $class = Module::Build->subclass(
    class => "Module::Build::WikiDoc",
    code => <<'SUBCLASS', );

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

    sub ACTION_build_parser {
        my $self = shift;
        my $parserfile = 'lib/Pod/WikiDoc/Parser.pm';
        $self->run_perl_script('Pod_WikiDoc_Parser.pm.PL', [],
                               [$parserfile] );
        $self->_add_to_manifest( 'MANIFEST', $parserfile );
    }

    sub ACTION_distdir {
        my $self = shift;
        $self->depends_on('build_parser');
        $self->depends_on('wikidoc');
        $self->SUPER::ACTION_distdir;
    }

#    sub ACTION_distmeta {
#        my $self = shift;
#        $self->meta_merge( 
#            provides => {
#                'Pod::WikiDoc::Parser' => {
#                    file => 'lib/Pod/WikiDoc/Parser.pm',
#                    version => $self->dist_version,
#                },
#            },
#        );
#        $self->SUPER::ACTION_distmeta;
#    }

SUBCLASS
            
$class->new( 
    module_name         => 'Pod::WikiDoc',
    dist_author         => 'David A Golden <dagolden@cpan.org>',
    dist_abstract       => 'Generate Pod from inline wiki style text',
    license             => 'perl',
    create_readme       => 0,
#    PL_files            => {
#        'Pod_WikiDoc_Parser.pm.PL' => 'lib/Pod/WikiDoc/Parser.pm',
#    },
#    add_to_cleanup      => [
#        'lib/Pod/WikiDoc/Parser.pod',
#    ],
    requires        => {
        File::Find          => 1,       #build_requires
        File::pushd         => 0.30,    #build_requires
        File::Spec          => 3,       #build_requires 
        File::Temp          => 0.14,    #build_requires
        Getopt::Long        => 2.17,
        IO::String          => 1.06,
        IPC::Run3           => 0.033,   #build_requires
        Parse::RecDescent   => 1.94,
        Pod::Usage          => 1,
        Scalar::Util        => 1.02,
        Test::More          => 0.45,    #build_requires
        Text::Balanced      => 1.95,
    },
)->create_build_script;
