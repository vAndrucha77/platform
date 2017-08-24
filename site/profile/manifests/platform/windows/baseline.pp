class profile::platform::windows::baseline {
  # CORP PACKAGES
  Package {
    ensure   => installed,
    provider => chocolatey,
  }

  # package { 'Firefox': }
  # package { 'notepadplusplus': }
  package { '7zip': }
  # package { 'git': }
  # CUSTOM APPLICATION FIREWALL RULE
  dsc_xFirewall { 'Inbound-TSE-Demo':
    dsc_ensure       => 'present',
    dsc_name         => 'inboundTSEDemo',
    dsc_displayname  => 'InboundTSEDemo',
    dsc_displaygroup => 'A Puppet + DSC Test',
    dsc_action       => 'Allow',
    dsc_enabled      => true,
    dsc_protocol     => 'TCP',
    dsc_localport    => '8081',
    dsc_direction    => 'Inbound',
  }

  windows_firewall::exception { 'TSErule':
    ensure       => present,
    direction    => 'in',
    action       => 'Allow',
    enabled      => 'yes',
    protocol     => 'TCP',
    local_port   => '8080',
    display_name => 'TSE PUPPET DEMO',
    description  => 'Inbound rule example for demo purposes',
  }
  # FOLDER AND PERMISSIONS
  file { 'c:/permissions':
    ensure => directory,
  }

  acl { 'c:/permissions':
    inherit_parent_permissions => false,
    permissions                => [
    {identity => 'Administrators', rights => ['full']},
    {identity => 'Users', rights => ['read','execute']},
    {identity => 'PuppetGroup', rights => ['full']}
    ],
  }
  # CUSTOM USERS
  user { 'PuppetUser':
    ensure  => present,
    comment => 'This user is managed by Puppet',
    groups  => ['Administrators','PuppetGroup'],
  }

  #CUSTOM GROUP
  group { 'PuppetGroup':
  ensure  =>  present,
  }
  # CUSTOM APP REG KEYS
  registry_key { 'HKEY_LOCAL_MACHINE\Software\Demonstration':
    ensure       => present,
    purge_values => true,
  }
  registry_value { 'HKEY_LOCAL_MACHINE\Software\Demonstration\value1':
    type => string,
    data => 'this is a value new from puppet intro',
  }
  registry_value { 'HKEY_LOCAL_MACHINE\Software\Demonstration\value2':
    type => dword,
    data => '0xFFFFFFFF',
  }

  #registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\LegalNoticeText':
  #  type        => string,
  #  data        => 'This Legal Notice Text is Managed By Puppet',
  #}

  #registry_value { 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\LegalNoticeCaption':
  #  type        => string,
  #  data        => 'This Legal Notice Caption is Managed By Puppet',
  #}

  exec { 'motd':
    command => 'C:\Windows\System32\cmd.exe /c reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v LegalNoticeCaption /t REG_SZ /d "This Legal Notice Caption is Managed By Puppet" /f && reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v LegalNoticeText /t REG_SZ /d "This Legal Notice Caption is Managed By Puppet" /f',
  }

include bginfo

}
