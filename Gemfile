# Gems host
source 'http://rubygems.org'

gem 'rails', '3.0.9'                    # At least 3.0.7 but below 3.1
gem 'rake', '~> 0.9.2'
gem 'mysql2', '< 0.3'                   # Database engine.  3.0 is not compatible with Rails 3.0.x
gem 'hirb'                              # Better console formatting. Needs .hirbrc

gem 'capistrano'                        # Deployment manager

gem 'haml', '~> 3.1'                    # Haml (html/erb replacement)
gem 'sass', '~> 3.1'                    # Sass (css replacement)
gem 'haml-rails'                        # Haml generators for Rails 3
gem 'hpricot'                           # Support Haml generation
gem 'ruby_parser'                       # Support Haml generation

gem 'jammit'                            # Static asset packager
gem 'flutie'                            # Sensible style defaults

gem 'nifty-generators'                  # Useful Rails generators
gem 'formtastic'                        # Semantic forms

gem 'compass', '>= 0.10.6'              # Object Oriented CSS
gem 'html5-boilerplate'                 # Paul Irish HTML5 Boilerplate

gem 'friendly_id', '~> 3.2'             # Human readable URLs
gem 'validates_existence', '~> 0.5'     # Validation of associations

gem 'devise', '1.2.0'                   # Authentication
gem 'omniauth', '0.2.0'                 # OAuth

gem 'delayed_job'                       # Background tasks

gem 'hoptoad_notifier'

group :development, :test do
  gem 'factory_girl_rails', '~> 1.0'
  gem 'factory_girl_generator'
  gem 'rspec-rails', '~> 2.5'
  gem 'rcov'
  gem 'forgery'                         # Easy generation of fake data
# gem 'pow'                             # Dev server
# gem 'powder'                          # Pow helpers
  gem 'thin'
end
