#
# @summary This profile configures sudoers settings
#
class profile::platform::linux::sudoers {
  sudo::conf { 'TSEDemo':
    ensure  => present,
    content => '%TSEDemo ALL=(ALL) ALL',
  }
}
