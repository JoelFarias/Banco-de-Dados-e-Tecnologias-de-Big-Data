-- Criação das tabelas de do BD do Enem (Dados sem anomalias) ---

#Criação da tabela de unidades da federação

-- Drop table unidade_federacao

create table unidade_federacao
(co_uf_prova     char(2) not null,
 sg_uf_prova     char(2) not null,
constraint pk_unidade_federacao Primary key (co_uf_prova)
);

#Criação da tabela de municipios

-- Drop table municipios_ibge;

create table municipios_ibge
(CODIGO_MUNICIPIO_DV   Char(7) not null,
 CODIGO_MUNICIPIO      Char(6) not null,
 NOME_MUNICIPIO        VARCHAR(32) Not Null, 
 UF                    Char(2)  Not Null,
 UF_Codigo             Char(2) Not Null, 
 UF_Nome               VARCHAR(20) Not Null,
 Municipio_Capital     Char(3) Not Null, 
 Regiao_Codigo         Char(1) Not Null, 
 Regiao_Nome           Char(12) Not Null, 
 LONGITUDE             Numeric (12,9) Not Null, 
 LATITUDE              Numeric (12,9) Not Null,
Constraint pk_municipios_ibge Primary key (CODIGO_MUNICIPIO_DV)
);


#Criação da tabela de Candidatos

-- drop table CANDIDATOS_ENEM;

create table CANDIDATOS_ENEM
(
 Ano_Enem                     Char(04) Not Null,
 Numero_Inscricao             Char(20) Not Null, 
 UF_Prova                     char(2) not null,  
 MUNICIPIO_PROVA              Char(7) not null,
 COR_RACA                     Char(15) not null, 
 SEXO                         Char(15) Not Null,
 Idade                        Numeric (3) Not Null,
 NOTA_CIENCIAS_HUMANAS        Numeric (6,2) Not Null,
 NOTA_LINGUAGENS_E_CODIGOS    Numeric (6,2) Not Null,
 NOTA_CIENCIAS_DA_NATUREZA    Numeric (6,2) Not Null,
 NOTA_MATEMATICA              Numeric (6,2) Not Null,
 NOTA_REDACAO                 Numeric (6,2) Not Null,
 NOTA_MEDIA                   Numeric (6,2) Not Null,
Constraint pk_candidatos_enem_2021 Primary key(Ano_Enem, Numero_Inscricao),
Constraint fk_candidatos_uf foreign key (UF_PROVA) references unidade_federacao (co_uf_prova),
Constraint fk_candidatos_municipio foreign key (MUNICIPIO_PROVA) references municipios_ibge (CODIGO_MUNICIPIO_DV)
);