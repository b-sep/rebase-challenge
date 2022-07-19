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

A instalação do [docker](https://www.docker.com/) é requisito mínimo para rodar o projeto.

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

Para visualizar todos os exames cadastrados, visite:

```bash
http://localhost:3000/tests
```

Para visualizar o painel de jobs do sidekiq, visite:

```bash
http://localhost:5000
```