require 'spec_helper'
require_relative '../../lib/import'

describe 'Import' do
  it '#parse_file' do
    headers = [:cpf, :nome_paciente, :email_paciente, :data_nascimento_paciente, :endereorua_paciente, :cidade_paciente, :estado_patiente, :crm_mdico, :crm_mdico_estado, :nome_mdico, :email_mdico, :token_resultado_exame, :data_exame, :tipo_exame, :limites_tipo_exame, :resultado_tipo_exame]
    file = File.open('spec/support/data_test.csv')

    parsed_file = Import.parse_file(file)
    
    expect(parsed_file.class).to eq CSV::Table
    expect(parsed_file.map {|row| row[:cpf]}.size).to eq 2
    expect(parsed_file.map {|row| row[:cpf]}.first).to eq "089.445.170-88"
    expect(parsed_file.map {|row| row[:cpf]}.last).to eq "048.973.170-88"
    expect(parsed_file.headers).to eq headers
  end

  it '#from_csv' do
    file = File.open('spec/support/data_test.csv')

    Import.from_csv(file)

    expect(Exam.all.size).to eq 2
    expect(Exam.first.cpf).to eq '089.445.170-88'
    expect(Exam.last.cpf).to eq '048.973.170-88'
  end
end