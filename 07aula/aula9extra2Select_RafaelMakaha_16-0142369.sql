-- questão 1: mostrar todos medicamentos de 1 receita

SELECT * FROM receita r inner join contem c on r.idReceita = c.idReceita
                        inner join medicamento m on m.codMedicamento = c.codMedicamento
                        where r.idReceita=1;

-- questão 2: listar todas as especialidades e indicar quais medicos estão em cada uma, além das especialidades que estão sem médico

SELECT * FROM especialidade e left join possui p on e.idEspecialidade = p.idEspecialidade
                              left join medico m on p.crm = m.crm;

-- questão 3: mostrar os medicos e os pacientes que foram atendidos em um dia específico

SELECT * FROM consulta c inner join medico m on c.crm = m.crm
                         inner join paciente p on c.cpf = p.cpf;

-- questão 4: apresentar quantos pacientes cada medico atendeu

select count(p.cpf) from medico m inner join consulta c on m.crm = c.crm
					inner join paciente p on c.cpf = p.cpf;


-- questão 5: Mostrar todos os dados de pacientes consultado por parte do nome fornecido na pesquisa.

select c.cpf from consulta c inner join paciente p on  p.cpf = c.cpf;