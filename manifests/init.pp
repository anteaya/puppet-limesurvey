# Class: limesurvey
# ===========================
#
# Manages the installation and configuration of Limesurvey
# Optionally with MySQL and Apache2/PHP
#
# Parameters
# ----------
#
# * `install_path`
# Combination of archive_path and dir_name
#
# * `download_url`
# Where to download the limesurey code from.
#
# * `version`
# What version to download.
#
# * `runtime_dir_mode`
# Mode of the limesurey runtime directory. Default is 0766,
#
# * `www_user
# Which owner to set to the limesurver directory
#
# * `www_group`
# Which group to set to the limesurver directory
#
# * `manage_database`
# To enable custom database code
#
# * `manage_webserver`
# To enable custom webserver code
#
# * `manage_php`
# To enable custom PHP code
#
# Examples
# --------
#
# @example
# class { 'limesurvey':
#  dbname            => 'limesurvey',
#  dbpassword        => 'foobar',
#  dbuser            => 'lemongrab',
#  sql_root_password => 'foobar',
#  www_user          => 'www-data',
#  www_group         => 'www-data',
#  manage_webserver  => false,
#  manage_database   => true,
#  manage_php        => true,
# }
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
class limesurvey (

  $install_path,
  $download_url,
  $version,
  $runtime_dir_mode,
  $www_group,
  $www_user,

  $manage_database,
  $manage_webserver,
  $manage_php,

  $dbuser            = undef,
  $sql_root_password = undef,
  $vhost_name        = undef,
  $vhost_port        = undef,
  $mpm_module        = undef,
  $php_packages        = undef,
  $dbhost            = undef,
  $dbname            = undef,
  $dbpassword        = undef,

  $database_class    = 'limesurvey::database',
  $webserver_class   = 'limesurvey::webserver',
  $php_class         = 'limesurvey::php',

  $vhost_docroot     = $install_path,

) {

  contain 'limesurvey::extract'

  if $manage_database {
    contain $database_class
  }

  if $manage_webserver {
    contain $webserver_class
  }

  if $manage_php {
    contain $php_class
  }

}
