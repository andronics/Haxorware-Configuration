package Haxorware::Configuration::Stealth;

use Haxorware::Meta::Attributes::Traits::Reference;
use Haxorware::Meta::Types::Configuration;
use Moose::Role;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

has 'bootloader_override' => ( traits => [qw/Reference/], is => 'rw', isa => 'Bool', default => 0, path => 'stealth.html', parameter => 'enablebootspoof' );
has 'bootloader_revision' => ( traits => [qw/Reference/], is => 'rw', isa => 'Str', default => '', path => 'stealth.html', parameter => 'bootspoof' );
has 'hardware_override' => ( traits => [qw/Reference/], is => 'rw', isa => 'Bool', default => 0, path => 'stealth.html', parameter => 'enablehwspoof' );
has 'hardware_version' => ( traits => [qw/Reference/], is => 'rw', isa => 'Str', default => '', path => 'stealth.html', parameter => 'hwspoof' );
has 'model' => ( traits => [qw/Reference/], is => 'rw', isa => 'Str', default => '', path => 'stealth.html', parameter => 'modelspoof' );
has 'software_version' => ( traits => [qw/Reference/], is => 'rw', isa => 'Str', default => '', path => 'stealth.html', parameter => 'versionspoof' );
has 'vendor' => ( traits => [qw/Reference/], is => 'rw', isa => 'Str', default => '', path => 'stealth.html', parameter => 'vendorspoof' );
has 'snmp_disable' => ( traits => [qw/Reference/], is => 'rw', isa => 'Bool', default => 1, path => 'stealth.html', parameter => 'suspendsnmp' );
has 'snmp_port' => ( traits => [qw/Reference/], is => 'rw', isa => 'Int', default => 225, path => 'stealth.html', parameter => 'snmpport' );
has 'traps_host' => ( traits => [qw/Reference/], is => 'rw', isa => 'IPv4Address', default => '0.0.0.0', path => 'stealth.html', parameter => 'trapip' );
has 'traps_port' => ( traits => [qw/Reference/], is => 'rw', isa => 'Int', default => 162, path => 'stealth.html', parameter => 'trapport' );
has 'traps_redirect' => ( traits => [qw/Reference/], is => 'rw', isa => 'Bool', default => 0, path => 'stealth.html', parameter => 'redirecttraps' );

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

1;