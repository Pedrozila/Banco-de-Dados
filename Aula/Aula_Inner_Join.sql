select * from tb_projeto;
select nome_projeto, numero_projeto from tb_projeto;
select nome_projeto as 'nome do projeto', numero_projeto as 'numero do projeto';
select * from tb_projeto where local_projeto = 'maua';
select * from tb_projeto where numero_projeto = 10 and numero_departamento = 4;
select * from tb_funcionario where data_nascimento >= '1970-01-01';
select * from tb_funcionario where year(data_nascimento) >= 1965;
select * from tb_funcionario where numero_departamento = 5;
select cpf from tb_funcionario where numero_departamento = 5;
select cpf_supervisor from tb_funcionario where numero_departamento = 5;
select distinct cpf_supervisor from tb_funcionario where numero_departamento = 5;
/* Distinct coloca tudo que é igual numa linha só */
select cpf from tb_funcionario where numero_departamento = 5 union select distinct cpf_supervisor from tb_funcionario where numero_departamento = 5;
select * from tb_funcionario where sexo = 'F';
select primeiro_nome, ultimo_nome, cpf from tb_funcionario where sexo ='F';
select primeiro_nome, ultimo_nome, cpf from tb_funcionario, tb_dependente whwere sexo = 'F';
select tb_funcionario.primeiro_nome, tb_funcionario.ultimo_nome, tb_funcionario.cpf, tb_dependente.* from tb_funcionario, tb_dependente where tb_funcionario.sexo = 'F';
select tb_funcionario.primeiro_nome, tb_funcionario.ultimo_nome, tb_funcionario.cpf, tb_dependente.* from tb_funcionario. tb_dependente where tb_funcionario.sexo = 'F'; and tb_funcionario.cpf = tb_dependente.cpf_funcionario;
select tb_funcionario.primeiro_nome, tb_funcionario.ultimo_nome, tb_funcionario.cpf, tb_dependente.nome_dependente from tb_funcionario. tb_dependente where tb_funcionario.sexo = 'F'; and tb_funcionario.cpf = tb_dependente.cpf_funcionario;
select tb_funcionario.primeiro_nome, tb_projeto.nome_projeto from tb_funcionario inner join tb_departamento on tb_funcionario.cpf = tb_departamento.cpf_gerente inner join tb_projeto on tb_departamento.numero_departamento = tb_projeto.numero_departamento;
