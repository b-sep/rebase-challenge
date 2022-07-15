ENV['RACK_ENV'] = 'test'
require 'rack/test'
require 'rake'
require 'debug'

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.before(:suite) do
    Rake.load_rakefile './Rakefile'
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.strategy = :transaction
  end

  config.around(:each) do |clean|
    DatabaseCleaner.cleaning do
      clean.run
    end
  end
end
