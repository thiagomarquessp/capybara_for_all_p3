# Preparando nosso ambiente de trabalho.

Antes de começar vamos criar um novo projeto com o cucumber:

```ruby
cucumber --init

E vamos novamente customizar nosso ambiente de trabalho da seguinte forma:

cucumber
cucumber/features
cucumber/features/specifications
cucumber/features/step_definitions
cucumber/features/support
cucumber/features/support/env.rb

E vamos criar mais um arquivo, chamado page_objects.rb na pasta support e vai ficar assim:

cucumber/features/support/page_objects.rb
```
Pra não usar o WM como bode expiatório, vamos criar agora em cima do cadastro do Groupon.

Só para lembrar, vamos criar um Gemfile dentro da pasta cucumber:

```ruby
source "https://rubygems.org"

gem "cucumber"
gem "capybara"
gem "selenium-webdriver"
gem "faker"
gem "cpf_faker"
gem "site_prism"

Executar o comando bundle install para instalar as gems.
```

Agora, no arquivo support/env.rb, colocar as seguintes informações:
```ruby
require "capybara/cucumber"
require "selenium-webdriver"
require "site_prism"
require "faker"
require "cpf_faker"

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 10
```

Vamos criar agora o nossa feature de cadastro. Como todos os exemplos anteriores foi em inglês, esse vou criar em português pra não ter mi mi mi rsrsr. O nome vai ser cadastro_groupon.feature dentro da pasta specifications e vai conter o seguinte conteúdo:

```ruby
#language: pt

Funcionalidade: Realizar o cadastro aplicando o conceito de Page Objects

Cenario: Cadastrar usuário

  Dado que eu estou na página de cadatro do Groupon
  Quando eu preencher os campos obrigatórios
  Então o cadastro deverá ser realizado com sucesso  
```

Nem preciso dizer que eu preciso rodar o comando cucumber para executar as RegEx e bla bla bla certo. Então vamo direto ao ponto e criar o arquivo cadastro_groupon.rb na pasta step_definitions da seguinte forma:

```ruby
encoding: utf-8

Dado(/^que eu estou na página de cadatro do Groupon$/) do
 pending # Write code here that turns the phrase above into concrete actions
end

Quando(/^eu preencher os campos obrigatórios$/) do
 pending # Write code here that turns the phrase above into concrete actions
end

Então(/^o cadastro deverá ser realizado com sucess$/) do
 pending # Write code here that turns the phrase above into concrete actions
end
```

Bora agora pro [Conhecendo o Site Prism] (https://github.com/thiagomarquessp/capybara_for_all_p3/blob/master/conhecendo_site_prism.md) e de lá vamos dar continuidade. 
