package Haxorware::Configuration::Addresses;

use Haxorware::Meta::Attributes::Traits::Reference;
use Haxorware::Meta::Types::Configuration;
use Moose::Role;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

has 'certificate_type' => ( traits => [qw/Reference/], is => 'rw', isa => 'CertificateRange', default => 0, path => 'addresses.html', parameter => 'certtype' );
has 'ethernet' => ( traits => [qw/Reference/], is => 'rw', isa => 'MACAddress', default => '00:00:00:00:00:00', path => 'addresses.html', parameter => 'ethmac' );
has 'hfc' => ( traits => [qw/Reference/], is => 'rw', isa => 'MACAddress', default => '00:00:00:00:00:00', path => 'addresses.html', parameter => 'hfcmac' );
has 'usb' => ( traits => [qw/Reference/], is => 'rw', isa => 'MACAddress', default => '00:00:00:00:00:00', path => 'addresses.html', parameter => 'usbmac' );
has 'serial_number' => ( traits => [qw/Reference/], is => 'rw', isa => 'Str', default => '', path => 'addresses.html', parameter => 'serial' );

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

around ['hfc', 'ethernet', 'usb'] => sub {
	my $o = shift;
	my $self = shift;
	return $self->$o()
		unless @_;
	my $address = shift;
	$address =~ s/://g;
	return $self->$o( $address );
};

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

1;