require 'sinatra/base'
require 'rack/handler/puma'
require 'sinatra/activerecord'
require_relative '../worker/worker.rb'

class ApiExam < Sinatra::Base
  set :bind, '0.0.0.0'
  set :port, 3000

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
  
  run! if __FILE__ == $0
end