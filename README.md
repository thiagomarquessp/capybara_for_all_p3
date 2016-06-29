# Iniciativa Automation For All - Capybara For All Parte III

Olá pessoal, nesse episódio do Capybara For All vamos aprender um pouco sobre o conceito de Page Objects, que seria nesse contexto, o nosso mapa de objetos. Para dar spoiler, nada mais é que olhar para uma página de cadastro por exemplo e saber que lé eu tenho 5, 6, 7 objetos (elementos) que eu posso interagir com eles.
No princípio vimos nossos arquivos .rb fazendo a interação, como por exemplo:

```ruby
find(:id, "id_do_elemento").set(Faker::Name.name)
```
Certo??

Isso funciona, mas para darmos um algo a mais, aquele plus, que tal melhorar? Custa nada dar aquela tentadinha.

Vamos fazer como uma espécie de receita de bolo, vou falar os ingredientes e vamos colocando na panela:

[Falando um pouco sobre Page Objects] (https://github.com/thiagomarquessp/capybara_for_all_p3/blob/master/falando_um_pouco_page_objects.md)

[Conhecendo o Site Prism] (https://github.com/thiagomarquessp/capybara_for_all_p3/blob/master/conhecendo_site_prism.md)

[Preparaaaa ... o ambiente] (https://github.com/thiagomarquessp/capybara_for_all_p3/blob/master/preparando_ambiente.md)

Reparam na nova gem site_prism, que será a nossa gem para trabalhamos com Page Objects. Vai ser super divertido \o/

A gem do Site Prism se encontra em https://github.com/natritmeyer/site_prism. Eu vou passar o conceito e o uso básico da gem para que não fique algo muito moroso. Dado que você tem o conceito fica fácil de assimilar o uso diário da gem. =)

Vamos pro arquivo Falando um pouco de Page Objects: 
