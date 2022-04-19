# Jungle

Jungle is a mini e-commerce application built with Rails 4.2. This project simulates inheriting an existing code base in a language/framework that you are not comfortable/familiar with, then impementing features and fixes.
 
## As a user 
You can log in or sign up, add to your cart, check out and see your order history.
If you encounter errors, they will be displayed so you may correct your information.
![User Gif](https://raw.githubusercontent.com/0lgaP/jungle-rails/master/Readme_assets/jungle-sign-buy.gif)

## As an admin 
You can create products and categories as well as see your curent stats via the dashboard.
![Admin Gif](https://raw.githubusercontent.com/0lgaP/jungle-rails/master/Readme_assets/jungle-admin.gif)

## Contributions to Project
Feature - Product Sold Out <br>
* Sold out badge on product panel 
* Disabled add to cart button if sold out 

Feature - Admin Category Routes & Creation <br>
* Added ability for admin to create new categories
* Added list of currently existing categories

Feature - User Authentication <br>
* Added user table to database
* Implemented user registration & login

Feature - Order Details Upon Checkout <br>
* After successful order, user is now shown a page displaying detailed order info

Feature - Admin Authentication <br>
* Implemented admin authentication to be able to access admin area

Feature - Error Message <br>
* Detailed error messages appear when user has entered registration information that does not comply with the database requirements.

Bug Fix - Checking out With Empty Cart <br>
* User does not see the checkout button when cart is empty
* Instead a message is shown telling them that their cart is currently empty

Testing - Implemented Model Tests & Feature Tests <br>
* Added model testing for users and products
* Test that user sees products on the homepage
* Test that a user can navigate to a product details page
* Test that a user can add a product to their cart
* Test that a user can succesfully login

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
