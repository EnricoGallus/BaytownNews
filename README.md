# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    
``3.2.2``
Also specified in ``.ruby-version``

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

``rails test``

* Services (job queues, cache servers, search engines, etc.)

# Deployment instructions

## Development

### architecture issues
Therefor that the bundler is executed locally on an arm platform, the linux platform is missing in the bundler lockfile.
Add it by executing the following command ``bundle lock --add-platform x86_64-linux``

### Github Actions

Each push or pull-request in github will trigger a github-action that runs all security checks and linters.
It will also run all the projects tests.


# Development Process

## Importmaps

Using importmaps and added bootstrap to it

## Rubocop - Securing a coding style

1. Added rubocop-gem.
2. Executed ``bundle exec rubocop -a`` as well as ``bundle exec rubocop --autocorrect-all``
3. Executed ``bundle exec rubocop --auto-gen-config`` which generated `.rubocop.yml` and `.rubocop_todo.yml`

Use `.rubocop_todo.yml` for ignoring violations temporarily and `.rubocop.yml` for general overwrites or custom definitions

Executable with ``rubocop`` 

## Brakeman - static security analysis

1. Added the gem

Executable with ``brakeman``

## erblint - analysis for erb.html files

1. Added the gem

Executable with ``erblint --lint-all --enable-all-linters``

## Bundler-Audit - list gem vulnerabilities

1. Added the gem

Executable with ``bundler audit``
