# limesurvey

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with limesurvey](#setup)
    * [Beginning with limesurvey](#beginning-with-limesurvey)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module installs Limesurvey from the limesurvey.org website..

Optionally MySQL and Apache2 are installed and managed by this module. However, both classes can be overwritten.

## Setup

### Beginning with limesurvey

Basically this module downloads the code from limesurey.org and places it into the specified directory.
Without the database class included you need to install and manage the database by yourself. Same for the websever and PHP.

## Usage

A basic example using both webserver and database
```puppet
        class { 'limesurvey':
            dbname            => 'limesurvey',
            dbpassword        => 'foobar',
            dbuser            => 'lemongrab',
            sql_root_password => 'foobar',
            manage_webserver  => false,
        }
```

## Reference

## Classes

#### Public classes

* [`limesurey::init`]: Installs and configures Limesurvey.
* [`limesurey::extract`]: Downloads the code from limesurey.org
* [`limesurey::config`]: Manages the configuration of Limesurvey.
* [`limesurey::database`]: Installs and configures a MySQL database.
* [`limesurey::webserver`]: Installs and configures an Apacha2 webserver.
* [`limesurey::php`]: Installs the required PHP packages.

For details on parameters see manifests

## Limitations

This module has been tested on:
* Debian 7, 8

Using Puppet >=4.5

The CentOS Build needs fixing, but the module should work.

## Development

For further details see CONTRIBUTING.md

## Authors

* Markus Opolka
