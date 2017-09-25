#
# @summary This profile sets PAM setting
#
class profile::platform::linux::pam {
pam { 'Set cracklib limits in password-auth':
    ensure    => present,
    service   => 'password-auth',
    type      => 'password',
    module    => 'pam_cracklib.so',
    arguments => ['try_first_pass', 'retry=3', 'minlen=8', 'lcredit=-1', 'ucredit=-1', 'dcredit=-1', 'ocredit=-1', 'remember=10'],
  # arguments => [ 'try_first_pass', 'retry=3', 'minlen=10'],
  }
  }
