
# Paolog (aka Paolo el loggero)

## Disclaimer

This project has been based on [browserlog gem](https://travis-ci.org/dieb/browserlog). It has been adapted to work with Rails 5.

Paolog is a live web log viewer for Rails apps.

## Installation

The simplest way to install Paolog is to use [Bundler](http://bundler.io).

```ruby
gem 'paolog'
```

Paolog is bundled as a Rails engine. Mount it on `config/routes.rb`.

```ruby
MyApp::Application.routes.draw do
  mount Paolog::Engine => '/paolog'
end
```

With this setup ``logs/development``, ``logs/staging``, ``logs/production`` and ``logs/test`` are automatically available on the browser.

## Limit
By default, paolog with display your last 100 lines of your log. If you
want to see more lines you can use the `limit` parameter: `/paolog?limit=150`


## Note for production environments

For most production environments, it's recommended to not serve logs without authentication. This gem blocks by default any requests to ``logs/*`` in such production environment (i.e. ``RAILS_ENV=production``).

In case you want to allow those logs to be displayed under production (e.g. staging servers), use the following initializer:

```ruby
# config/initializers/allow_logs_on_production.rb
Paolog.config.allow_production_logs = true
```

## Authentication
The gem uses HTTP Basic Authentication method. In order to work you
should `user` and `password` in your encrypted credentials as follows:

```ruby
paolog:
  user: paolo
  password: elloggero
```

## Supported Rails Versions
* Rails >= 4
