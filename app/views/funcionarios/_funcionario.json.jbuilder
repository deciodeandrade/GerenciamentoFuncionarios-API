#json.extract! funcionario, :id, :nome, :sobrenome, :data_nascimento, :cargo, :salario, :data_admissao

json.id funcionario.id
json.nome funcionario.nome
json.sobrenome funcionario.sobrenome
json.data_nascimento funcionario.data_nascimento
json.cargo do
    json.partial! funcionario.cargo
end
json.salario funcionario.salario
json.data_admissao funcionario.data_admissao