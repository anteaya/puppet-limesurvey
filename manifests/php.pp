# Class: limesurvey::php
# ===========================
#
# Installs required PHP packages
#
# Parameters
# ----------
#
# * `php_packages`
# Hash of all required packages to be installed
#
# Examples
# --------
#
# @example
#    class { 'limesurvey::php':
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
class limesurvey::php (

  $php_packages    = $limesurvey::php_packages,

) {

  create_resources(package, $php_packages)

}
