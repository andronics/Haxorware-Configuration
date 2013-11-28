#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Haxorware::Configuration' ) || print "Bail out!\n";
}

diag( "Testing Haxorware::Configuration $Haxorware::Configuration::VERSION, Perl $], $^X" );
