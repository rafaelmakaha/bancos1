CREATE DATABASE p1;

USE p1;

CREATE TABLE PLANTONISTA (
    matriculaFuncional INTEGER(6) NOT NULL,
    nomeCompletoPlantonista VARCHAR(50) NOT NULL,
    idade INTEGER(3) NOT NULL,
    sexo ENUM('M','F') NOT NULL,
    dataNascimento DATE NOT NULL,
    habilidade VARCHAR(50) NOT NULL,
    CONSTRAINT PLANTONISTA PRIMARY KEY (matriculaFuncional, nomeCompletoPlantonista)
);

CREATE TABLE REGIAO (
    nomeRegiao VARCHAR(50) NOT NULL,
    tamanho INTEGER(8) NOT NULL,
    CONSTRAINT REGIAO_PK PRIMARY KEY (nomeRegiao)
);

CREATE TABLE SUPERVISOR (
    cpf INTEGER(11) NOT NULL,
    matriculaFuncional INTEGER(11) NOT NULL,
    nomeCompletoSupervisor VARCHAR(50) NOT NULL,
    idade INTEGER(3) NOT NULL,
    sexo ENUM('M','F') NOT NULL,
    dataNascimento DATE NOT NULL,
    CONSTRAINT SUPERVISOR_PK PRIMARY KEY(cpf)
);

CREATE TABLE DESIGNACAO (
    cpf INTEGER(11) NOT NULL,
    matriculaFuncional INTEGER(11) NOT NULL,
    nomeCompletoPlantonista VARCHAR(50) NOT NULL,
    nomeRegiao VARCHAR(50) NOT NULL,
    data DATE NOT NULL,
    CONSTRAINT DESIGNACAO_PK PRIMARY KEY (cpf, data, matriculaFuncional, nomeCompletoPlantonista, nomeRegiao),
    CONSTRAINT DESIGNACAO_PLANTONISTA_FK FOREIGN KEY (matriculaFuncional, nomeCompletoPlantonista) REFERENCES PLANTONISTA(matriculaFuncional, nomeCompletoPlantonista),
    CONSTRAINT DESIGNACAO_REGIAO_FK FOREIGN KEY (nomeRegiao) REFERENCES REGIAO(nomeRegiao),
    CONSTRAINT DESIGNACAO_SUPERVISOR FOREIGN KEY (cpf) REFERENCES SUPERVISOR (cpf)
);