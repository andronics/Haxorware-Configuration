package Haxorware::Configuration::StaticIP;

use Haxorware::Meta::Attributes::Traits::Reference;
use Haxorware::Meta::Types::Configuration;
use Moose::Role;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

has 'force_static' => ( traits => [qw/Reference/], is => 'rw', isa => 'Int', default => 0, path => 'staticip.html', parameter => 'staticip' );
has 'suppress_dhcp' => ( traits => [qw/Reference/], is => 'rw', isa => 'Bool', default => 0, path => 'staticip.html', parameter => 'dhcpsupress' );
has 'static_host' => ( traits => [qw/Reference/], is => 'rw', isa => 'IPv4Address', default => '0.0.0.0', path => 'staticip.html', parameter => 'ipaddr' );
has 'static_gateway'  => ( traits => [qw/Reference/], is => 'rw', isa => 'IPv4Address', default => '0.0.0.0', path => 'staticip.html', parameter => 'gateway' );
has 'static_subnet' => ( traits => [qw/Reference/], is => 'rw', isa => 'IPv4Address', default => '255.255.255.0', path => 'staticip.html', parameter => 'subnet' );
has 'static_filename' => ( traits => [qw/Reference/], is => 'rw', isa => 'Str', default => '', path => 'staticip.html', parameter => 'tftpname' );
has 'static_server' => ( traits => [qw/Reference/], is => 'rw', isa => 'IPv4Address', default => '0.0.0.0', path => 'staticip.html', parameter => 'tftpip' );
has 'tod_host' => ( traits => [qw/Reference/], is => 'rw', isa => 'IPv4Address', default => '0.0.0.0', path => 'staticip.html', parameter => 'todip' );

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

1;