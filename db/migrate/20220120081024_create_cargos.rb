class CreateCargos < ActiveRecord::Migration[6.1]
  def change
    create_table :cargos do |t|
      t.string :descricao
      t.text :atividades

      t.timestamps
    end
  end
end
