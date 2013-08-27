#!/usr/bin/perl -w

use warnings;
use strict;
use File::Basename;
use Cwd;

my $EVAL = "emacsclient -c --eval ";
my $action = basename($0);

sub _escape_str {

    my ($str) = @_;
    $str = '\\"' . $str . '\\"';
    print STDERR $str, "\n";
    return $str;
}

sub vc_dir {

  my ($path) = @_;
  my $realPath = Cwd::abs_path($path);
  if (-f $realPath) {
    $realPath = dirname ($realPath);
  }
  my $escaped_Path =  _escape_str( ${realPath} );

  print STDERR ("exec $EVAL" . "\"(vc-dir ".  $escaped_Path . ")\" &\n");
  system       ("exec $EVAL" . "\"(vc-dir ".  $escaped_Path . ")\" &");

}

sub dired {

  my ($path) = @_;
  my $realPath = Cwd::abs_path($path);
  my $escaped_Path =  _escape_str( ${realPath} );

  print STDERR ("exec $EVAL" . "\"(dired ".  $escaped_Path . ")\" &\n");
  system       ("exec $EVAL" . "\"(dired ".  $escaped_Path . ")\" &");

}

sub ff {

  my ($file) = @_;
  my $realPath = Cwd::abs_path($file);
  my $escaped_Path =  _escape_str( ${realPath} );

  print STDERR ("exec $EVAL" . "\"(find-file ".  $escaped_Path . ")\" &\n");
  system       ("exec $EVAL" . "\"(find-file ".  $escaped_Path . ")\" &");

}

sub ec {
  my @params = @_;

  print STDERR ( "exec emacsclient -c " . join( " ", @params) . " & \n");
  system       ( "exec emacsclient -c " . join( " ", @params) . " &");
}

sub manual_entry {
  my ($man) = @_;
  my $escaped_man = _escape_str($man);
  
  print STDERR ("exec $EVAL" . "\"(manual-entry ".  $escaped_man . ")\" &\n");
  system       ("exec $EVAL" . "\"(manual-entry ".  $escaped_man . ")\" &");

}



                     # - is illegal in function name in Perl
$action =~ s/-/_/;   # but legal in Lisp; so replace it.

print STDERR "action = $action\n";

no strict "refs";

## Call function by action name
eval {
  &$action( @ARGV ) ;
}; if ($@) { print "\$@ = ", $@, "\n"; }


