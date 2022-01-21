FactoryBot.define do
  factory :funcionario do
    nome { Faker::Name.first_name  }
    sobrenome { Faker::Name.middle_name }
    data_nascimento { "2022-01-20" }
    cargo
    salario { 1.5 }
    data_admissao { "2022-01-20" }
  end
end
