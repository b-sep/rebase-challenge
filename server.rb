# frozen_string_literal: true

require 'sinatra'
require 'rack/handler/puma'
require 'csv'
require 'sinatra/activerecord'
require_relative 'models/exam'
require_relative 'import'

get '/tests' do
  return 'Nenhum exame encontrado'.to_json if Exam.all.empty?
  Exam.all.to_json
end

post '/import' do
  begin
    data = request.body.read.force_encoding('utf-8')
    Import.from_csv(data)
    halt 202, 'Arquivo importado com sucesso ;)'.to_json
  rescue
    halt 500, 'Algo aconteceu :('.to_json
  end
end

# Rack::Handler::Puma.run(
#   Sinatra::Application,
#   Port: 3000,
#   Host: '0.0.0.0'
# )
