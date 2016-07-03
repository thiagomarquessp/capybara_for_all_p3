# encoding: utf-8
#!/usr/bin/env ruby

class Cadastro < SitePrism::Page
  element :titulo, "select[id='gender-select']"
  element :primero_nome_cliente, "input[id='first-name-input']"
  element :ultimo_nome_cliente, "input[id='last-name-input']"
  element :cpf_cliente, "input[id='personal-identifier-input']"
  element :rua, "input[id='street-input']"
  element :numero_casa, "input[id='street-number-input']"
  element :cep, "input[id='postal-code-input']"
  element :cidade, "input[id='city-input']"
  element :email, "input[id='email-input']"
  element :telefone, "input[id='phone-number-input']"
  element :senha, "input[id='password-input']"
  element :confirma_senha, "input[id='password-confirmation-input']"
end
