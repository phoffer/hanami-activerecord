source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.0'
gem 'activerecord', '~> 5.1.0'
gem 'active_record_migrations', '~> 5.0.2.1', require: false
gem 'pg'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
end

group :test do
  gem 'minitest'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
