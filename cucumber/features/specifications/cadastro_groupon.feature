#language: pt

Funcionalidade: Realizar o cadastro aplicando o conceito de Page Objects

Cenario: Cadastrar usuário

  Dado que eu estou na página de cadatro do Groupon
  Quando eu preencher os campos obrigatórios
  Então o cadastro deverá ser realizado com sucess
