require 'rails_helper'

RSpec.describe Cargo, type: :model do
  it{is_expected.to validate_presence_of(:descricao)}
  it {is_expected.to validate_uniqueness_of(:descricao).case_insensitive}
  it{is_expected.to validate_presence_of(:atividades)}
end
