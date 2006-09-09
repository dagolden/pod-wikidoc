use Module::Build;

my $class = Module::Build->subclass(
    class => "Module::Build::WikiDoc",
    code => <<'SUBCLASS', );

    sub ACTION_wikidoc {
        my $self = shift;
        $self->depends_on('parser');
        eval "use Pod::WikiDoc";
        if ( $@ eq '' ) {
            my $parser = Pod::WikiDoc->new( { 
                comment_blocks => 1,
                keywords => { VERSION => $self->dist_version },
            });
            for my $src ( keys %{ $self->find_pm_files() } ) {
                (my $tgt = $src) =~ s{\.pm$}{.pod};
                $parser->filter( {
                    input   => $src,
                    output  => $tgt,
                });
                print "Creating $tgt\n";
                $tgt =~ s{\\}{/}g;
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

    sub ACTION_parser {
        my $self = shift;
        my $parserfile = 'lib/Pod/WikiDoc/Parser.pm';
        $self->run_perl_script('Pod_WikiDoc_Parser.pm.PL', [],
                               [$parserfile] );
        $self->_add_to_manifest( 'MANIFEST', $parserfile );
    }

    sub ACTION_distdir {
        my $self = shift;
        $self->depends_on('parser');
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
        perl                => 5.006,
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
    },
    meta_add            => {
        no_index => {
            file => [ qw{
                lib/Pod/WikiDoc/Cookbook.pm
            } ]
        }
    },
)->create_build_script;

