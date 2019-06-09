use p1;

INSERT INTO PLANTONISTA (matriculaFuncional, nomeCOmpletoPlantonista, idade, sexo, dataNascimento, habilidade) VALUES
    ('11111111111', 'joao1', '1', 'M', '2019-03-20 15:02:54', 'habilidade1'),
    ('22222222222', 'joao2', '2', 'M', '2019-03-20 15:02:54', 'habilidade2'),
    ('33333333333', 'joao3', '2', 'M', '2019-03-20 15:02:54', 'habilidade3');

INSERT INTO REGIAO (nomeRegiao, tamanho) VALUES
    ('regiao1', '1'),
    ('regiao2', '2'),
    ('regiao3', '3');

INSERT INTO SUPERVISOR (cpf, matriculaFuncional, nomeCompletoSupervisor, idade, sexo, dataNascimento) VALUES
    ('11111111111', '11111111110', 'joaoS1', '1', 'M', '2019-03-20 15:02:54'),
    ('22222222222', '22222222221', 'joaoS2', '2', 'M', '2019-03-20 15:02:54'),
    ('33333333333', '33333333332', 'joaoS3', '2', 'M', '2019-03-20 15:02:54');

INSERT INTO DESIGNACAO (cpf, matriculaFuncional, nomeCOmpletoPlantonista, nomeRegiao, data) VALUES
    ('11111111111', '33333333333', 'joao3', 'regiao1', '2019-03-20 15:02:50'),
    ('22222222222', '22222222222', 'joao2', 'regiao2', '2019-03-20 15:02:51'),
    ('33333333333', '11111111111', 'joao1', 'regiao3', '2019-03-20 15:02:52');
