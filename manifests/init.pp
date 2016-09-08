# Class: limesurvey
# ===========================
#
# Manages the installation and configuration of Limesurvey
# Optionally with MySQL and Apache2/PHP
#
# Parameters
# ----------
#
# * `archive_path`
# Name of path to extract to
#
# * `dir_name`
# Name of directory to extract to
#
# * `install_path`
# Combination of archive_path and dir_name
#
# * `download_url`
# Where to download the limesurey code from.
# Note: They seem to change that quite often. Be aware.
#
# * `extract_path`
# Target folder path to extract archive
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

  String $archive_path,
  String $dir_name,
  String $download_url,
  String $extract_path,
  String $file_name,
  String $runtime_dir_mode,
  String $www_group,
  String $www_user,

  Boolean $manage_database,
  Boolean $manage_webserver,
  Boolean $manage_php,

  Optional[String] $dbhost,
  Optional[String] $dbname,
  Optional[String] $dbpassword,
  Optional[String] $dbuser,
  Optional[String] $sql_root_password,
  Optional[String] $vhost_name,
  Optional[String] $vhost_port,
  Optional[String] $mpm_module,
  Optional[Hash] $php_packages,

  String $database_class    = 'limesurvey::database',
  String $webserver_class   = 'limesurvey::webserver',
  String $php_class         = 'limesurvey::php',

  String $install_path      = "${extract_path}${dir_name}",
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
