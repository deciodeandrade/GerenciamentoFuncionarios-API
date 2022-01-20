class Cargo < ApplicationRecord
    validates :descricao, presence: true, uniqueness: {case_sensitive: false}
    validates :atividades, presence: true
end
