select tb_funcionario.primeiro_nome, tb_funcionario.nome_meio, tb_funcionario.ultimo_nome from tb_projeto
inner join tb_trabalha_em on tb_projeto.numero_projeto = tb_trabalha_em.numero_projeto
inner join tb_funcionario on tb_trabalha_em.cpf_funcionario = tb_funcionario.cpf
where tb_projeto.numero_departamento = 5
group by tb_funcionario.primeiro_nome, tb_funcionario.nome_meio, tb_funcionario.ultimo_nome
having count(*) = (select count*) from tb_projeto where tb_projeto.numero_departamento =5;




select * from tb_projeto where tb_projeto.numero_departamento = 5;
select * from tb_trabalha_em where (tb_trabalha_em.numero_projeto = 2 or tb_trabalha_em.numero_projeto = 3)
select count(*) from tb_projeto where tb_projeto.numero_departamento = 5;