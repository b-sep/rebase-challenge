require 'sinatra'
require 'rack/handler/puma'
require 'sinatra/activerecord'
require 'sidekiq'
require_relative '../worker/worker.rb'


get '/tests' do
  return 'Nenhum exame encontrado'.to_json if Exam.all.empty?
  Exam.all.to_json
end

post '/import' do
  begin
    data = request.body.read.force_encoding('utf-8')
    Worker.perform_async(data)
    halt 200, 'Arquivo recebido com sucesso ;)'.to_json
  rescue
    halt 500, 'Algo aconteceu :('.to_json
  end
end

Rack::Handler::Puma.run(
  Sinatra::Application,
  Port: 3000,
  Host: '0.0.0.0'
)

