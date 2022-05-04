select tb_projeto.numero_projeto, tb_projeto.numero_departamento, tb_funcionario.ultimo_nome, tb_funcionario.endereco, tb_funcionario_data_nascimento from tb_projeto
inner join tb_departamento on tb_projeto.numero_departamento = tb_departamento.numero_departamento;
inner join tb_funcionario on tb_funcionario.cpf = tb_departamento.cpf_gerente
where tb_projeto.local_projeto = 'Maua';