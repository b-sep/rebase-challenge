# API PARA CONSULTA DE EXAMES

## Visualiza todos os exames

![GET](https://img.shields.io/badge/-GET-blue) `http://localhost:3000/tests`

<hr>

####  Resposta de Sucesso:

Se não tiver nenhum exame cadastrado:

![200: OK](https://img.shields.io/badge/code%3A%20200-OK-green)
<p>
  <img src="https://i.imgur.com/ZcZtn2K.png" width="350" title="hover text">
</p> 

<hr>

Se tiverem exames cadastrados:

![200: OK](https://img.shields.io/badge/code%3A%20200-OK-green)

<p>
  <img src="https://i.imgur.com/GNrP56E.png" width="350" title="hover text">
</p> 

<hr>

## Visualiza detalhe de um exame

![GET](https://img.shields.io/badge/-GET-blue) `http://localhost/tests/:token`



#### Resposta de Sucesso:


![200: OK](https://img.shields.io/badge/code%3A%20200-OK-green)

<p>
  <img src="https://i.imgur.com/OJkJLY4.png" width="350" title="hover text">
</p> 

<hr>

#### Nenhum exame é encontrado com o token fornecido:
 <br/>

![404: Not Found](https://img.shields.io/badge/HTTP%20404-NOT%20FOUND-red.png)

<p>
  <img src="https://i.imgur.com/kdJVOER.png" width="350" title="hover text">
</p> 

<hr>

## Importa arquivo CSV para o banco de dados

<strong>O arquivo CSV deve obrigatoriamente ter o seguinte cabeçalho:</strong>  
- cpf
- nome paciente
- email paciente
- data nascimento paciente
- endereço/rua paciente
- cidade paciente
- estado patiente
- crm médico
- crm médico estado
- nome médico
- email médico
- token resultado exame
- data exame
- tipo exame
- limites tipo exame
- resultado tipo exame

 <br/>

![POST](https://img.shields.io/badge/-POST-blue) `http://localhost/import`

#### Resposta de sucesso:

![200: OK](https://img.shields.io/badge/code%3A%20200-OK-green)

<p>
  <img src="https://i.imgur.com/cried8f.png" width="350" title="hover text">
</p> 

<hr>

#### Nenhum arquivo foi enviado no corpo da requisição:


![400: Bad request ](https://img.shields.io/badge/code%3A%20400-BAD%20REQUEST-red)

<p>
  <img src="https://i.imgur.com/egjErGV.png" width="350" title="hover text">
</p> 

<hr>

#### Erro interno: 

![500: Server Error](https://svgur.com/i/jM4.svg)

<p>
  <img src="https://i.imgur.com/tsUecWh.png" width="350" title="hover text">
</p> 
