#
# @summary this class intalls vim editor and sets colorscheme
#
class profile::platform::linux::vim ($colorscheme = 'elflord') {
  require git
  case $osfamily {
    'RedHat': { $vim_pkg = 'vim-enhanced' }
    'Debian': { $vim_pkg = 'vim' }
    default: { fail('unsupported operating system') }
  }
  package { $vim_pkg:
    ensure => installed,
  }
  puppet_vim_env::install { 'default':
    colorscheme => $colorscheme,
  }
}
