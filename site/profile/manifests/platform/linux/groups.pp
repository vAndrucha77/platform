#
# @summary This profile creates local groups
#
class profile::platform::linux::groups {
  group { 'TSEDemo':
    ensure => present,
  }
}
