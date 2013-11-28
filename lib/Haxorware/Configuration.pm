package Haxorware::Configuration;

use Moose;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

with
	'Haxorware::Configuration::Addresses',
	'Haxorware::Configuration::BackupRestore',
	'Haxorware::Configuration::BaselinePrivacy',
	'Haxorware::Configuration::ConfigFile',
	'Haxorware::Configuration::Core',
	'Haxorware::Configuration::Downloader',
	'Haxorware::Configuration::FactoryDefaults',
	'Haxorware::Configuration::FileManager',
	'Haxorware::Configuration::FirmwareUpgrade',
	'Haxorware::Configuration::Frequency',
	'Haxorware::Configuration::Settings',
	'Haxorware::Configuration::Speed',
	'Haxorware::Configuration::StaticIP',
	'Haxorware::Configuration::Stealth',
	'Haxorware::Configuration::WebShell';

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

1;