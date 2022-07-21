require 'spec_helper'

describe 'Exam' do
  it '#find_and_format' do
    json = JSON.parse(File.read('spec/support/exam_detail.json'))

    Exam.create!(cpf: '048.973.170-88', patient_name: 'Emilly Batista Neto', patient_email: 'gerald.crona@ebert-quigley.com', patient_birth_date: '2001-03-11', patient_address: '165 Rua Rafaela', patient_city: 'Ituverava', patient_state: 'Alagoas', doctor_registration: 'B000BJ20J4', doctor_registration_state: 'PI', doctor_name: 'Maria Luiza Pires', doctor_email: 'denna@wisozk.biz', token_exam_result: 'IQCZ17', exam_date: '2021-08-05', exam_type: 'hemácias', exam_limit: '45-52', exam_result: '97')

    Exam.create!(cpf: '048.973.170-88', patient_name: 'Emilly Batista Neto', patient_email: 'gerald.crona@ebert-quigley.com', patient_birth_date: '2001-03-11', patient_address: '165 Rua Rafaela', patient_city: 'Ituverava', patient_state: 'Alagoas', doctor_registration: 'B000BJ20J4', doctor_registration_state: 'PI', doctor_name: 'Maria Luiza Pires', doctor_email: 'denna@wisozk.biz', token_exam_result: 'IQCZ17', exam_date: '2021-08-05', exam_type: 'ácido úrico', exam_limit: '15-61', exam_result: '43')
   
    expect(JSON.parse(Exam.find_and_format('IQCZ17'))).to eq json
  end
end