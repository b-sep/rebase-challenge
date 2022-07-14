# frozen_string_literal: true

require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require_relative 'models/exam.rb'
require 'csv'

namespace :db do
  task :populate do
    rows = CSV.read('./data.csv', col_sep: ';', headers: true, header_converters: :symbol)
    rows.each do |rows|
      Exam.create!(cpf: rows[:cpf], patient_name: rows[:nome_paciente], patient_email: rows[:email_paciente], patient_birth_date: rows[:data_nascimento_paciente], patient_address: rows[:endereorua_paciente], patient_city: rows[:cidade_paciente], patient_state: rows[:estado_patiente], doctor_registration: rows[:crm_mdico], doctor_registration_state: rows[:crm_mdico_estado], doctor_name: rows[:nome_mdico], doctor_email: rows[:email_mdico], token_exam_result: rows[:token_resultado_exame], exam_date: rows[:data_exame], exam_type: rows[:tipo_exame], exam_limit: rows[:limites_tipo_exame], exam_result: rows[:resultado_tipo_exame])
    end
  end
end
