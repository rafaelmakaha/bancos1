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

CREATE TABLE MODELO (
    codModelo INT(6) NOT NULL,
    nomeModelo VARCHAR(50) NOT NULL,
    constraint MODELO_PK PRIMARY KEY (codeModelo)
);

CREATE TABLE CATEGORIA (
    codCategoria INT(2) not null,
    nomeCategoria VARCHAR(20) not null,
    constraint CATEGORIA_PK PRIMARY KEY (codCategoria)
);

CREATE TABLE MODELO (
    codModelo INT not null,
    nome VARCHAR(20) not null,
    chassi INT,
    placa VARCHAR(20),
    constraint MODELO_PK PRIMARY KEY (codModelo),
    constraint MODELO_VEICULO_FK FOREIGN KEY(chassi, placa) REFERENCES VEICULO(chassi,placa)
);

CREATE TABLE PROPRIETARIO (
    cpf INT not null,
    nome VARCHAR(20) not null,
    idTelefones INT,
    sexo ENUM("M", "F"),
    idade INT,
    idEndereco INT,
    chassi INT,
    placa VARCHAR(20),
    codInfracao INT,
    constraint PROPRIETARIO_PK PRIMARY KEY (cpf),
    constraint PROPRIETARIO_VEICULO_FK FOREIGN KEY(chassi, placa) REFERENCES VEICULO(chassi,placa),
    CONSTRAINT PROPRIETARIO_endereco_FK FOREIGN KEY(idEndereco) REFERENCES endereco(idEndereco),
    CONSTRAINT PROPRIETARIO_telefones_FK FOREIGN KEY(idTelefones) REFERENCES telefones(idTelefones),
    CONSTRAINT PROPRIETARIO_INFRACAO_FK FOREIGN KEY(codInfracao) REFERENCES INFRACAO(codInfracao)
);

CREATE TABLE INFRACAO (
    codInfracao INT NOT NULL,
    nome VARCHAR(20),
    CONSTRAINT INFRACAO_PK PRIMARY KEY (codInfracao)
);

CREATE TABLE telefones (
    idTelefones INT NOT NULL,
    telefones INT,
    CONSTRAINT telefones_PK PRIMARY KEY (idTelefones)
);

CREATE TABLE endereco (
    idEndereco INT NOT NULL,
    bairro VARCHAR(20),
    estado VARCHAR(20),
    cidade VARCHAR(20),
    CONSTRAINT endereco_pk PRIMARY KEY (idEndereco)
);