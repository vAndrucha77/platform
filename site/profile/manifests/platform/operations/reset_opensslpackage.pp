#
# @summary This profile will move a CentOS 7 node back to an old version of OpenSSL
# It will be ignored if the node is already managing Package[openssl]
class profile::platform::operations::reset_opensslpackage (
  ){
    if ! defined(Package['openssl']) {
      yumrepo { 'C7.0.1406-base':
        ensure  => 'present',
        enabled => '1',
      }
      exec { 'downgrade openssl':
        command => '/bin/yum downgrade -y openssl-libs-1.0.1e-34.el7 openssl-1.0.1e-34.el7',
        unless  => '/bin/rpm -qa | /bin/grep openssl-1.0.1e-34.el7.x86_64',
        require => Yumrepo['C7.0.1406-base'],
      }
    }
}
