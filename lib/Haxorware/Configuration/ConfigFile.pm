package Haxorware::Configuration::ConfigFile;

use Haxorware::Meta::Attributes::Traits::Reference;
use Haxorware::Meta::Types::Configuration;
use Moose::Role;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

has 'config_autoserve' => ( traits => [qw/Reference/], is => 'rw', isa => 'Str', default => '', path => 'configfile.html', parameter => 'autoserveFile' );
has 'config_filename' => ( traits => [qw/Reference/], is => 'rw', isa => 'Str', default => '', path => 'configfile.html', parameter => 'tftpname' );
has 'config_server' => ( traits => [qw/Reference/], is => 'rw', isa => 'IPv4Address', default => '0.0.0.0', path => 'configfile.html', parameter => 'tftpip' );

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

sub vol_restore {
	my $self = shift;
	my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};
	return $self->_upload( action => 'configupload.cgi', content => { filename => $args->{filename} } );
}

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

1;