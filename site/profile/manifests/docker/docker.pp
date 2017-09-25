#
# @summary This class cretes a nginx container and mounts a volume with s sample web page
#
class profile::docker::docker {
include 'docker'
  ::docker::image { 'nginx': }
  ::docker::run { 'docker-nginx':
    ensure  => 'present',
    image   => 'nginx',
    ports   => ['8080:80'],
    volumes => '/vagrant/pl_generic_site:/usr/share/nginx/html:ro'
    }
}
