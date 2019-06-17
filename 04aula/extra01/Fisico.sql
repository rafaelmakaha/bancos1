/* Lógico: */

CREATE TABLE DEPARTAMENTO (
    codDepartamento INTEGER(8),
    nome VARCHAR(50),
    area VARCHAR(50)
    CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (codDepartamento)
);

CREATE TABLE CURSO (
    codCurso INTEGER(8),
    nome VARCHAR(50),
    codDepartamento INTEGER(8)
    CONSTRAINT PK_CURSO PRIMARY KEY (codCurso),
    CONSTRAINT FK_CURSO_DEPARTAMENTO FOREIGN KEY (codDepartamento) REFERENCES DEPARTAMENTO(codDepartamento)
);

CREATE TABLE DISCIPLINA (
    codDisciplina INTEGER(8),
    nome VARCHAR(50),
    credito INTEGER(3),
    codCurso INTEGER(8)
    CONSTRAINT PK_DISCIPLINA PRIMARY KEY (codDisciplina),
    CONSTRAINT FK_DISCIPLINA_CURSO FOREIGN KEY (codCurso) REFERENCES CURSO (codCurso)
);

CREATE TABLE requer (
    codDisciplina INTEGER(8),
    codPreRequisito INTEGER(8),
    CONSTRAINT PK_requer PRIMARY KEY (codDisciplina, codPreRequisito),
    CONSTRAINT FK_requer_DISCIPLINA FOREIGN KEY (codDisciplina) REFERENCES DISCIPLINA (codDisciplina),
    CONSTRAINT FK_requer_DISCIPLINA FOREIGN KEY (CodPreRequisito) REFERENCES DISCIPLINA (codDisciplina)

);
