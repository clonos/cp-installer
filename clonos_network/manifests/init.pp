# Class: clonos_network
# ===========================
#
# Full description of class clonos_network here.
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
#    class { 'clonos_network':
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
class clonos_network (
        $uplink_interface = $clonos_network::params::uplink_interface,
        $ip4_addr         = $clonos_network::params::ip4_addr,
        $ip4_gateway      = $clonos_network::params::ip4_gateway,
        $ip4_mask         = $clonos_network::params::ip4_mask,
	$hostname         = $clonos_network::params::hostname,
) inherits clonos_network::params {

	Shellvar { target => '/etc/rc.conf' }

	# interface
	if $uplink_interface {
		if $ip4_addr and $ip4_mask == undef {
			shellvar { "ifconfig_$uplink_interface":
				value => "$ip4_addr",
			}
		}

		if $ip4_addr and $ip4_mask != undef {
			shellvar { "ifconfig_$uplink_interface":
				value => "$ip4_addr netmask $ip4_mask",
			}
		}
	}

	if $hostname {
		shellvar { "hostname":
			value => "$hostname",
		}
	}

	if $ip4_gateway {
		shellvar { "defaultrouter":
			value => "$ip4_gateway",
		}
	}

}
