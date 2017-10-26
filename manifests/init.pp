# Class: cloud_setup
# ===========================
#
# Full description of class cloud_setup here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'cloud_setup':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class cloud_setup(
  String $option = 'aws',
  Hash $aws = {}
){

  case $option {
    #Passing parameters to aws setup.pp
    'aws' : {
      class { 'cloud_setup::aws::setup' :
        aws_access_key_id => $aws['aws_access_key_id'],
        aws_secret_access_key => $aws['aws_secret_access_key'],
        aws_region => $aws['aws_region'] ? { undef => '', default => $aws['aws_region']}
      }
    }
    default : {
      fail('Please provide an option [agent or server]')
    }
  }

}
