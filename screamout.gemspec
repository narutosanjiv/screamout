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

  s.add_dependency "rails", "~> 5.0.0"
  s.add_dependency 'mongoid', "~> 6.0.0.beta"
  s.add_dependency 'jquery-ui-rails'
  s.add_dependency 'imgkit'
  s.add_dependency 'jquery-rails'

end
