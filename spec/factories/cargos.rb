FactoryBot.define do
  factory :cargo do
    sequence(:descricao) { |n| "Cargo #{n}" }
    atividades { "Atividades" }
  end
end
