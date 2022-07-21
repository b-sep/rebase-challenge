require 'sinatra/base'
require 'rack/handler/puma'
require 'sinatra/activerecord'
require_relative '../worker/worker.rb'
require 'debug'

class ApiExam < Sinatra::Base
  set default_content_type: 'json'
  set :bind, '0.0.0.0'
  set :port, 3000

  get '/tests' do
    return 'Nenhum exame cadastrado'.to_json if Exam.all.empty?
    Exam.all.to_json(except: %i[id])
  end

  post '/import' do
    return 400, 'Por favor envie um arquivo'.to_json if params.empty?
    begin
      data = request.body.read.force_encoding('utf-8')
      Worker.perform_async(data)
      status 200
      body 'Arquivo recebido com sucesso ;)'.to_json
    rescue
      status 500
      body 'Algo aconteceu :('.to_json
    end
  end

  get '/tests/:token' do
    return 404, "Nenhum exame encontrado com o código #{params['token']}".to_json if Exam.find_by(token_exam_result: params['token']).nil?
    Exam.find_and_format(params['token'])
  end
  
  run! if __FILE__ == $0
end