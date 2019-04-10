# Modelo Entidade-Relacionamento

## Entidades

- RECEITA (<u>idReceita</u>, descricao, crm, data, cpf)
- MEDICO (<u>crm</u>, nome, especialidade)
- PACEINTE (<u>cpf</u>, nome, idade, sexo, {telefones}, cep, estado, cidade, bairro, complemento)
- CONSULTA (<u>crm</u>, <u>data</u>, <u>cpf</u>)

## Relacionamentos

- MEDICO consulta PACIENTE

    Um MEDICO consulta um PACIENTE e um PACIENTE é consultado por um medico.
    
    **Cardinalidade**: n:m

- CONSULTA gera RECEITA

    Uma CONSULTA pode gerar uma ou várias RECEITAs e uma RECEITA é gerada por uma CONSULTA.
    
    **Cardinalidade**: 1:n


## Diagrama Entidade-Relacionamento

![DER](DER.PNG)

## Diagrama de Relacionamento



## Diagrama Lógico

![Logico](logico.PNG)