# Bundler sample app

This is a sample app designed to be a reference implementation for Bundler
deployment using .rbenv to select ruby versions.  More details on deploying
this app can be found below.

## Preparing the package

* Clone the source
* Ensure .ruby-version is a correct and approved version
* Edit the source and Gemfile as necessary
* Run: 'bundle install --path vendor/bundle --binstubs --clean'
* Test it
* Run: 'bundle package'
* Commit Gemfile, Gemfile.lock, and your source changes
* Commit vendor/cache

NOTE: The same proceedure applies for updating the gems in the app.

## Deploying Ruby apps in our build environment

This part of the install will make the project, at a minimum, machine specific, and additionally target specific if any of your gems are native. From within your running job if using CI or on the production server, do the following:

* Checkout project with vendor/cache into workspace
* In the root of the project, inside the workspace, run:

        $ bundle install --path vendor/bundle --binstubs --local --clean

## Running the app

Ensure that rbenv is in your path and simply run your app using 'bundle exec' or from the binstub.

    $ export PATH=~/.rbenv/shims:~/.rbenv/bin:"$PATH"
    $ ./bin/rake

## Appendix A: Install rbenv

Rbenv can be installed using the instructions located here: https://github.com/sstephenson/rbenv .  In our build environments, rbenv was initailly installed using the following proceedure, with an 'rbenv install' for each approved ruby version.

    $ git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    $ git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

    $ export PATH=~/.rbenv/shims:~/.rbenv/bin:"$PATH"
    $ rbenv install 1.9.3-p448
    $ echo 1.9.3-p448 >~/.rbenv/version
    $ gem install -v 1.3.5 bundler
    $ rbenv rehash

A cached copy exists here: https://github.com/ffdc-scm/rbenv-x86_64-linux.git

NOTE: When running the above on linux use the following yum packages:

    $ yum install -y gcc-c++ glibc-headers openssl-devel readline libyaml-devel readline-devel zlib zlib-devel
