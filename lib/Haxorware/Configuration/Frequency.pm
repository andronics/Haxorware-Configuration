package Haxorware::Configuration::Frequency;

use Haxorware::Meta::Attributes::Traits::Reference;
use Haxorware::Meta::Types::Configuration;
use Moose::Role;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

has 'annex' => ( traits => [qw/Reference/], is => 'rw', isa => 'AnnexRange', default => 0, path => 'frequency.html', parameter => 'annex'  );
has 'plan' => ( traits => [qw/Reference/], is => 'rw', isa => 'PlanRange', default => 0, path => 'frequency.html', parameter => 'freqplan'  );
has 'frequency_1' => ( traits => [qw/Reference/], is => 'rw', isa => 'Int', default => 0, path => 'frequency.html', parameter => 'dsfreq1'  );
has 'frequency_2' => ( traits => [qw/Reference/], is => 'rw', isa => 'Int', default => 0, path => 'frequency.html', parameter => 'dsfreq2'  );
has 'frequency_3' => ( traits => [qw/Reference/], is => 'rw', isa => 'Int', default => 0, path => 'frequency.html', parameter => 'dsfreq3'  );
has 'upstream_channel' => ( traits => [qw/Reference/], is => 'rw', isa => 'Int', default => 0, path => 'frequency.html', parameter => 'uschan'  );

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

1;