# Class: limesurvey::database
# ===========================
#
# Manages the MySQL installtion for limesurvey
#
# Parameters
# ----------
#
# * `dbhost`
# Hostname of the MySQL host
#
# * `dbname`
# Name of the database to install for limesurvey
#
# * `dbpassword`
# Password for the limesurvey database user
#
# * `dbuser`
# Username of the limesurvey database user
#
# * `sql_root_password`
# Root password for the MySQL installation
#
# Examples
# --------
#
# @example
#    class { 'limesurvey::database':
#      dbhost            => localhost,
#      dbname            => limesurvey,
#      dbpassword        => foobar,
#      dbuser            => foobar,
#      sql_root_password => foobar,
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
class limesurvey::database (

  $dbhost            = $limesurvey::dbhost,
  $dbname            = $limesurvey::dbname,
  $dbpassword        = $limesurvey::dbpassword,
  $dbuser            = $limesurvey::dbuser,
  $sql_root_password = $limesurvey::sql_root_password,

) {

  class { '::mysql::server':
    root_password           => $sql_root_password,
    remove_default_accounts => true,
  }

  ::mysql::db { $dbname:
    user     => $dbuser,
    password => $dbpassword,
    host     => $dbhost,
    grant    =>  [ 'SELECT', 'UPDATE', 'CREATE', 'INSERT', 'ALTER', 'DELETE', 'DROP', 'INDEX'],
  }

}
