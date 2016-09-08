# Testing

## Prerequisites

`Docker` and `ruby` need to be installed on the local machine.

## Running Tests

After cloning the repository the testing environment should be set up on the local machine:

```
$ bundle install --path vendor/bundle
$ bundle exec rake
```

With running `rake` the whole testsuite is triggered, this
includes:

  * puppet syntax validation
  * code-style enforcement (with `puppet-lint`)
  * unit-tests (with `rspec-puppet`)
  * acceptance-tests (with `beaker-rspec`)

Check the .travis.yml for details.

## Coding Standards

* All variables are defined in the base manifest (init.pp).
* No more than 140 characters per line.

## Commits

* Fork it, Branch it, Test it, Pull Request it, Technologic.
* Logical commit units.
* Nice clean commit messages.
* Check for whitespaces. I hate whitespaces.
* New Features equals new tests and new documentation.
