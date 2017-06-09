# Conhecendo o [Site Prism](https://github.com/natritmeyer/site_prism)

Bem, retomando algumas coisas antes de iniciar:

1. Ambiente montado (cucumber init/ Gemfile/ env.rb/ cadastro_groupon.feature/ cadastro_groupon.rb);
2. Boa vontade;
3. Interesse;

Lembrem do nosso arquivo page_objects.rb?

Abra-o e vamos dar uma trabalhada nele.

Nesse arquivo vamos precisar criar uma classe (geralmente eu faço por funcionalidade vital) com o nome cadastro. Vai ficar assim:

```ruby
# encoding: utf-8
#!/usr/bin/env ruby

class Cadastro < SitePrism::Page
  Aqui dentro vamos definir o nosso mapa de objetos relacionado ao cadastro.
  A estrutura básica é:
    element :nome_elemento, "input(quando eu quiser passasr algum nome, clicar, etc)[css do elemento]"
  ex:
  element :nome_cliente, "input[id='name_cli']"
end
```

Se eu quiser utilizar algo que está dentro de uma classe eu preciso primeiro chamar essa classe, deixá-la apta para poder trabalhar dentro de qualquer outro arquivo. Então pra isso eu preciso dar um new para instanciá-la. Assim:

```ruby
cucumber/features/step_definitions/cadastro_groupo.rb

Quando(/^eu preencher os campos obrigatórios$/) do
  cadastro = Cadastro.new
  cadastro.nome_cliente.set(Faker::Name.name)
end
```

O que eu fiz foi criar uma variável com o nome cadastro (que poderia ser qualquer outra coisa) e instanciei a classe Cadastro com o atributo new, ou seja, quando eu passei a variável cadastro.nome_cliente quer dizer que de dentro de um arquivo que não tem nada a ver com o arquivo de page objetcs eu posso utilizar qualquer objeto daquela classe.

Agora, caso o elemento nome_cliente passe a ter o id =  xpto, eu só preciso alterar o arquivo de page objects, porque o elemento :nome_cliente é único em qualquer lugar =).

Eu não gosto de fazer jaba das coisas, mas segue um [livro legal sobre orientação a objetos:] (https://www.casadocodigo.com.br/products/livro-oo-solid).

Bom, indo direto a prática, teremos algo mais ou menos assim:

```ruby
cucumber/features/support/page_objects.rb

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
```

E agora, meu arquivo cucumber/features/step_definitions/cadastro_groupon.rb vai ficar assim:

```ruby
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
```

Execute o comando cucumber e .. NA TELA!!!! Executa tudo lindamente.

```ruby
Automation-MacBook-Pro:cucumber phoenix$ cucumber
# language: pt
Funcionalidade: Realizar o cadastro aplicando o conceito de Page Objects

  Cenario: Cadastrar usuário                          # features/specifications/cadastro_groupon.feature:5
    Dado que eu estou na página de cadatro do Groupon # features/step_definitions/cadastro_groupon.rb:3
    Quando eu preencher os campos obrigatórios        # features/step_definitions/cadastro_groupon.rb:7
    Então o cadastro deverá ser realizado com sucess  # features/step_definitions/cadastro_groupon.rb:25

1 scenario (1 passed)
3 steps (3 passed)
0m10.582s
```

Cadastro no Groupon em quase 11 segundos.

Se amanhã algum dos elementos de cadastro sofrer algum refactory e mudar de id, classe, ou qualquer outra mudança, basta alterar no arquivo page_objects uma vez só. Com isso não vou precisar ficar dando manutenção em vários arquivos. Coisa fácil.
