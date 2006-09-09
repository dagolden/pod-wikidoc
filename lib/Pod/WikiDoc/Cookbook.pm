package Pod::WikiDoc::Cookbook;
# Not really a .pm file, but holds wikidoc which will be
# turned into .pod by the Build.PL
use strict; # make CPANTS happy
use vars '$VERSION';
$VERSION = "0.15";
1;
__END__

=begin wikidoc

= NAME

Pod::WikiDoc::Cookbook - Examples of Pod::WikiDoc usage

= VERSION

This documentation refers to version %%VERSION%%.

= DESCRIPTION

This file contains some examples of ways to use [Pod::WikiDoc]
or to integrate [Pod::WikiDoc] with other tools.

= BASIC RECIPES

== Editor settings for working with Pod::WikiDoc

~(Seeking equivalent settings for other editors or alternatives for vim.)~

=== Vim

In vim, use the {comments} and {formatoptions} settings in {.vimrc} to
have vim automatically insert the wikidoc comment leader when pressing
return from a wikidoc comment line.  For example, the following lines in a 
{.vimrc} file will activate this option whenever a perl-ish file is loaded.
 
    autocmd BufNewFile,BufRead *.p? set comments=b:###
    autocmd BufNewFile,BufRead *.p? set formatoptions+=r

== Subclassing Module::Build to automatically generate Pod from wikidoc

With a little extra work in the Build.PL file, Pod::WikiDoc
can work easily with [Module::Build] to extract wikidoc into .pod
files automatically during the distribution process

The Build.PL file below subclasses [Module::Build] with three functions:

* ACTION_wikidoc -- adds a new {Build wikidoc} action that extracts Pod
and wikidoc from all .pm files in the {lib} directory and adds them to
the MANIFEST
* ACTION_testpod -- adds a dependency on the {wikidoc} action to regenerate
.pod files before testing them
* ACTION_distdir -- adds a dependency on the {wikidoc} action to regenerate
.pod files before bundling up a distribution

As an extra feature, ACTION_wikidoc also sets a VERSION keyword that can
be used to insert the current version number into the generated Pod.

    = VERSION
    This documentation refers to version %%VERSION%%.

By making wikidoc extraction part of the {distdir} action, users installing the
distribution will receive it with .pod files already created, and will not need
to have [Pod::WikiDoc] installed themselves.  

    # Build.PL
    use Module::Build;

    my $class = Module::Build->subclass(
        class => "Module::Build::WikiDoc",
        code => <<'SUBCLASS' );

        sub ACTION_wikidoc {
            my $self = shift;
            eval "use Pod::WikiDoc";
            if ( $@ eq '' ) {
                my $parser = Pod::WikiDoc->new( {
                    comment_blocks => 1}
                    keywords => { VERSION => $self->dist_version },
                });
                for my $src ( keys %{ $self->find_pm_files() } ) {
                    (my $tgt = $src) =~ s{\.pm$}{.pod};
                    $parser->filter( {
                        input   => $src,
                        output  => $tgt,
                    });
                    print "Creating $tgt\n";
                    $tgt =~ s{\\}{/}g; # for win32
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

    $class->new( 
        # regular Module::Build options
    )->create_build_script;

== Including extra pure-wikidoc files in a distribution

To add extra documentation files to a distribution, create them as .pm
files and let Pod::WikiDoc convert them as normal.  To prevent the .pm
files from being indexed (e.g. by search.cpan.org), list them as "no_index"
in the META.yml file of the distribution.

Example of a simple .pm documentation file:

    package Some::Module::About;
    use strict; # make CPANTS happy
    1;
    __END__

    =begin wikidoc

    Your wikidoc goes here.
    
    =end wikidoc

Adding "no_index" to META.yml via Build.PL (requires Module::Build
0.28):

    my $builder = $class->new(
        # regular Module::Build options
        meta_add            => {
            no_index => {
                file => [ qw{
                    lib/Some/Module/About.pm
                } ]
            }
        },
    );

= AUTHOR

David A Golden (DAGOLDEN)

dagolden@cpan.org

[http://dagolden.com/]

= COPYRIGHT

Copyright (c) 2005,2006 by David A Golden

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=end wikidoc

=cut
