ENV["RACK_ENV"] = "test"
require_relative '../lib/server'
require "sidekiq/testing"
require 'rubygems'
require 'bundler'
Bundler.require(:test)

def app
  ApiExam
end

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.before(:suite) do
    Rake.load_rakefile './Rakefile'
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |clean|
    DatabaseCleaner.cleaning do
      clean.run
    end
  end
end
