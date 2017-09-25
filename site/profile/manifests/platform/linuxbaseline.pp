class profile::platform::linuxbaseline {
  case $operatingsystemrelease {
    /^7.*/: {
    include profile::platform::linux::alambrecht
    include profile::platform::linux::groups
    include profile::platform::linux::motd
    include profile::platform::linux::profile
    include profile::platform::linux::sudoers
    include profile::platform::linux::sshd
    }
    /^6.*/: {
    include profile::platform::linux::alambrecht
    include profile::platform::linux::groups
    include profile::platform::linux::pam
    include profile::platform::linux::motd
    include profile::platform::linux::profile
    include profile::platform::linux::sudoers
    include profile::platform::linux::sshd
    }
  }
    package { 'unzip':
    ensure => installed,
  }
    #package { 'git':
    #ensure => installed,
    #}

    #include profile::platform::linux::vim
    #include profile::platform::linux::ssh
    #include profile::baseline::linux::zsh
    #include profile::platform::linux::user
}
