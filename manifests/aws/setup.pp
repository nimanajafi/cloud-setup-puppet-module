# Class: cloud_setup
# ===========================

class cloud_setup::aws::setup (
  String $aws_access_key_id,
  String $aws_secret_access_key,
  String $aws_region = undef,
  String $http_proxy = '<PROXY>',
  String $https_proxy = '<PROXY>'
){

  Exec { path => ['/opt/puppetlabs/puppet/bin/','/usr/bin','/bin/', '/sbin/', '/usr/sbin/'] }

  file{"${settings::confdir}/puppetlabs_aws_configuration.ini":
    ensure  => present,
    content => template("${$module_name}/aws_config.erb")
  }  

  file{'/root/.aws':
    ensure => 'directory'
  }
  
  #installs aws sdk
  #AWS documentation of how to install: gem install aws-sdk
  exec  { 'install-aws-sdk-core' :
    command => "gem install --http-proxy=${http_proxy} aws-sdk-core",
    unless  => 'gem list | grep aws-sdk-core'
  }
  #AWS sdk requires retries to be installed
  exec  { 'install-retries' :
    command => "gem install --http-proxy=${http_proxy} retries",
    unless  => 'gem list | grep retries'
  }
}
