CREATE DATABASE p1;

USE p1;

CREATE TABLE PLANTONISTA (
    matriculaFuncional INTEGER,
    nomeCompletoPlantonista VARCHAR,
    idade INTEGER,
    sexo ENUM("M","F"),
    dataNascimento DATE,
    habilidade VARCHAR,
    CONSTRAINT PLANTONISTA PRIMARY KEY (matriculaFuncional, nomeCompletoPlantonista)
);

CREATE TABLE REGIAO (
    nomeRegiao VARCHAR,
    tamanho INTEGER,
    CONSTRAINT REGIAO_PK PRIMARY KEY (nomeRegiao)
);

CREATE TABLE SUPERVISOR (
    cpf INTEGER,
    matriculaFuncional INTEGER,
    nomeCompletoSupervisor VARCHAR,
    idade INTEGER,
    sexo ENUM("M","F"),
    dataNascimento DATE,
    CONSTRAINT SUPERVISOR_PK PRIMARY KEY(cpf)
);

CREATE TABLE DESIGNACAO (
    cpf INTEGER,
    matriculaFuncional INTEGER,
    nomeCompletoPlantonista VARCHAR,
    nomeRegiao VARCHAR,
    data DATE,
    CONSTRAINT DESIGNACAO_PK PRIMARY KEY (cpf, data, matriculaFuncional, nomeCompletoPlantonista, nomeRegiao),
    CONSTRAINT DESIGNACAO_PLANTONISTA_FK FOREIGN KEY (matriculaFuncional, nomeCompletoPlantonista) REFERENCES PLANTONISTA(matriculaFuncional, nomeCompletoPlantonista),
    CONSTRAINT DESIGNACAO_REGIAO_FK FOREIGN KEY (nomeRegiao) REFERENCES REGIAO(nomeRegiao),
    CONSTRAINT DESIGNACAO_SUPERVISOR FOREIGN KEY (cpf) REFERENCES SUPERVISOR (cpf)
);