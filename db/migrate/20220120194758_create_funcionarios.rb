class CreateFuncionarios < ActiveRecord::Migration[6.1]
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :sobrenome
      t.date :data_nascimento
      t.references :cargo, null: false, foreign_key: true
      t.float :salario
      t.date :data_admissao

      t.timestamps
    end
  end
end
