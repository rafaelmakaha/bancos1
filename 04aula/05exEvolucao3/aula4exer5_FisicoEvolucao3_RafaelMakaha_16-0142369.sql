-- --------                                             ------------ --
--                          SCRIPT SQL                               --
--                                                                   --
-- Data Criacao ...........: 21/04/2018                              --
-- Autor(es) ..............: Rafael Makaha                           --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: aula4exer5Evolucao3                     --
--                                                                   --                                             --
-- ----------------------------------------------------------------- --

CREATE DATABASE IF NOT EXISTS aula4exer5evolucao;

USE aula4exer5evolucao;

CREATE TABLE IF NOT EXISTS ESPECIALIDADE(
    codEspecialidade int not null,
    nomeEspecialidade varchar(50) not null,
    crm int,
    constraint ESPECIALIDADE primary key(codEspecialidade)
);

CREATE TABLE IF NOT EXISTS MEDICO(
    crm int not null,
    nome varchar(50) not null,
    codEspecialidade int,,
    constraint MEDICO_PK primary key(crm),
    constraint MEDICO_ESPECIALIDADE_FK foreign key(codEspecialidade) references ESPECIALIDADE(codEspecialidade)
);

CREATE TABLE IF NOT EXISTS PACIENTE(
    cpf int not null,
    nome varchar(50) not null,
    idade int,
    sexo enum("M","F"),
    cidade varchar(50),
    bairro varchar(50),
    estado varchar(50),
    cep int,
    complemento varchar(50),
    constraint PACIENTE_PK primary key(cpf)
);  

CREATE TABLE IF NOT EXISTS telefones (
    idTelefone int not null,
    telefones int,
    cpf int,
    constraint telefones_PK primary key(ideTelefone),
    constraint telefones_PACIENTE_FK foreign key(cpf) references PACIENTE(cpf)
);

CREATE TABLE IF NOT EXISTS CONSULTA (
    data date,
    cpf int,
    crm int,
    constraint CONSULTA_PK primary key(data, crm, cpf),
    constraint CONSULTA_PACIENTE_FK foreign key(cpf) references PACIENTE(cpf),
    constraint CONSULTA_MEDICO_FK foreign key(crm) references MEDICO(crm)
);

CREATE TABLE IF NOT EXISTS MEDICAMENTO(
    codMedicamento int not null,
    descricao varchar(50) not null,
    nome varchar(50) not null,
    constraint MEDICAMENTO_PK primary key(codMedicamento)
);

CREATE TABLE IF NOT EXISTS  RECEITA (
    idReceita int not null,
    descricao varchar(50) not null,
    data data NÃO NULO,
    crm int,
    cpf int,
    codMedicamento int,
    constraint RECEITA_PK primary key(idReceita),
    constraint RECEITA_CONSULTA_FK foreign key(data, crm, cpf) references CONSULTA(data, crm, cpf),
    constraint RECEITA_MEDICAMENTO foreign key(codMedicamento) references MEDICAMENTO(codMedicamento)
);
