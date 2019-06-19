USE aula4extra1;

INSERT INTO DEPARTAMENTO(codDepartamento, nome, area) 
    VALUES(10000001,"Departamento1","Area1");

INSERT INTO DEPARTAMENTO(codDepartamento, nome, area) 
    VALUES(10000002,"Departamento2","Area2");

INSERT INTO DEPARTAMENTO(codDepartamento, nome, area) 
    VALUES(10000003,"Departamento3","Area3");

INSERT INTO CURSO(codCurso, nome, creditoTotal, codDepartamento)
    VALUES (20000001,"Curso1", 240,10000001);

INSERT INTO CURSO(codCurso, nome, creditoTotal, codDepartamento)
    VALUES (20000002,"Curso2", 250,10000002);

INSERT INTO CURSO(codCurso, nome, creditoTotal, codDepartamento)
    VALUES (20000003,"Curso3", 260,10000003);

INSERT INTO DISCIPLINA(codDisciplina, nome, credito, codCurso)
    VALUES (3000001, "Disciplina1", 002, 20000001);

INSERT INTO DISCIPLINA(codDisciplina, nome, credito, codCurso)
    VALUES (3000002, "Disciplina2", 004, 20000001);

INSERT INTO DISCIPLINA(codDisciplina, nome, credito, codCurso)
    VALUES (3000003, "Disciplina3", 006, 20000001);

INSERT INTO DISCIPLINA(codDisciplina, nome, credito, codCurso)
    VALUES (3000004, "Disciplina4", 006, 20000001);

INSERT INTO requer(codDisciplina,codPreRequisito)
    VALUES (30000001, 30000002);

INSERT INTO requer(codDisciplina,codPreRequisito)
    VALUES (30000001, 30000003);

INSERT INTO requer(codDisciplina,codPreRequisito)
    VALUES (30000001, 30000004);