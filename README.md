# Jungle

Jungle is a mini e-commerce application built with Rails 4.2.
 
As a user you can log in or sign up, add to your cart, check out and see your order history.
If you encounter errors, they will be displayed so you may correct your information.
![User Gif](https://raw.githubusercontent.com/0lgaP/jungle-rails/master/Readme_assets/jungle-sign-buy.gif)

As an admin you can create products and categories as well as see your curent stats via the dashboard.
![Admin Gif](https://raw.githubusercontent.com/0lgaP/jungle-rails/master/Readme_assets/jungle-admin.gif)

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

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
