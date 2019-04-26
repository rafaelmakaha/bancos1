-- --------                                             ------------ --
--                          SCRIPT SQL                               --
--                                                                   --
-- Data Criacao ...........: 21/04/2018                              --
-- Autor(es) ..............: Rafael Makaha                           --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: aula4exer6                              --
--                                                                   --                                             --
-- ----------------------------------------------------------------- --

CREATE DATABASE IF NOT EXISTS aula4exer6;

USE aula4exer6;

CREATE TABLE CATEGORIA (
    codCategoria INT(2) NOT NULL,
    nomeCategoria VARCHAR(50) NOT NULL
    constraint CATEGORIA_PK PRIMARY KEY (codCategoria)
);

CREATE TABLE PROPRIETARIO (
    cpf BIGINT(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    lagradouro VARCHAR(100) NOT NULL,
    numero INT NOT NULL,
    complemento VARCHAR(100) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    uf CHAR(2) NOT NULL,
    cep INT(8) NOT NULL,
    sexo CHAR(1) NOT NULL,
    dtNascimento DATE NOT NULL
    constraint PROPRIETARIO_PK PRIMARY KEY (cpf),
);

CREATE TABLE VEICULO (
    placa CHAR(7) NOT NULL PRIMARY KEY,
    numeroChassi CHAR(17) NOT NULL UNIQUE,
    cor VARCHAR(20) NOT NULL,
    codModelo INT(6) NOT NULL,
    codCategoria INT(2) NOT NULL,
    ano DATE NOT NULL,
    cpf BIGINT(11) NOT NULL,
    CONSTRAINT VEICULO_PK PRIMARY KEY (placa),
    constraint VEICULO_MODELO_FK FOREIGN KEY(codModelo) REFERENCES MODELO(codModelo),
    CONSTRAINT VEICULO_CATEGORIA_FK FOREIGN KEY (codCategoria) REFERENCES CATEGORIA(codCategoria),
    CONSTRAINT VEICULO_PROPRIETARIO_FK FOREIGN KEY (cpf) REFERENCES PROPRIETARIO(cpf)
); 

CREATE TABLE MODELO (
    codModelo INT(6) NOT NULL PRIMARY KEY,
    nomeModelo VARCHAR(50) NOT NULL
    constraint MODELO_PK PRIMARY KEY (codeModelo)
);

CREATE TABLE LOCAL_ (
    codLocal VARCHAR(20) NOT NULL PRIMARY KEY,
    latitude DECIMAL(8,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    velocidadePermitida INT(3) NOT NULL,
    CONSTRAINT LOCAL_PK PRIMARY KEY(codLocal)
); 


CREATE TABLE MODELO (
    codModelo INT not null,
    nome VARCHAR(20) not null,
    chassi INT,
    placa VARCHAR(20),
    constraint MODELO_PK PRIMARY KEY (codModelo),
);

CREATE TABLE INFRACAO (
    idInfracao BIGINT NOT NULL PRIMARY KEY,
    placa CHAR(7) NOT NULL,
    dataHora TIMESTAMP NOT NULL,
    codInfracao INT NOT NULL,
    codLocal VARCHAR(20) NOT NULL,
    velocidadeAferida INT(3),
    matricula BIGINT NOT NULL
    CONSTRAINT INFRACAO_PK PRIMARY KEY (idInfracao),
    CONSTRAINT INFRACAO_VEICULO_FK FOREIGN KEY (placa) REFERENCES VEICULO(placa),
    CONSTRAINT INFRACAO_TIPO_INFRACAO_FK FOREIGN KEY (codInfracao) REFERENCES TIPO_INFRACAO(codInfracao),
    CONSTRAINT INFRACAO_LOCAL_FK FOREIGN KEY (codLocal) REFERENCES LOCAL(codLocal),
    CONSTRAINT INFRACAO_AGENTE_FK FOREIGN KEY (matricula) REFERENCES AGENTE(matricula),
);

CREATE TABLE TIPO_INFRACAO (
    codInfracao INT NOT NULL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    valor DECIMAL(6,2) NOT NULL,
    CONSTRAINT TIPO_INFRACAO PRIMARY KEY(codInfracao)
); 

CREATE TABLE AGENTE (
    matricula BIGINT NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    dtContratacao DATE NOT NULL,
    CONSTRAINT AGENTE PRIMARY KEY (matricula)
);

CREATE TABLE telefone (
    cpf BIGINT(11) NOT NULL,
    telefone BIGINT(11) NOT NULL,
    CONSTRAINT telefones_PK PRIMARY KEY (cpf,telefone)
);