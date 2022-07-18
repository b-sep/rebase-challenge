require 'sidekiq'
require_relative '../lib/import'

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redis:6379' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redis:6379' }
end

class Worker
  include Sidekiq::Worker

  def perform(data)
    Import.from_csv(data)
  end
end