select tb_funcionario.primeiro_nome, tb_funcionario.ultmio_nome, tb_funcionario.nome_meio from tb_funcionario
left join tb_dependente on tb_funcionario.cpf = tb_dependente.cpf_funcionario
where tb_dependente.cpf_funcionario is null