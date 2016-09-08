# Class: limesurvey::extract
# ===========================
#
# Manages downloadn and extraction from limesurvey.org
#
# Parameters
# ----------
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
#
# Examples
# --------
#
# @example
#    class { 'limesurvey::extract':
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
class limesurvey::extract (

  String $archive_path     = $limesurvey::archive_path,
  String $download_url     = $limesurvey::download_url,
  String $extract_path     = $limesurvey::extract_path,
  String $install_path     = $limesurvey::install_path,
  String $runtime_dir_mode = $limesurvey::runtime_dir_mode,
  String $www_group        = $limesurvey::www_group,
  String $www_user         = $limesurvey::www_user,

) {

  file { $install_path:
    ensure => directory,
    owner  => $www_user,
    group  => $www_group,
  }

  archive { $archive_path:
    ensure       => present,
    extract      => true,
    extract_path => $extract_path,
    source       => $download_url,
    creates      => "${install_path}/tmp",
    user         => $www_user,
    group        => $www_group,
    require      => File[$install_path],
  }

  file { "${install_path}/tmp/runtime/":
    ensure  => directory,
    mode    => $runtime_dir_mode,
    require => File[$install_path],
  }

}
