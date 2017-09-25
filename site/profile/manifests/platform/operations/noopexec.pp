#
# @summary configures noop mode om the agent
#
class profile::platform::operations::noopexec {
    exec { 'change noop to false':
        path => '/opt/puppetlabs/bin',
        command => 'puppet config set noop false --section agent',
    }
}
