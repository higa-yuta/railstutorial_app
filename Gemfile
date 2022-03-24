source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.5"

gem "rails", "~> 7.0.1"
# gem "sprockets-rails"
gem "bootstrap-sass"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'haml-rails'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "byebug", platforms: %i[ mri mingw x64_mingw ]
  gem "sqlite3", "~> 1.4"
  gem "pry-rails"
  
  # https://github.com/ruby/net-imap/issues/16
  gem "net-http"
end

group :development do
  gem "web-console"
  # Notify you of changes.
  gem 'listen'
  gem "spring", '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'annotate'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara",                 '3.28.0'
  gem "selenium-webdriver",       '3.142.4'
  gem "webdrivers",               '4.1.2'
  gem 'rails-controller-testing', '1.0.4'
  gem 'minitest',                 '5.11.3'
  gem 'minitest-reporters',       '1.3.8'
  gem 'guard',                    '2.16.2'
  gem 'guard-minitest',           '2.4.6'     
  # gem 'ruby_gntp'     
end

group :production do
  gem 'pg', '1.1.4'
end
