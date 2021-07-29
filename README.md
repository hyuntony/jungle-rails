# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of learning Rails by example.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 
* PostgreSQL
* Stripe
* Sass-rails
* Jquery-rails
* Turbolinks
* Bcrypt
* Bootstrap-sass
* Faker
* Money Rails

## Test Framework/libraries

* Rspec-rails
* Capybara
* Poltergeist
* Database cleaner

## Screenshots

Main Page
!["Jungle Main Page"](https://github.com/hyuntony/jungle-rails/blob/master/docs/Jungle%20Main%20Page.png?raw=true)

Admin Page
!["Jungle Admin Page"](https://github.com/hyuntony/jungle-rails/blob/master/docs/Jungle%20Admin%20Page.png?raw=true)

Cart Checkout Page
!["Jungle Cart Checkout"](https://github.com/hyuntony/jungle-rails/blob/master/docs/Jungle%20Cart%20Checkout.png?raw=true)
