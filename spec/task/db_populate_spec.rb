require 'spec_helper'

describe 'populate database' do
  it 'successfully' do
    csv_file = [{
                  cpf: '048.973.170-88',
                  nome_paciente: 'Emilly Batista Neto',
                  email_paciente: 'gerald.crona@ebert-quigley.com',
                  data_nascimento_paciente: '2001-03-11',
                  endereorua_paciente: '165 Rua Rafaela',
                  cidade_paciente: 'Ituverava',
                  estado_patiente: 'Alagoas',
                  crm_mdico: 'B000BJ20J4',
                  crm_mdico_estado: 'PI',
                  nome_mdico: 'Maria Luiza Pires',
                  email_mdico: 'denna@wisozk.biz',
                  token_resultado_exame: 'IQCZ17',
                  data_exame: '2021-08-05',
                  tipo_exame: 'hemácias',
                  limites_tipo_exame: '45-52',
                  resultado_tipo_exame: '97'
                },
                {
                  cpf: '071.488.453-78',
                  nome_paciente: 'Antônio Rebouças',
                  email_paciente: 'adalberto_grady@feil.org',
                  data_nascimento_paciente: '1999-04-11',
                  endereorua_paciente: '25228 Travessa Ladislau',
                  cidade_paciente: 'Tefé',
                  estado_patiente: 'Sergipe',
                  crm_mdico: 'B0002W2RBG',
                  crm_mdico_estado: 'SP',
                  nome_mdico: 'Dra. Isabelly Rêgo',
                  email_mdico: 'diann_klein@schinner.org',
                  token_resultado_exame: 'AIWH8Y',
                  data_exame: '2021-06-29',
                  tipo_exame: 'ácido úrico',
                  limites_tipo_exame: '15-61',
                  resultado_tipo_exame: '43'
                }]
    
    allow(CSV).to receive(:read).and_return(csv_file)
    Rake::Task['db:populate'].execute

    expect(Exam.all.size).to eq 2
    expect(Exam.first.cpf).to eq '048.973.170-88'
    expect(Exam.last.cpf).to eq '071.488.453-78'
  end
end