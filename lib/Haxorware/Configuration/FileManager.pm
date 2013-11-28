package Haxorware::Configuration::FileManager;

use Moose::Role;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

sub file_upload {
	my $self = shift;
	my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};
	return $self->_upload( action => 'fileupload.cgi', content => {filename => $args->{filename} } );
}

sub file_info_defrag {
	my $self = shift;
	return $self->_request( action => 'filemgr.html', content => { action => 'defrag' } );
}

sub file_info_erase {
	my $self = shift;
	return $self->_request( action => 'filemgr.html', content => { action => 'erase' } );
}

sub vol_backup {
	my $self = shift;
	my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};
	return $self->_download( action => 'filemgr.html', content => { action => 'download', fileid => '96044466' }, location => $args->{location} );
}

sub vol_delete {
	my $self = shift;
	return $self->_request( action => 'backup.html', content => { region => 1 } );
}

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

1;