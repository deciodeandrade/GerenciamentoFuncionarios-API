class Funcionario < ApplicationRecord
  belongs_to :cargo

  validates :nome, presence: true
  validates :sobrenome, presence: true
  validates :data_nascimento, presence: true
  validates :salario, presence: true, numericality: {greater_than: 0} 
  validates :data_admissao, presence: true
end
