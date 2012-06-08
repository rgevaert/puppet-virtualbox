# Class: virtualbox
#
# This module manages virtualbox
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class virtualbox ($version = "4.1") {

  include apt

  package{
    "virtualbox-${version}":
      ensure  => installed;
    "dkms":
      ensure  => installed;
  }
  
  group {
    'vboxusers':
      ensure => present;
  }
  
  apt::sources_list {
    'virtualbox':
      ensure  => present,
      content => "deb http://download.virtualbox.org/virtualbox/debian $::lsbdistcodename contrib non-free";
  }

  apt::key {
    '98AB5139':
      ensure => present,
      source => 'http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc';
  }
}
