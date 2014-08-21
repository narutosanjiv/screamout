$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "screamout/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "screamout"
  s.version     = Screamout::VERSION
  s.authors     = ["Josh Software"]
  s.email       = ["test@joshsoftware.com"]
  s.homepage    = ""
  s.summary     = "Rails engine."
  s.description = "Rails engine for online information sharing"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.1"
  s.add_dependency 'rspec-rails'
  s.add_dependency 'mongoid-rspec'
  s.add_dependency 'simple_form'
  s.add_dependency 'twitter-typeahead-rails'
  s.add_dependency 'jquery-ui-rails'
  s.add_dependency 'imgkit'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'mongoid_taggable'
  s.add_dependency 'mongoid_rateable'
  s.add_dependency 'mongoid-paperclip'
  s.add_dependency 'aws-sdk', '~> 1.3.4'

  s.add_dependency 'sidekiq'
  s.add_dependency 'haml-rails'
  s.add_dependency 'bson'
end
