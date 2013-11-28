package Haxorware::Types;

use strict;
use feature qw(switch);

use Moose;
use Moose::Util::TypeConstraints;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

subtype 'AnnexRange',
	as "Int",
	where { ($_ == 0) || ($_ == 1) || ($_ == 3)  },
	message { "The Annex value you provided, $_, is invalid. Value must be between either 0, 1 or 3." };

subtype 'BPIRange',
	as "Int",
	where { ($_ >= 0) && ($_ <= 3)  },
	message { "The BPI value you provided, $_, is invalid. Value must be between 0 and 3." };

subtype 'CertificateRange',
	as "Int",
	where { ($_ >= 0) && ($_ <= 2)  },
	message { "The Certificate value you provided, $_, is invalid. Value must be between 0 and 2." };

subtype 'IPv4Address',
	as "Str",
	where { $_ =~ /\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/ },
	message { "The IPv4 address you provided, $_, does not conform to the required standard." };

subtype 'LWPAgent',
	as "Str",
	where { $_ =~ /[a-zA-Z0-9._-]+\/[a-zA-Z0-9._-]+/  },
	message { "The Annex value you provided, $_, is invalid. Value must be between either 0, 1 or 3." };

subtype 'MACAddress',
	as "Str",
	where { $_ =~ /(((?:(\d{1,2}|[a-fA-F]{1,2}){2})(?::|-*)){6})/ },
	message { "The MAC address you provided, $_, does not conform the required standard." };

subtype 'PlanRange',
	as "Int",
	where { ($_ >= 0) && ($_ <= 2)  },
	message { "The Plan value you provided, $_, is invalid. Value must be between 0 and 2." };

subtype 'RegionRange',
	as "Int",
	where { ($_ >= 0) && ($_ <= 1)  },
	message { "The Region value you provided, $_, is invalid. Value must be between 0 and 2." };

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

1;