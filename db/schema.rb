# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_220_713_213_726) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'exams', force: :cascade do |t|
    t.string 'cpf'
    t.string 'patient_name'
    t.string 'patient_email'
    t.string 'patient_birth_date'
    t.string 'patient_address'
    t.string 'patient_city'
    t.string 'patient_state'
    t.string 'doctor_registration'
    t.string 'doctor_registration_state'
    t.string 'doctor_name'
    t.string 'doctor_email'
    t.string 'token_exam_result'
    t.string 'exam_date'
    t.string 'exam_type'
    t.string 'exam_limit'
    t.string 'exam_result'
  end
end
