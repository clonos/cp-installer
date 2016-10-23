# Class: clonos_zfsinstall
# ===========================
#
# Full description of class clonos_zfsinstall here.
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
#    class { 'clonos_zfsinstall':
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
class clonos_zfsinstall (
	$dsk = $clonos_zfsinstall::params::dsk,
) inherits clonos_zfsinstall::params {


	file { "/tmp/zfsinstall.sh":
		ensure  => present,
		content => template("${module_name}/zfsinstall.cfg.erb"),
		owner => "root",
		mode => '0555',
	}
}
