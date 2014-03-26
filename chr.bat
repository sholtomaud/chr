@rem = ' Perl Script
@echo off
set mycd=%cd:\=\\%
perl -wS %0 %1 %2 %mycd%
goto :EOF
';
undef @rem; 

use strict;
use warnings;
use Git::Wrapper;
use Time::Local;
use local::lib '';
use Env;
use Env qw(PATH HOME TERM);
use Pod::Select;

#Chromicon modules
use FindBin qw($Bin);
use lib "$Bin/lib/"; 
use DevLog;

main: {

my $file = 'C:\\Dev\\Log.txt';
#print "opening file [$file]\n";
open (my $fh,">>",$file);

#print "Looking at argv [$ARGV[0]]\n";
my $thing = $ARGV[0];
#print "Bin [$Bin]\n";
#print "thing [$thing]\n";
 
 
#foreach my $rem ( @rem ) {
#  print $fh "rem [$rem]\n\n"
#} 

 
my $dir = 'C:\\Dev\\Logger\\';
my $git = Git::Wrapper->new($dir);

#print $fh "git dir [".$git->dir."]\n"; 

  #foreach my $arg ( @ARGV ){
  #  print "arg [$arg]\n";
  #}

  my $statuses = $git->status;
  for my $type (qw<indexed changed unknown conflict>) {
      my @states = $statuses->get($type)
          or next;
      print $fh "Files in state $type\n";
      for (@states) {
          print $fh '  ', $_->mode, ' ', $_->from;
          print $fh ' renamed to ', $_->to
              if $_->mode eq 'renamed';
          print $fh "\n";
      }
  } 

  my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);

  my $errmsg  = 'Error message test';
  my $status  = 'FAIL';
  my $site    = 'TEST2';
  my $comment = 'imported somethink';
  my $keyword = 'IMPTEST';

  my %functions = ( start=>1, new=>1, list=>1, 'git.update'=>1, makepod =>1 ) ;
  
  if ( lc($ARGV[0]) eq '-help' ){
    print "\nChromicon Utils \n-----------------\n";
    foreach (keys %functions){
      print "$_ \n";
    }
  }
  elsif ( lc($ARGV[0]) eq 'start'){
    print "ARGV [$ARGV[1]]\n";
    my $devlog = DevLog->new( 
      comment => $comment,
      status  => $status,
      keyword => $keyword,
      script  => $ARGV[1],
      errmsg  => $errmsg,
      
    );
    $devlog->dev_log;
  }
  elsif( lc($ARGV[0]) eq 'list'){
    my $href = DevLog->list(); 
    
    my %hash = %$href;
    print "\nProject List\n------------\n";
    foreach my $script ( keys %hash ){
      print "$script\n";
    }
  }
  elsif ( lc($ARGV[0]) eq 'new'){
    my $new_dir = $ENV{HOME}.'\\'.$ARGV[1];
    mkdir $new_dir if (! -d $new_dir);
    my $devlog = DevLog->new( 
      comment => "Created project",
      keyword => 'INITIATED',
      script  => $ARGV[1],
    );
    $devlog->dev_log;
    print "New project created at [$new_dir]\n";
    chdir $new_dir;
  }
  elsif ( lc($ARGV[0]) eq 'git.update'){
    my $href = DevLog->list(); 
    print "Updating Git Repository\n";
    
  }
  elsif ( lc($ARGV[0]) eq 'makepod'){
    my $pm = $ARGV[2].'\\lib\\'.$ARGV[1].'.pm';
    print "Making POD from [$pm]\n";
    #system( podselect $pm > 'README.pod');
    podselect({-output => "README.pod"}, $pm);
    print "Done\n";
  }
  else {
    print "command [$ARGV[0]] not recognised. Quitting.\n";
  }
  
  
  #my $all = $logger->log_hash(logpath=>$log_path);
  #my %log_hash = %$all;
  #foreach my $record ( keys %log_hash ){
  #  print $fh "printing loghash $log_hash{$record}\n";
  #}
  

  print $fh "Hello from the Perl part of this job\n";
  
  close ($fh);
  
}

