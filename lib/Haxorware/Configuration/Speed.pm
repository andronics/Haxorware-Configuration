package Haxorware::Configuration::Speed;

use DOCSIS::ConfigFile;
use Moose::Role;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

has '_configuration' => (is => 'ro', isa => 'ArrayRef', builder => '_build_configuration', lazy => 1 );
has '_docsis' => (is => 'ro', isa => 'DOCSIS::ConfigFile', builder => '_build_docsis', lazy => 1 );
has 'download_speed' => (is => 'ro', isa => 'Int', builder => '_build_download_speed', lazy => 1 );
has 'upload_speed' => (is => 'ro', isa => 'Int', builder => '_build_upload_speed', lazy => 1 );

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

sub _build_configuration {
	my $self = shift;
	my $response = $self->_request( action => 'getcfg.cgi', content => {} );
	return $self->_docsis->decode(\$response->content);
}

sub _build_docsis {
	return DOCSIS::ConfigFile->new( advanced_output => 0, shared_secret   => '' );
}

sub _build_download_speed {
	my $self = shift;
	return $self->_configuration->[1]->{'nested'}->[1]->{'value'};
}

sub _build_upload_speed {
	my $self = shift;
	return $self->_configuration->[1]->{'nested'}->[2]->{'value'};
}

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

1;