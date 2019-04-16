/* logico: */
MEDICO (
    crm numérico NÃO NULO,
    nome literal(180) NÃO NULO,
    especialidade literal(180) NÃO NULO,
restrição MEDICO_PK de chave primária(crm)
);

PACIENTE (
    cpf numérico(11) NÃO NULO,
    nome literal(180) NÃO NULO,
    idade numérico,
    sexo ENUM("M","F"),
    cidade literal(180),
    bairro literal(180),
    estado literal(180),
    cep numérico,
    complemento literal(180),
restrição PACIENTE_PK de chave primária(cpf)
);

telefones (
    idTelefone numérico NÃO NULO,
    telefones numérico,
    cpf numérico(11),
restrição telefones_pk de chave primária(idTelefone),
restrição telefones_PACEINTE_FK de chave estrangeira(cpf)
    que referencia PACIENTE(cpf)
);

CONSULTA (
    data data,
    cpf numérico(11),
    crm numérico,
restrição CONSULTA_PK de chave primária (data, crm, cpf),
restrição CONSULTA_PACIENTE_FK de chave estrangeira(cpf)
    que referencia PACIENTE(cpf),
restrição de CONSULTA_MEDICO_FK de chave estrangeira(crm)
    que referencia MEDICO(crm)
);

RECEITA (
    idReceita numérico NÃO NULO,
    descricao literal(180) NÃO NULO,
    data data NÃO NULO,
    crm numérico,
    cpf NUMERIC(11),
restrição RECEITA_PK de chave primária (idReceita),
restrição RECEITA_CONSULTA_FK de chave estrangeira(data, crm, cpf)
    que referencia CONSULTA (data, crm, cpf)
);