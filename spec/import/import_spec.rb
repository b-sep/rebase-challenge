require 'spec_helper'
require_relative '../../lib/import'

describe 'Import' do
  it '#parse_file' do
    file = File.open('spec/support/data_test.csv')

    parsed_file = Import.parse_file(file)
    
    expect(parsed_file.class).to eq CSV::Table
    expect(parsed_file.map {|row| row[:cpf]}.size).to eq 2
    expect(parsed_file.map {|row| row[:patient_name]}.size).to eq 2
    expect(parsed_file.map {|row| p row[:cpf]}.first).to include "089.445.170-88"
    expect(parsed_file.map {|row| p row[:cpf]}.last).to include "048.973.170-88"
  end

  it '#from_csv' do
    file = File.open('spec/support/data_test.csv')

    Import.from_csv(file)

    expect(Exam.all.size).to eq 2
    expect(Exam.first.cpf).to eq '089.445.170-88'
    expect(Exam.last.cpf).to eq '048.973.170-88'
  end
end