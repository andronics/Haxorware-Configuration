package Haxorware::Configuration::BackupRestore;

use Moose::Role;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

sub flash_backup {
	my $self = shift;
	my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};
	return $self->_download( action => 'backup.html', content => { region => 0 }, location => $args->{location} );
}

sub nonvol_backup {
	my $self = shift;
	my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};
	return $self->_download( action => 'backup.html', content => { region => 1 }, location => $args->{location} );
}

sub nonvol_restore {
	my $self = shift;
	my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};
	return $self->_upload( action => 'restore.cgi', content => { filename => $args->{filename} } );
}

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

1;