FactoryBot.define do
  factory :funcionario do
    nome { "MyString" }
    sobrenome { "MyString" }
    data_nascimento { "2022-01-20" }
    cargo { nil }
    salario { 1.5 }
    data_admissao { "2022-01-20" }
  end
end
