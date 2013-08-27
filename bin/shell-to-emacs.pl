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
                     # - is illegal in function name
$action =~ s/-/_/;   # but legal in Lisp

print STDERR "action = $action\n";

no strict "refs";

## Call function by action name
eval {
  &$action( @ARGV ) ;
}; if ($@) { print "\$@ = ", $@, "\n"; }


