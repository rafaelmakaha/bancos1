# Modelo Entidade-Relacionamento

## Entidades

- VEICULO (<u>placa</u>, <u>chassi</u>, cor, anoFabric)
- CATEGORIA(<u>codCategoria</u>, nome)
- MODELO(<u>codModelo</u>, nome)
- PROPRIETARIO (<u>cpf</u>, nome, bairro, cidade, estado, {telefones}, sexo, nascimento, idade)
- INFRACAO (<u>codInfracao</u>, valor)

## Relacionamentos

- VEICULO possui MODELO

    Um ou vários VEICULOs possue(m) um MODELO e um MODELO pertence a um ou vários VEICULOs

    **Cardinalidade**: n:1

- VEICULO possui CATEGORIA

    Um ou vários VEICULOs possue(m) uma CATEGORIA e uma CATEGORIA pertence a um ou vários VEICULOs

    **Cardinalidade**: n:1

- PROPRIETARIO possui VEICULO

    Um PROPRIETARIO possui um ou vários VEICULOs e um VEICULO pertence a um único PROPRIETARIO.

    **Cardinalidade**: 1:n

- PROPRIETARIO recebe INFRACAO

    Um PROPRIETARIO recebe uma ou várias INFRACAO e uma INFRACAO pertence a um único PROPRIETARIO.

    **Cardinalidade**: 1:n


## Diagrama Entidade-Relacionamento

![DER](DER.PNG)

## Diagrama de Relacionamento

    ESPECIALIDADE(
        nomeEspecialidade literal(30) NÃO NULO,
        codEspecialidade numérico NÃO NULO,
    restrição ESPECIALIDADE_PK de chave primária (codEspecialidade)
    );
    possui (
        crm numérico(8) NÃO NULO,
        codEspecialidade numérico NÃO NULO,
    restrição ESPECIALIDADE_FK de chave estrangeira (codEspecialidade) 
        que referencia ESPECIALIDA (codEspecialidade),
    restrição MEDICO_FK de chave estrangeira (crm) 
        que referencia MEDICO(crm)
    );
    MEDICO(
        crm numérico(8) NÃO NULO,
        nome literal(30) NÃO NULO,
    restrição MEDICO_PK de chave primária (crm)
    );
    CONSULTA(
        data data NÃO NULO,
        cpf numérico(11) NÃO NULO,
        crm numérico(8) NÃO NULO,
    restrição CONSULTA_PK de chave primária (data, cpf, crm),
    restrição CONSULTA_MEDICO_FK de chave estrangeira (crm) que referencia MEDICO(crm),
    restrição CONSULTA_PACIENTE_FK de chave estrangeira (cpf) que referencia PACIENTE(cpf)
    );
    RECEITA(
        posologia literal(100) NÃO NULO,
        data data NÃO NULO,
        cpf numérico(11) NÃO NULO,
        crm numérico(8) NÃO NULO,
        idReceita numérico NÃO NULO,
    restrição RECEITA_PK de chave primária (data, cpf, crm, idReceita),
    restrição RECEITA_CONSULTA_FK de chave estrangeira (data, cpf, crm) que referencia CONSULTA (data, cpf, crm)
    );
    MEDICAMENTO(
        descricao literal(100) NÃO NULO,
        codMedicamento numérico NÃO NULO,
        nome literal(30) NÃO NULO,
    restrição MEDICAMENTO_PK de chave primária (codMedicamento)
    );
    telefone (
        cpf numérico(11) NÃO NULO,
        telefone numérico,
    restrição TELEFONE_PACIENTE_ FK de chave estrangeira (cpf) que referencia PACIENTE (cpf)
    );
    contem (
        idReceita numérico NÃO NULO,
        codMedicamento numérico NÃO NULO,
    restrição RECEITA_ FK de chave estrangeira (idReceita) que referencia RECEITA (idReceita),
    restrição MEDICAMENTO_FK de chave estrangeira (codMedicamento) que referencia MEDICAMENT (codMedicamento)
    );
    PACIENTE (
        cpf numérico(11) NÃO NULO,
        nome literal(30) NÃO NULO,
        idade numérico(3) NÃO NULO,
        sexo literal(1) NÃO NULO,
        cidade literal(30) NÃO NULO,
        bairro literal(30) NÃO NULO,
        estado literal(20) NÃO NULO,
        cep numérico(10) NÃO NULO,
        complemento literal(100),
    restrição PACIENTE_PK de chave primária (cpf)
    );


## Diagrama Lógico

![Logico](logico.PNG)