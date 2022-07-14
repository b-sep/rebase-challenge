# frozen_string_literal: true

require 'sinatra'
require 'rack/handler/puma'
require 'csv'
require 'sinatra/activerecord'
require_relative 'models/exam.rb'

get '/tests' do
  Exam.all.to_json
end

Rack::Handler::Puma.run(
  Sinatra::Application,
  Port: 3000,
  Host: '0.0.0.0'
)
