package Haxorware::Configuration::Settings;

use Haxorware::Meta::Attributes::Traits::Reference;
use Haxorware::Meta::Types::Configuration;
use Moose::Role;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

has 'dhcp_server' => ( traits => [qw/Reference/], is => 'rw', isa => 'Bool', default => 1, path => 'settings.html', parameter => 'dhcpserver' );
has 'disable_firmware_upgrade' => ( traits => [qw/Reference/], is => 'rw', isa => 'Bool', default => 1, path => 'settings.html', parameter => 'disswdld' );
has 'disable_ip_filters' => ( traits => [qw/Reference/], is => 'rw', isa => 'Bool', default => 0, path => 'settings.html', parameter => 'bootfilters' );
has 'factory_mode' => ( traits => [qw/Reference/], is => 'rw', isa => 'Bool', default => 0, path => 'settings.html', parameter => 'factory' );
has 'force_network_access' => ( traits => [qw/Reference/], is => 'rw', isa => 'Bool', default => 0, path => 'settings.html', parameter => 'fna' );
has 'ignore_t1' => ( traits => [qw/Reference/], is => 'rw', isa => 'Bool', default => 0, path => 'settings.html', parameter => 't1dis' );
has 'ignore_t2' => ( traits => [qw/Reference/], is => 'rw', isa => 'Bool', default => 1, path => 'settings.html', parameter => 't2dis' );
has 'ignore_t3' => ( traits => [qw/Reference/], is => 'rw', isa => 'Bool', default => 1, path => 'settings.html', parameter => 't3dis' );
has 'ignore_t4' => ( traits => [qw/Reference/], is => 'rw', isa => 'Bool', default => 0, path => 'settings.html', parameter => 't4dis' );
has 'host' => ( traits => [qw/Reference/], is => 'rw', isa => 'IPv4Address', default => '192.168.100.1', path => 'settings.html', parameter => 'msg_ip' );
has 'tftp_bypass' => ( traits => [qw/Reference/], is => 'rw', isa => 'Bool', default => 1, path => 'settings.html', parameter => 'enfbypass' );
has 'telnet_startup' => ( traits => [qw/Reference/], is => 'rw', isa => 'Bool', default => 1, path => 'settings.html', parameter => 'telnetd' );
has 'telnet_password' => ( traits => [qw/Reference/], is => 'rw', isa => 'Str', default => '', path => 'settings.html', parameter => 'telnet_pass' );
has 'telnet_username' => ( traits => [qw/Reference/], is => 'rw', isa => 'Str', default => '', path => 'settings.html', parameter => 'telnet_user' );
has 'webgui_protection' => ( traits => [qw/Reference/], is => 'rw', isa => 'Bool', default => 0, path => 'settings.html', parameter => 'httpdauth' );
has 'webgui_password' => ( traits => [qw/Reference/], is => 'rw', isa => 'Str', default => '', init_arg => 'password', path => 'settings.html', parameter => 'httpd_pass' );
has 'webgui_username' => ( traits => [qw/Reference/], is => 'rw', isa => 'Str', default => '', init_arg => 'username', path => 'settings.html', parameter => 'httpd_user' );

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

sub telnet_start {
	my $self = shift;
	return $self->_request( action => 'settings.html', content => { action => 'start' } );
}

sub telnet_stop {
	my $self = shift;
	return $self->_request( action => 'settings.html', content => { action => 'stop' } );
}

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

1;