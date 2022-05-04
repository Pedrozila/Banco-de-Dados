select tb_funcionario.primeiro_nome, tb_funcionario.nome_meio, tb_funcionario.ultmio_nome from tb_funcionario
inner join tb_dependente on tb_dependente.cpf_funcionario = tb_funcionario.cpf
inner join tb_departamento on tb_funcionario.cpf = tb_departamento.cpf_gerente
