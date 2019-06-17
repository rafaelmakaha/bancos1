/* Lógico: */

CREATE TABLE DEPARTAMENTO (
    codDepartamento INTEGER(8) PRIMARY KEY,
    nome VARCHAR(50),
    area VARCHAR(50)
);

CREATE TABLE CURSO (
    codCurso INTEGER(8) PRIMARY KEY,
    nome VARCHAR(50),
    codDepartamento INTEGER(8)
);

CREATE TABLE DISCIPLINA (
    codDisciplina INTEGER(8) PRIMARY KEY,
    nome VARCHAR(50),
    credito INTEGER(3),
    codCurso INTEGER(8)
);

CREATE TABLE requer (
    codDisciplina INTEGER(8),
    codPreRequisito INTEGER(8),
    PRIMARY KEY (codDisciplina, codPreRequisito)
);
