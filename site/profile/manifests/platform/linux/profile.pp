#
# @summary This profile modifies /etc/profile
#
class profile::platform::linux::profile {
  file_line { 'login-timeout-1':
    ensure => present,
    path   => '/etc/profile',
    line   => 'export TMOUT=600',
  }
  file_line { 'login-timeout-2':
    ensure => present,
    path   => '/etc/profile',
    line   => 'typeset -r TMOUT',
  }
  }
