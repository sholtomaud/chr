use 5.006;
use strict;
use warnings FATAL => 'all';
use inc::Module::Install;

name     'chr';
#all_from 'lib/chr.pm';
author   q{Sholto Maud <sholto.maud@gmail.com>};
license  'artistic2';

perl_version 5.006;

version '0.01';

resources (
   #homepage   => 'http://yourwebsitehere.com',
   #IRC        => 'irc://irc.perl.org/#Logger',
   license    => 'http://www.perlfoundation.org/artistic_license_2_0',
   repository => 'git://github.com/shotlom/chr.git',
);

configure_requires (
   'Module::Install' => 0,
);

build_requires (
   'Test::More' => 0,
);

requires (
   'Git::Wrapper'      => 0.01,     
   'Time::Local'       => 0.01,     
   'local::lib'        => 0.01,     
   'Env'               => 0.01,     
   'Pod::Select'       => 0.01,     
   'Cwd'               => 0.01,     
   'FindBin'           => 0.01,     
   'SemVer'           => 0.01,     
   'List::Util'           => 0.01,     
);

#cpanm_git('Logger');
  #'Logger' => 1,
#);


#sub cpanm_git ( $gitmodule ) {
  my $gitrepo =  'git://github.com/shotlom/DevLog.git';
  #my %repos =  %$gitmodule;
  #foreach my $repo ( keys %repos ){
  #  print "repo [$repo]";
  #}
  system("cpanm $gitrepo"); 
#}


install_as_cpan;
auto_install;
WriteAll;
