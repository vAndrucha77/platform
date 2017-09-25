#
# @summary Installs a openssl package - version must be provided
#
class profile::platform::operations::openssl_package(
  $openssl_version,
) {
  package { 'openssl':
    ensure => $openssl_version,
  }
}
