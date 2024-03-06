

-- Verificação do Aprendizado para Nota 2
-- 07/12/2023



--I.	Comandos SQL de Linguagem de Definição de Dados -  DDL

-- 1.	Crie uma nova tabela com o nome de “Melhores_Alunos”, somente com os candidatos que tiveram nota_media > 700.
        
		create table Melhores_Alunos as
select *
FROM public.candidatos_enem_2022
where nota_media >= 700
order by nota_media;

-- 2.	Inclua na tabela “Melhores_Alunos” a coluna “ano_termino_ensino_medio”, aceitando nulo, com o tipo de dados numérico.

alter table melhores_alunos
	ADD ano_termino_ensino_medio numeric(4);


-- 3.	Altere o tipo de dados da coluna “ano_termino_ensino_medio” para caracter.

ALTER TABLE melhores_alunos
ALTER COLUMN ano_termino_ensino_medio TYPE char(4);



-- 4.	Altere a coluna “ano_termino_ensino_medio” e atribua o default “2022”.

ALTER TABLE melhores_alunos  
ALTER COLUMN ano_termino_ensino_medio SET DEFAULT '2022';


-- 5.	Adicione uma Restrição de integridade (check) nesta coluna para só aceitar os valores “2020”, “2021” e “2022”.

ALTER TABLE melhores_alunos  
ADD CONSTRAINT Ano_check 
CHECK (
	ano_termino_ensino_medio = '2021'
	OR ano_termino_ensino_medio = '2022'
	OR ano_termino_ensino_medio = '2020'
);



-- II.	Comandos SQL de Linguagem de Manipulação de Dados - DML


-- 1.	Quantos candidatos foram incluídos na tabela “Melhores_Alunos”?

select count(*)
FROM public.melhores_alunos

-- 2.	Atualize a coluna “ano_termino_ensino_medio” da tabela “Melhores_Alunos” com os seguintes valores:
--      a.	 “2022”, para alunos com (nota_matematica >= 700)


UPDATE public.melhores_alunos
SET ano_termino_ensino_medio = '2022'
WHERE nota_matematica >= 700;

--      b.	“2021”, para alunos com (nota_matematica > = 500 e nota_matematica < 700)

UPDATE public.melhores_alunos
SET ano_termino_ensino_medio = '2021'
WHERE nota_matematica >= 500 and nota_matematica < 700;


--     c.	“2020”, para alunos com (nota_matematica < 500)

UPDATE public.melhores_alunos
SET ano_termino_ensino_medio = '2020'
WHERE nota_matematica < 500;


-- 3.	Inclua um candidato na tabela “Melhores_Alunos”. Atribua os valores das colunas em função dos tipos de dados das mesmas.


INSERT INTO public.melhores_alunos
(ano_enem, numero_inscricao, uf_prova, municipio_prova, cor_raca, sexo, idade, nota_ciencias_humanas, nota_linguagens_e_codigos, nota_ciencias_da_natureza, nota_matematica, nota_redacao, nota_media, ano_termino_ensino_medio)
VALUES('2020', '        200003448596', '32', '3205309', 'Parda', 'Masculino', 23, 635, 700, 841, 684, 741, 694, '2022'::bpchar);


-- 4.	Exclua todos os candidatos do estado de “São Paulo (SP)” da tabela candidatos_enem.

DELETE FROM public.candidatos_enem_2022
WHERE co_uf_prova='35';



-- 5.	Altere as notas de matemática dos candidatos que tiraram menos de 400 pontos para zero (0) na tabela candidatos_enem.


UPDATE public.candidatos_enem_2022
SET nota_matematica = 0
WHERE nota_matematica < 400;


-- 6.	Quantos candidatos existem em cada estado?

select count(*)
from candidatos_enem_2022 CA, municipios_ibge MU
where CA.municipio_prova = MU.codigo_municipio_dv
group by uf_prova;


-- 7.	Faça uma consulta que junte as tabelas candidatos_enem com a tabela município_ibge

select count(*)
from candidatos_enem_2022 CA, municipios_ibge MU
where CA.municipio_prova = MU.codigo_municipio_dv;