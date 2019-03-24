# Modelo Entidade-Relacionamento

## Entidades

- Cadastrado(*cpf*, nome, endereco, telefone)
- Parente(parentesco, nome, *cpf*)

## Relacionamentos

- CADASTRADO - possui - PARENTE

    Um cadastrado pode possuir vários parentes, e um parente pode pertencer a vários cadastrados.
    
    **Cardinalidade**: n:n


