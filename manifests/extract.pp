# Class: limesurvey::extract
# ===========================
#
# Manages downloadn and extraction from limesurvey.org
#
# Parameters
# ----------
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

  $download_url     = $limesurvey::download_url,
  $version          = $limesurvey::version,
  $install_path     = $limesurvey::install_path,
  $runtime_dir_mode = $limesurvey::runtime_dir_mode,
  $www_group        = $limesurvey::www_group,
  $www_user         = $limesurvey::www_user,

) {

  file { $install_path:
    ensure => directory,
    owner  => $www_user,
    group  => $www_group,
  }

  exec { 'limesurvey-download':
    path    => '/bin:/usr/bin',
    creates => "${install_path}/tmp/runtime",
    command => "bash -c 'cd /tmp; wget ${download_url}${version}.tar.gz'",
    require => File[$install_path],
    user    => $www_user,
  }

  exec { 'limesurvey-unzip':
    path    => '/bin:/usr/bin',
    cwd     => '/tmp',
    creates => "${install_path}/tmp/runtime",
    command => "bash -c 'cd /tmp; tar zxf /tmp/${version}.tar.gz -C ${install_path} --strip-components=1'",
    require => Exec['limesurvey-download'],
    user    => $www_user,
  }

  file { "/tmp/${version}.tar.gz":
    ensure  => absent,
    require => Exec['limesurvey-unzip'],
  }

  file { "${install_path}/tmp/runtime/":
    ensure  => directory,
    mode    => $runtime_dir_mode,
    require => Exec['limesurvey-unzip'],
  }

}
