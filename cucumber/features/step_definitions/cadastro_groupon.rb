# encoding: utf-8

Dado(/^que eu estou na página de cadatro do Groupon$/) do
  visit "https://goo.gl/Z5RRq0"
end

Quando(/^eu preencher os campos obrigatórios$/) do
  @senha = Faker::Base.numerify('inicial####').to_s
  cadastro = Cadastro.new
  cadastro.titulo.select("Sr.")
  cadastro.primero_nome_cliente.set(Faker::Name.first_name)
  cadastro.ultimo_nome_cliente.set(Faker::Name.last_name)
  cadastro.cpf_cliente.set(Faker::CPF.numeric)
  cadastro.rua.set("Rua Girassol")
  cadastro.numero_casa.set(Faker::Base.numerify('####').to_s)
  cadastro.cep.set(Faker::Base.numerify('05433-00#').to_s)
  cadastro.cidade.set("São Paulo")
  cadastro.email.set(Faker::Internet.email)
  cadastro.telefone.set(Faker::Base.numerify('9####-####').to_s)
  cadastro.senha.set(Faker::Base.numerify(@senha).to_s)
  cadastro.confirma_senha.set(Faker::Base.numerify(@senha).to_s)
  execute_script "jQuery('#terms-checkbox').click();"
end

Então(/^o cadastro deverá ser realizado com sucess$/) do
  click_button 'Cadastro'
end
