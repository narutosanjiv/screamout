require "screamout/engine"

module Screamout
  require "bson"
  require "moped"
  Moped::BSON = BSON
  require 'mongoid-rspec'
  require 'simple_form'
  require 'twitter-typeahead-rails'
  require 'jquery-ui-rails'
  require 'imgkit'
  require 'jquery-rails'
  require 'mongoid_taggable'
  require 'mongoid_rateable'
  #require 'mongoid-paperclip'
  #  #s.add_dependency 'jquery-raty-rails'
  require 'sidekiq'
  require 'haml-rails'
  require 'mongoid_paperclip'
  require 'aws-sdk'

end
