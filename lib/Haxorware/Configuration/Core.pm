package Haxorware::Configuration::Core;

use Haxorware::Meta::Types::Configuration;
use HTML::TreeBuilder::XPath;
use HTTP::Request::Common;
use LWP::UserAgent;
use Moose::Role;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

has '_agent' => ( is => 'ro', isa => 'LWPAgent', builder => '_build_agent', lazy => 1, init_arg => 'agent' );
has '_timeout' => ( is => 'ro', isa => 'Int', default => 30, lazy => 1, init_arg => 'timeout' );
has '_ua' => ( is => 'ro', isa => 'LWP::UserAgent', builder => '_build_ua', lazy => 1 );
has '_version' => ( is => 'ro', isa => 'Str', default => '0.01', lazy => 1 );

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

sub _build_agent {
	my $self = shift;
	my $package = __PACKAGE__;
	$package =~ s/::/-/g;
	return sprintf("%s/%s",  $package, $self->_version);
}

sub _build_ua {
	my $self = shift;
	return LWP::UserAgent->new( agent => $self->_agent, timeout => $self->_timeout );
}

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

sub BUILD {
	my $self = shift;
	my $args = shift;
	$self->_parameters_read() if ($args->{'host'} && $args->{'autoconnect'});
}

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

sub _download {
	my $self = shift;
	my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};

	return printf("[%d] %s\n", 0, 'File already exists. Change location or enable overwrite')
		if ((-e $args->{location}) && (!$args->{overwrite}));

	my $request = POST($self->_uri( action => $args->{action}), $args->{content});
	my $response = $self->_ua->request($request, $args->{location});

	printf("[%d] %s\n", $response->code, $response->message)
		if $response->is_error;

	return $response;
}

sub _map {
	my $self = shift;
	my $meta = $self->meta;
	my $map = {};

	for my $attribute ( map { $meta->get_attribute($_) } sort $meta->get_attribute_list ) {
		if ( $attribute->does('Haxorware::Meta::Attributes::Traits::Reference') && $attribute->has_path && $attribute->parameter ) {
			$map->{$attribute->path}->{$attribute->name} = $attribute->parameter;
		}
	}

	return $map;
}

sub _parameters_read {
 	my $self = shift;
	my $args = shift;
	my $map = $self->_map();

	while (my ($ks, $vs) = each $map) {
		my $uri = $self->_uri(action => $ks);
		my $tree = HTML::TreeBuilder::XPath->new_from_url($uri);

		while (my ($ka, $va) = each $vs) {
			my $xpath = sprintf('//*[@name="%s"]', $va);
	 		my $node = ($tree->findnodes($xpath))[0];

	 		if ($node->tag =~ /select/i) {
				my $xpath_sibling = sprintf('//select[@name="%s"]/option[@selected]', $va);
				my $node_sibling = ($node->findnodes($xpath_sibling))[0];
				$self->{$ka} = $node_sibling->attr('value');
			} elsif ($node->attr('type') =~ /checkbox/i) {
				$self->{$ka} = ($node->attr('checked') ? 1 : 0);
			} else {
				$self->{$ka} = $node->attr('value');
			}
		}
	}
}

sub _parameters_write {
	my $self = shift;
	my $args = shift;
	my $map = $self->_map();

	while (my ($ks, $vs) = each $map) {
		my $attributes;
		while (my ($ka, $va) = each $vs) {
			next if (($self->meta->get_attribute($ka)->type_constraint->is_a_type_of('Bool')) && ($self->{$ka} eq 0));
			$attributes ->{$va}= $self->{$ka};
		}
		$self->_request( action => $ks, content => $attributes);
	}
};

sub _reboot {
	my $self = shift;
	return $self->_request( action => 'reboot.html', content => { reboot => 'true' } );
}

sub _request {
	my $self = shift;
	my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};

	my $request = POST($self->_uri( action => $args->{action}), $args->{content});
	my $response = $self->_ua->request($request);

	printf("[%d] %s\n", $response->code, $response->message)
		if $response->is_error;

	return $response;
}

sub _upload {
	my $self = shift;
	my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};

	printf("[%d] %s\n", 0, 'The requested upload file does not exist.') && return
		if (! -e $args->{content}->{filename});

	my $response = $self->_ua->request( POST $self->_uri( action => $args->{action}), Content_Type => 'form-data', Content => $args->{content});

	printf("[%d] %s\n", $response->code, $response->message)
		if $response->is_error;

	return $response;
}

sub _uri {
	my $self = shift;
	my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};
	return sprintf("http://%s/%s", $self->host, $args->{action});
}

sub save {
	my $self = shift;
	my $args = ref $_[0] eq 'HASH' ? $_[0] : {@_};
	$self->_parameters_write();
	$self->_reboot() if $args->{reboot};
}

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

1;