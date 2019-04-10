/* logico: */
CREATE TABLE MEDICO (
    crm INT PRIMARY KEY,
    nome VARCHAR(180),
    especialidade VARCHAR(180)
);

CREATE TABLE PACIENTE (
    cpf NUMERIC(11) PRIMARY KEY,
    nome VARCHAR(180),
    idade INT,
    sexo ENUM("M","F"),
    cidade VARCHAR(180),
    bairro VARCHAR(180),
    estado VARCHAR(180),
    cep INT,
    complemento VARCHAR(180)
);

CREATE TABLE telefones (
    idTelefone INT NOT NULL PRIMARY KEY,
    telefones INT,
    cpf NUMERIC(11)
);

CREATE TABLE CONSULTA (
    data DATETIME,
    cpf NUMERIC(11),
    crm INT,
    PRIMARY KEY (data, crm, cpf)
);

CREATE TABLE RECEITA (
    idReceita INT PRIMARY KEY,
    descricao VARCHAR(180),
    data DATETIME,
    crm INT,
    cpf NUMERIC(11)
    ADD CONSTRAINT RECEITA_CONSULTA_FK
    FOREIGN KEY (crm, data, cpf)
    REFERENCES CONSULTA (crm, data, cpf)
);
 
ALTER TABLE RECEITA 
    ON DELETE CASCADE;
 
ALTER TABLE PACIENTE ADD CONSTRAINT FK_PACIENTE_2
    FOREIGN KEY (telefones)
    REFERENCES telefones (idTelefone)
    ON DELETE NO ACTION;
 
ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_2
    FOREIGN KEY (cpf)
    REFERENCES PACIENTE (cpf);
 
ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_3
    FOREIGN KEY (crm)
    REFERENCES MEDICO (crm);
 
ALTER TABLE telefones ADD CONSTRAINT FK_telefones_2
    FOREIGN KEY (cpf)
    REFERENCES PACIENTE (cpf);