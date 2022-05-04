select tb_funcionario.primeiro_nome, tb_funcionario.nome_meio, tb_funcionario.ultimo_nome, tb_funcionario.endereco from
tb_funcionario inner join tb_departamento
on 
tb_funcionario.numero_departamento = tb_departamento.numero_departamento
where tb_departamento.nome_departamento = 'pesquisa';
