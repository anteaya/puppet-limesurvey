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

  String $install_path,
  String $download_url,
  String $version,
  String $runtime_dir_mode,
  String $www_group,
  String $www_user,

  Boolean $manage_database,
  Boolean $manage_webserver,
  Boolean $manage_php,

  Optional[String] $dbuser            = undef,
  Optional[String] $sql_root_password = undef,
  Optional[String] $vhost_name        = undef,
  Optional[String] $vhost_port        = undef,
  Optional[String] $mpm_module        = undef,
  Optional[Hash] $php_packages        = undef,
  Optional[String] $dbhost            = undef,
  Optional[String] $dbname            = undef,
  Optional[String] $dbpassword        = undef,

  String $database_class    = 'limesurvey::database',
  String $webserver_class   = 'limesurvey::webserver',
  String $php_class         = 'limesurvey::php',

  String $vhost_docroot     = $install_path,

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
