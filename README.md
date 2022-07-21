# Rebase Challenge 2022

API em Ruby para listagem de exames médicos.

## Tech Stack


* Docker
* Ruby
* Sinatra
* Postgres
* Redis
* Sidekiq

## Running

<strong>A instalação do [docker](https://www.docker.com/) é requisito obrigatório para rodar o projeto.</strong>

Para subir a aplicação rode:

```bash
$ bin/run
```
Para popular o banco de dados, rode:

```bash
$ docker exec -ti app rake db:populate
```
Para rodar os testes da aplicação, rode:

```bash
$ docker exec -ti app bash -c rspec
```

Para visualizar o painel de jobs do sidekiq, visite:

```bash
http://localhost:5000
```

## Documentação

A documentação da <strong>API</strong> pode ser consultada [aqui](API.md).
