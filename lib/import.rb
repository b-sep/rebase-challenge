require 'csv'
require 'sinatra/activerecord'
require_relative '../models/exam'

class Import
  MAPPING = { cpf: :cpf, patient_name: :nome_paciente, patient_email: :email_paciente, patient_birth_date: :data_nascimento_paciente, patient_address: :endereorua_paciente, patient_city: :cidade_paciente, patient_state: :estado_patiente, doctor_registration: :crm_mdico, doctor_registration_state: :crm_mdico_estado, doctor_name: :nome_mdico, doctor_email: :email_mdico, token_exam_result: :token_resultado_exame, exam_date: :data_exame, exam_type: :tipo_exame, exam_limit: :limites_tipo_exame, exam_result: :resultado_tipo_exame }

  class << self
    def parse_file(file)
      csv_parse = CSV.parse(file, col_sep: ';', headers: true, header_converters: :symbol)
    end

    def from_csv(file)
      csv_parse = parse_file(file)
      csv_parse.each do |row|
        attrs = MAPPING.transform_values { |value| row[value] }
        Exam.create!(attrs)
      end
    end
  end

end
