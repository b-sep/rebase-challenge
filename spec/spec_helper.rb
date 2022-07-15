ENV["RACK_ENV"] = "test"
require 'rubygems'
require 'bundler'
Bundler.require(:default, :test)

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
