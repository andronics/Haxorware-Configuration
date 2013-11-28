package Haxorware::Configuration::BaselinePrivacy;

use Haxorware::Meta::Attributes::Traits::Reference;
use Haxorware::Meta::Types::Configuration;
use Moose::Role;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

my $map->{'bpi.html'} = {
	bpi_type => 'bpitype'
};

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =


has 'bpi_type' => ( traits => [qw/Reference/], is => 'rw', isa => 'BPIRange', default => 0, path => 'bpi.html', parameter => 'bpitype' );

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

sub bpi_backup {
	my $self = shift;
	my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};
	return $self->_download( action => 'tardownload.cgi', filename => $args->{filename} );
}

sub bpi_plus_ca {
	my $self = shift;
	my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};
	return $self->_upload( action => 'plus_ca.cgi', content => { filename => $args->{filename} } );
}

sub bpi_plus_cm {
	my $self = shift;
	my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};
	return $self->_upload( action => 'plus_cm.cgi', content => { filename => $args->{filename} } );
}

sub bpi_plus_root {
	my $self = shift;
	my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};
	return $self->_upload( action => 'plus_root.cgi', content => { filename => $args->{filename} } );
}

sub bpi_private {
	my $self = shift;
	my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};
	return $self->_upload( action => 'bpi_private.cgi', content => { filename => $args->{filename} } );
}

sub bpi_public {
	my $self = shift;
	my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};
	return $self->_upload( action => 'bpi_public.cgi', content => { filename => $args->{filename} } );
}

sub bpi_restore {
	my $self = shift;
	my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};
	return $self->_upload( action => 'tarupload.cgi', content => { filename => $args->{filename} } );
}

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

1;