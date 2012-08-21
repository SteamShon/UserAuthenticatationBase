source 'https://rubygems.org'

gem 'rails'
gem 'bootstrap-sass', '2.0.0'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.0.1'
gem 'will_paginate', '3.0.3'
gem 'bootstrap-will_paginate', '0.0.6'
gem "paperclip", "~> 3.0"
gem 'geocoder'
gem 'acts_as_votable'
gem 'omniauth-facebook'
gem 'gmaps4rails'
gem 'faye'
gem 'thin'
gem 'lazy_high_charts', '~> 1.1.5'
gem 'jquery-rails'
gem 'heroku'

group :assets do
	gem 'jquery-ui-rails'
end

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.4'
  gem 'coffee-rails', '3.2.2'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '1.2.3'
end

group :test, :development do
	gem 'rspec-rails', '2.10.0'
	gem 'guard-rspec', '0.5.5'
	gem 'guard-spork', '0.3.2'
	gem 'spork', '0.9.0'
end
group :test do
	gem 'rspec-rails', '2.10.0'
	gem 'capybara', '1.1.2'
	gem 'rb-fsevent', '~> 0.9.1', require: false
	gem 'growl', '1.0.3'
  	gem 'factory_girl_rails', '1.4.0'
	gem 'cucumber-rails', '1.2.1', require: false
	gem 'database_cleaner', '0.7.0'
end

group :production do
	gem 'pg'
end

group :development, :test do
	gem 'sqlite3'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
