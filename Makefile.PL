use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.17;

my %WriteMakefileArgs = (
  "ABSTRACT" => "Generate Pod from inline wiki style text",
  "AUTHOR" => "David A Golden <dagolden\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.17"
  },
  "DISTNAME" => "Pod-WikiDoc",
  "EXE_FILES" => [
    "bin/wikidoc"
  ],
  "LICENSE" => "apache",
  "MIN_PERL_VERSION" => "5.006",
  "NAME" => "Pod::WikiDoc",
  "PREREQ_PM" => {
    "Carp" => 0,
    "ExtUtils::MakeMaker" => 0,
    "File::Basename" => 0,
    "File::Path" => 0,
    "File::pushd" => 0,
    "Getopt::Lucid" => "0.14",
    "IO::File" => 0,
    "IO::String" => "1.06",
    "Parse::RecDescent" => "1.967006",
    "Pod::Usage" => 1,
    "Scalar::Util" => "1.02",
    "Text::Balanced" => 0,
    "strict" => 0,
    "vars" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Carp" => 0,
    "Cwd" => 0,
    "ExtUtils::MakeMaker" => 0,
    "File::Basename" => 0,
    "File::Find" => 1,
    "File::Spec" => 3,
    "File::Temp" => 0,
    "IO::String" => "1.06",
    "IPC::Run3" => "0.033",
    "Probe::Perl" => "0.01",
    "Test::Builder" => 0,
    "Test::More" => 0,
    "lib" => 0
  },
  "VERSION" => "0.22",
  "test" => {
    "TESTS" => "t/*.t t/contributed/*.t"
  }
);


my %FallbackPrereqs = (
  "Carp" => 0,
  "Cwd" => 0,
  "ExtUtils::MakeMaker" => 0,
  "File::Basename" => 0,
  "File::Find" => 1,
  "File::Path" => 0,
  "File::Spec" => 3,
  "File::Temp" => 0,
  "File::pushd" => 0,
  "Getopt::Lucid" => "0.14",
  "IO::File" => 0,
  "IO::String" => "1.06",
  "IPC::Run3" => "0.033",
  "Parse::RecDescent" => "1.967006",
  "Pod::Usage" => 1,
  "Probe::Perl" => "0.01",
  "Scalar::Util" => "1.02",
  "Test::Builder" => 0,
  "Test::More" => 0,
  "Text::Balanced" => 0,
  "lib" => 0,
  "strict" => 0,
  "vars" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
