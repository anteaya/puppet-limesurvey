# Class: limesurvey::webserver
# ===========================
#
# Installs an Apache2 webserver for limesurvey
#
# Parameters
# ----------
#
# * `vhost_docroot`
# docroot path for apache vhost
#
# * `vhost_name`
# vhost name for apache
#
# * `vhost_port`
# vhost port
#
# Examples
# --------
#
# @example
#    class { 'limesurvey::webserver':
#     vhost_docroot => '/var/www/limesurvey',
#     vhost_name    => 'limesurvey',
#     vhost_port    => '80',
#    }
#
# Authors
# -------
#
# Author Name <markus@martiablog.de>
#
# Copyright
# ---------
#
# Copyright 2016, unless otherwise noted.
#
class limesurvey::webserver (

  String $mpm_module    = $limesurvey::mpm_module,
  String $vhost_docroot = $limesurvey::vhost_docroot,
  String $vhost_name    = $limesurvey::vhost_name,
  String $vhost_port    = $limesurvey::vhost_port,

) {

  class { 'apache':
    default_vhost => false,
    mpm_module    => $mpm_module,
  }

  class { '::apache::mod::php': }

  apache::vhost { $vhost_name:
    port    => $vhost_port,
    docroot => $vhost_docroot,
  }

}
