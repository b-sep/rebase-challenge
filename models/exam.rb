# frozen_string_literal: true
require 'debug'

class Exam < ActiveRecord::Base

  def self.find_and_format(token)
    patient = Exam.select(:token_exam_result, :exam_date, :cpf, :patient_name, :patient_email, :patient_birth_date).where("token_exam_result = ?", token).first
    doctor = Exam.select(:doctor_registration, :doctor_registration_state, :doctor_name).where("token_exam_result = ?", token).first
    tests = Exam.select(:exam_type, :exam_limit, :exam_result).distinct.where("token_exam_result = ?", token)
    hash_test = tests.map do |test|
                  { 
                    "test_type": test[:exam_type],
                    "test_limits": test[:exam_limit],
                    "result": test[:exam_result] 
                  }
                end
             
    { 
      "result_token": "#{patient[:token_exam_result]}",
      "result_date": "#{patient[:exam_date]}",
      "cpf": "#{patient[:cpf]}",
      "name": "#{patient[:patient_name]}",
      "email": "#{patient[:patient_email]}",
      "birthday": "#{patient[:patient_birth_date]}",
      "doctor": {
        "crm": "#{doctor[:doctor_registration]}",
        "crm_state": "#{doctor[:doctor_registration_state]}",
        "name": "#{doctor[:doctor_name]}"
      },
      "tests": hash_test.map {|hash| hash}
    }.to_json
  end
end
