# Ruby sample app

This is a sample app designed to be a reference implementation for Bundler
deployment using .rbenv to select ruby versions.  More details on deploying
this app can be found below.

## Preparing the package, or upgrading the gems in a package

* Clone the source
* Ensure .ruby-version is a correct and approved version
* Edit the source and Gemfile as necessary
* Run: 'bundle install --path vendor/bundle --binstubs --clean'
* Test it
* Run: 'bundle package'
* Commit Gemfile, Gemfile.lock, and your source changes
* Commit vendor/cache

## Deploying Ruby apps in our build environment

This part of the install will make the project, at a minimum, machine specific, and additionally target specific if any of your gems are native. From within your running job if using CI or on the production server, do the following:

* Checkout project with vendor/cache into workspace
* In the root of the project, inside the workspace, run:

    $ bundle install --path vendor/bundle --binstubs --local --clean

## Running the app

Simply run your app using 'bundle exec' or from the binstub.

    $ ./bin/rake
