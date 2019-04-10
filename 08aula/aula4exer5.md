# Modelo Entidade-Relacionamento

## Entidades

- RECEITA (<u>idReceita</u>, crm, paciente)
- MEDICO (<u>crm</u>, nome, especialidade)
- PACEINTE (<u>cpf</u>, nome, idade, sexo, {telefones}, endereco)

## Relacionamentos

- RECEITA possui MEDICO

    Uma RECEITA possui um MEDICO e um MEDICO cria uma RECEITA
    
    **Cardinalidade**: 1:1

- RECEITA possui PACEINTE

    Uma RECEITA possui um PACIENTE e um PACIENTE recebe uma RECEITA
    
    **Cardinalidade**: 1:1


## Diagrama Entidade-Relacionamento

![DER](DER.JPG)

## Diagrama de Relacionamento



## Diagrama Lógico

![Diagrama](DiagramaER.PNG)