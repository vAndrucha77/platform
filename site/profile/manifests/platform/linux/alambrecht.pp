#
# @summary This profile creates alambrecht user with .bashrc and ssh keys
#
class profile::platform::linux::alambrecht {
  user { 'alambrecht':
    ensure           => present,
    home             => '/home/alambrecht',
    managehome       => true,
    comment          => "alambrecht's Account created by tse_admins module",
    forcelocal       => true,
    # groups         => ['TSEDemo','root'],
    groups           => 'TSEDemo',
    purge_ssh_keys   => true,
    shell            => '/bin/bash',
    password_max_age => '99999',
    password_min_age => '0',
    password         => '$1$SLfIbrG3$Yh8yKEQknk9Ob/lfoqAg1/',
  }
  file_line { 'alambrecht_puppet_path':
    ensure  => present,
    line    => 'PATH=$PATH:/opt/puppet/bin/',
    path    => '/home/alambrecht/.bashrc',
    require => User['alambrecht'],
  }
  ssh_authorized_key { 'alambrecht@puppetlabs.com':
    ensure  => present,
    user    => 'alambrecht',
    name    => 'alambrecht@puppetlabs.com',
    key     =>  '<=ssh key=>',
    type    => 'ssh-rsa',
    require => User['alambrecht'],
  }
}
