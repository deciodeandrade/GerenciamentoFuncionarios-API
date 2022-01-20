class Cargo < ApplicationRecord
    has_many :funcionarios

    validates :descricao, presence: true, uniqueness: {case_sensitive: false}
    validates :atividades, presence: true
end
