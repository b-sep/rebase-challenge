# frozen_string_literal: true

class CreateExam < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :cpf
      t.string :patient_name
      t.string :patient_email
      t.string :patient_birth_date
      t.string :patient_address
      t.string :patient_city
      t.string :patient_state
      t.string :doctor_registration
      t.string :doctor_registration_state
      t.string :doctor_name
      t.string :doctor_email
      t.string :token_exam_result
      t.string :exam_date
      t.string :exam_type
      t.string :exam_limit
      t.string :exam_result
    end
  end
end
