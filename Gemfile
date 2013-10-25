source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.0'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass', '~> 2.3.2.2'
gem 'haml-rails'
gem 'simple_form', '>= 3.0.0.rc'
gem 'unicorn'
gem 'httparty'
gem 'whenever', :require => false

group :production do
  gem 'rails_12factor'
  gem 'pg'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'html2haml'
  gem 'quiet_assets'
  gem 'rails_layout'
end

group :development, :test do
  gem 'mysql2'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'faker', '~> 1.1.2'
end

group :test do
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'webmock'
end
