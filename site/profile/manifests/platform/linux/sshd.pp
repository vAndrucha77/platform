#
# @summary This profile configures ssh
#
class profile::platform::linux::sshd {
  sshd_config { 'PermitRootLogin':
    ensure => present,
    value  => 'yes',
    notify => Service['sshd'],
  }
  sshd_config { 'PrintMotd':
    ensure => present,
    value  => 'yes',
    notify => Service['sshd'],
  }
  service { 'sshd':
    ensure => running,
    enable => true,
  }
}
