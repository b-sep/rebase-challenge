require 'sidekiq'
require 'sidekiq/web'

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redis:6379' }
end

use Rack::Session::Cookie
run Sidekiq::Web