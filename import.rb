require 'sinatra'
require 'rack/handler/puma'
require 'csv'
require 'sinatra/activerecord'
require_relative 'models/exam'

class Import
  def self.parse_file(csv)
    csv_parse = CSV.parse(csv, col_sep: ';', headers: true, header_converters: :symbol)
  end

  def self.from_csv(csv)
    csv_parse = parse_file(csv)
    csv_parse.each do |row|
      Exam.create!(cpf: row[:cpf], patient_name: row[:nome_paciente], patient_email: row[:email_paciente],
                    patient_birth_date: row[:data_nascimento_paciente], patient_address: row[:endereorua_paciente], patient_city: row[:cidade_paciente], patient_state: row[:estado_patiente], doctor_registration: row[:crm_mdico], doctor_registration_state: row[:crm_mdico_estado], doctor_name: row[:nome_mdico], doctor_email: row[:email_mdico], token_exam_result: row[:token_resultado_exame], exam_date: row[:data_exame], exam_type: row[:tipo_exame], exam_limit: row[:limites_tipo_exame], exam_result: row[:resultado_tipo_exame])
    end
  end
end
