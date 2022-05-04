use empresanosql;

SELECT `json` AS jSON_DPCUMENTO FROM tb_object_funcionario;

SELECT json_pretty(`json`) as jSON_DPCUMENTO FROM tb_object_funcionario;

SELECT `json` -> '$.Sexo' AS sexo FROM tb_object_funcionario;

SELECT 
REPLACE (JSON_EXTRACT(`JSON`, "$.Cpf"), """","") AS CPF, 
REPLACE (JSON_EXTRACT(`JSON`, "$.Data_Nascimento"), """","") AS Data_Nascimento, 
REPLACE (JSON_EXTRACT(`JSON`, "$.Primeiro_Nome"), """","") AS Primeiro_Nome, 
REPLACE (JSON_EXTRACT(`JSON`, "$.Nome_Meio"), """","") AS Nome_Do_Meio, 
REPLACE (JSON_EXTRACT(`JSON`, "$.Ultimo_Nome"), """","") AS Ultimo_Nome,
REPLACE (JSON_EXTRACT(`JSON`, "$.Endereco"), """","") AS Endereço,  
REPLACE (JSON_EXTRACT(`JSON`, "$.Salario"), """","") AS Salario, 
REPLACE (JSON_EXTRACT(`JSON`, "$.Cpf_Supervisor"), """","") AS CPF_Supervisor,
REPLACE (JSON_EXTRACT(`JSON`, "$.Numero_Departamento"), """","") AS Numero_Departamento, 
REPLACE (JSON_EXTRACT(`JSON`, "$.Sexo"), """","") AS Sexo 
FROM tb_object_funcionario;
 
 SELECT * FROM tb_object_funcionario WHERE json_extract(`json`, "$.Sexo") = "F";

 SELECT * FROM tb_object_funcionario WHERE json_extract(`json`, "$.Data_Nascimento") >= "1980-01-01";

 SELECT SUM(salario) as salario_total FROM tb_funcionario;

 SELECT json_extract(`json`,"$.Salario") AS Salario FROM tb_object_funcionario;

 SELECT SUM(json_extract(`json`, "$.Salario")) as salario_total FROM tb_object_funcionario;

select Numero_Departamento, sum(salario) as salario_total FROM tb_funcionario;

group by Numero_Departamento;

SELECT json_extract(`json`, "$.Numero_Departamento") as Numero_Departamento, sum(json_extract(`json`, "$.Salario")) as salario_total 
FROM tb_object_funcionario 
GROUP BY json_extract(`json`, "$.Numero_Departamento") ORDER BY json_extract(`json`, "$.Numero_Departamento");

select json_extract(`json`, "$.Dependentes") as Dependentes from tb_object_funcionario WHERE CPF = '12345678966';

CREATE table t1 (`json` json);

insert into t1 values ('{"Hobby": ["praia", "futebol", "volei"]}');

SELECT `json` json FROM t1;

select json_extract(`json`, "$.Hobby") as hobbies from t1;

select json_extract(`json`, "$.Hobby[0]") as hobbies from t1;

select json_extract(`json`, "$.Hobby[1]") as hobbies from t1;

SELECT json_extract(`json`, "$.Hobby[2]") as hobbies from t1;

drop table t1;

show tables;

create table t1 (jotason json);

insert into t1 values ('{
  "Cliente": [
    {
      "Nome": "Joao",
      "Hobby": [
        "Praia",
        "Futebol",
        "Volei"
      ]
    }
  ]
}');
SELECT `JSON`FROM t1;
SELECT JSON_EXTRACT(`JSON`,"$.Cliente") FROM t1;
SELECT JSON_EXTRACT(`JSON`,"$.Cliente[0].Nome") FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (`JSON` json);
INSERT INTO t1 VALUES ('{
  "Cliente": [
    {
      "Nome": "Joao",
      "Hobby": [
        "Praia",
        "Futebol",
        "Volei"
      ]
    },
    {
      "Nome": "Carlos",
      "Hobby": [
        "Cinema",
        "Luta"
      
      ]
    }
  ]
}'); 

select jotason from t1;

SELECT json_extract (jotason, "$.Cliente") as cliente from t1;

select json_extract (jotason, "$.Cliente[0].Nome") from t1;

SELECT json_extract (jotason, "$.Cliente[1].Nome") from t1;

select json_extract (jotason, "$.Cliente[0].Hobby") from t1;

select json_extract (jotason, "$.Cliente[1].Hobby[1]") from t1;

drop table t1;

CREATE table t1 (jotason json);

INSERT INTO t1 VALUES ('{
  "Cliente": [
    {
      "Nome": "Joao",
      "Hobby": "Praia"
    },
    {
      "Nome": "Carlos",
      "Hobby": "Cinema"
    }
  ]
}');

select json_extract(jotason, "$.Cliente[0].Nome") as nome, json_extract(jotason, "$.Cliente[0].Hobby") as hobbie from t1
UNION
select json_extract(jotason, "$.Cliente[1].Nome") as nome, json_extract(jotason,"$.Cliente[1].Hobby") as hobbie from t1;

SELECT t2.NOME, t2.HOBBY FROM t1
CROSS JOIN
JSON_TABLE (JSON_EXTRACT(jotason, "$.Cliente"), "$[*]"
COLUMNS(NOME VARCHAR(15) PATH "$.Nome", HOBBY VARCHAR(15) PATH "$.Hobby")) t2;

SELECT JSON_EXTRACT (tb_object_funcionario.`JSON`,"$.Cpf") AS Cpf_Funcionario, 
tb_object_dependente.Nome_Dependente,
tb_object_dependente.Sexo,
tb_object_dependente.Data_Nascimento,
tb_object_dependente.Parentesco
FROM tb_object_funcionario
CROSS JOIN
JSON_TABLE(JSON_EXTRACT (`JSON`,"$.Dependentes"), "$[*]"
COLUMNS (Nome_Dependente VARCHAR(20) PATH "$.Nome_Dependente",
Sexo VARCHAR(20) PATH "$.Sexo",
Data_Nascimento Datetime PATH "$.Data_Nascimento",
Parentesco VARCHAR(10) PATH "$.Parentesco")) AS tb_object_dependente;










