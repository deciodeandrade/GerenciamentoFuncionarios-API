require 'rails_helper'

RSpec.describe Funcionario, type: :model do
  it{is_expected.to validate_presence_of(:nome)}
  it{is_expected.to validate_presence_of(:sobrenome)}
  it{is_expected.to validate_presence_of(:data_nascimento)}
  it{is_expected.to belong_to(:cargo)}
  it{is_expected.to validate_presence_of(:salario)}
  it{is_expected.to validate_presence_of(:data_admissao)}
end
