package Haxorware::Meta::Attributes::Traits::Reference;

use Moose::Role;
Moose::Util::meta_attribute_alias('Reference');

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

has path => ( is => 'ro', isa => 'Str', predicate  => 'has_path' );
has parameter => ( is => 'ro', isa => 'Str', predicate  => 'has_parameter' );

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

1;