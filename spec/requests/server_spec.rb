require 'spec_helper'

describe 'GET /tests' do
  it 'return all exams' do
    Exam.create!(cpf: '048.973.170-88', patient_name: 'Emilly Batista Neto', patient_email: 'gerald.crona@ebert-quigley.com', patient_birth_date: '2001-03-11', patient_address: '165 Rua Rafaela', patient_city: 'Ituverava', patient_state: 'Alagoas', doctor_registration: 'B000BJ20J4', doctor_registration_state: 'PI', doctor_name: 'Maria Luiza Pires', doctor_email: 'denna@wisozk.biz', token_exam_result: 'IQCZ17', exam_date: '2021-08-05', exam_type: 'hemácias', exam_limit: '45-52', exam_result: '97')

    Exam.create!(cpf: '071.488.453-78', patient_name: 'Antônio Rebouças', patient_email: 'adalberto_grady@feil.org', patient_birth_date: '1999-04-11', patient_address: '25228 Travessa Ladislau', patient_city: 'Tefé', patient_state: 'Sergipe', doctor_registration: 'B0002W2RBG', doctor_registration_state: 'SP', doctor_name: 'Dra. Isabelly Rêgo', doctor_email: 'diann_klein@schinner.org', token_exam_result: 'AIWH8Y', exam_date: '2021-06-29', exam_type: 'ácido úrico', exam_limit: '15-61', exam_result: '43')

    get '/tests'
    
    json_response = JSON.parse(last_response.body)

    expect(json_response.size).to eq 2
    expect(json_response.first["cpf"]).to eq '048.973.170-88'
    expect(json_response.last["cpf"]).to eq '071.488.453-78'
    expect(last_response.status).to eq 200
  end

  it 'return a empty json if database is empty' do

    get '/tests'

    expect(JSON.parse(last_response.body)).to include 'Nenhum exame encontrado'
  end
end
