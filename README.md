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
$ sudo docker exec -ti app rake db:populate
```

Para visualizar todos os exames cadastrados, visite:

```bash
http://localhost:3000/tests
```

