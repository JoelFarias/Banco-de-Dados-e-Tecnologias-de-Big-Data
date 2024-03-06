create table Disciplina (
Codigo_Disciplina varchar(7) not null,
Nome_Disciplina varchar (255) not null,
Carga_Horaria_Disciplina int not null,
Modalidade_Disciplina varchar(12) not null,

constraint pk_Disciplina primary key(Codigo_Disciplina)
);

create table Aluno (
Matricula_Aluno char(10) not null,
Nome_Aluno varchar(255) not null,

constraint pk_Aluno primary key(Matricula_Aluno)
);

create table Turma (
Codigo_Turma varchar(255) not null,
Ano int not null,
Semestre int not null,
Vagas int not null,

constraint pk_Turma primary key(Codigo_Turma, Ano, Semestre)
);

create table Matriculado (
Mat_Aluno varchar(255),
Co_Disciplina varchar(255),
Co_Turma varchar(255),
Anos int,
Seme_Mat int,

constraint fk_Mat_Aluno foreign key (Mat_Aluno) references Aluno (Matricula_Aluno),
constraint fk_Cod_Dis foreign key (Co_Disciplina) references Disciplina (Codigo_Disciplina),
constraint fk_Cod_Tur foreign key (Co_Turma,Anos,Seme_Mat) references Turma (Codigo_Turma,Ano,Semestre)
);


alter table Disciplina add constraint Ca_Disciplina check (Carga_Horaria_Disciplina<=60);

alter table Turma add constraint Sem_Tu check (Semestre = 1 or Semestre = 2);





insert into Disciplina (Codigo_Disciplina, Nome_Disciplina, Carga_Horaria_Disciplina, Modalidade_Disciplina)
VALUES
    ('CIA003', 'Introdução à Progamação de Computadores', '60', 'Presencial'),
	('CIA054', 'Tópicos de Matemática', '60', 'Presencial'),
	('CIA007', 'Estatística Aplicada para Ciência de Dados', '60', 'Presencial'),
	('CIA011', 'Fundamentos de Lógica Matemática para Inteligência Artificial', '60', 'Presencial'),
	('CIA002', 'Cálculo Aplicado 1 para Ciência de Dados', '60','Presencial'),
	('CIA014', 'Análise Exploratória de Dados e Visualização', '60','Presencial'),
	('MDCI189', 'Empreendorismo e Startup', '30', '100 On-line'),
	('HMDC668', 'Análise Multivariada', '60', 'Híbrida');

INSERT INTO Turma (Codigo_Turma, Ano, Semestre, Vagas)
VALUES
	('CIADM1B', '2023', '2', '30'),
	('CIADM3A', '2024', '1', '40');

INSERT INTO Aluno (Matricula_Aluno, Nome_Aluno)
VALUES
	('2312120015', 'Adryan Gabriel Salles Rodrigues'),
	('2312120026', 'Bruno Pereira De Souza'),
	('2312120028', 'Caio Rosendo Jácome'),
	('2312120014', 'Carlos Henrique De Brito Teles'),
	('1912120010', 'Dilson Dos Santos Boaventura'),
	('2112120005', 'Erik Ryan Brum Schubert Henz Dias'),
	('2312120012', 'Felipe Moreira Schulz'),
	('2312120020', 'Gabriel Buschinelli dos Santos'),
	('2312120011', 'Gabriel César de França Pereira'),
	('2322120005', 'Gustavo Figueredo Borges'),
	('2322120011', 'Jhecy Ketlin Gomes Vieira'),
	('2312120033', 'Jhonatas Cortes Mares'),
	('2312120036', 'Joel Carolino Farias'),
	('2312120007', 'Jorge Patricio de Araujo Ferreira Lima'),
	('2312120017', 'Leonardo Araujo Pereira'),
	('2312120032', 'Leonardo Borges Silva Braga'),
	('2312120034', 'Lucas Inácio Radel'),
	('2322120009', 'Marcio de Resende Torres'),
	('2312120031', 'Marcos Moabio da Silva Costa'),
	('2322120020', 'Marcos Paulo Benigno da Silva'),
	('2322120021', 'Matheus Kauan da Silva Correia'),
	('2322120018', 'Matheus da Silva Santos'),
	('2322120003', 'Paulo Tiago Barbosa'),
	('2312120008', 'Pedro Martins Rodrigues'),
	('2322120019', 'Victor Felipe Veras Bastos'),
	('2312120027', 'Walkíria Faleiro Coutinho'),
	('2312120030', 'William Wallace Ribeiro Matos');

INSERT INTO Turma (Codigo_Turma, Ano, Semestre, Vagas)
values
	('CIADM1B', '2024', '1','30');


--TURMA CIADM1B 

insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2312120015','CIA011','CIADM1B','2023','2'),
('2312120015','CIA003','CIADM1B','2023','2'),
('2312120015','CIA054','CIADM1B','2023','2'),
('2312120015','CIA007','CIADM1B','2023','2'),
('2312120026','CIA003','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2312120026','CIA007','CIADM1B','2023','2'),
('2312120026','CIA011','CIADM1B','2023','2'),
('2312120026','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2312120028','CIA003','CIADM1B','2023','2'),
('2312120028','CIA007','CIADM1B','2023','2'),
('2312120028','CIA011','CIADM1B','2023','2'),
('2312120028','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2312120014','CIA003','CIADM1B','2023','2'),
('2312120014','CIA007','CIADM1B','2023','2'),
('2312120014','CIA011','CIADM1B','2023','2'),
('2312120014','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('1912120010','CIA003','CIADM1B','2023','2'),
('1912120010','CIA007','CIADM1B','2023','2'),
('1912120010','CIA011','CIADM1B','2023','2'),
('1912120010','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2112120005','CIA003','CIADM1B','2023','2'),
('2112120005','CIA007','CIADM1B','2023','2'),
('2112120005','CIA011','CIADM1B','2023','2'),
('2112120005','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2312120012','CIA003','CIADM1B','2023','2'),
('2312120012','CIA007','CIADM1B','2023','2'),
('2312120012','CIA011','CIADM1B','2023','2'),
('2312120012','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2312120020','CIA003','CIADM1B','2023','2'),
('2312120020','CIA007','CIADM1B','2023','2'),
('2312120020','CIA011','CIADM1B','2023','2'),
('2312120020','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2312120011','CIA003','CIADM1B','2023','2'),
('2312120011','CIA007','CIADM1B','2023','2'),
('2312120011','CIA011','CIADM1B','2023','2'),
('2312120011','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2322120005','CIA003','CIADM1B','2023','2'),
('2322120005','CIA007','CIADM1B','2023','2'),
('2322120005','CIA011','CIADM1B','2023','2'),
('2322120005','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2322120011','CIA003','CIADM1B','2023','2'),
('2322120011','CIA007','CIADM1B','2023','2'),
('2322120011','CIA011','CIADM1B','2023','2'),
('2322120011','CIA054','CIADM1B','2023','2');

insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2312120033','CIA003','CIADM1B','2023','2'),
('2312120033','CIA007','CIADM1B','2023','2'),
('2312120033','CIA011','CIADM1B','2023','2'),
('2312120033','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2312120036','CIA003','CIADM1B','2023','2'),
('2312120036','CIA007','CIADM1B','2023','2'),
('2312120036','CIA011','CIADM1B','2023','2'),
('2312120036','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2312120007','CIA003','CIADM1B','2023','2'),
('2312120007','CIA007','CIADM1B','2023','2'),
('2312120007','CIA011','CIADM1B','2023','2'),
('2312120007','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2312120017','CIA003','CIADM1B','2023','2'),
('2312120017','CIA007','CIADM1B','2023','2'),
('2312120017','CIA011','CIADM1B','2023','2'),
('2312120017','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2312120032','CIA003','CIADM1B','2023','2'),
('2312120032','CIA007','CIADM1B','2023','2'),
('2312120032','CIA011','CIADM1B','2023','2'),
('2312120032','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2312120034','CIA003','CIADM1B','2023','2'),
('2312120034','CIA007','CIADM1B','2023','2'),
('2312120034','CIA011','CIADM1B','2023','2'),
('2312120034','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2322120009','CIA003','CIADM1B','2023','2'),
('2322120009','CIA007','CIADM1B','2023','2'),
('2322120009','CIA011','CIADM1B','2023','2'),
('2322120009','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2312120031','CIA003','CIADM1B','2023','2'),
('2312120031','CIA007','CIADM1B','2023','2'),
('2312120031','CIA011','CIADM1B','2023','2'),
('2312120031','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2322120020','CIA003','CIADM1B','2023','2'),
('2322120020','CIA007','CIADM1B','2023','2'),
('2322120020','CIA011','CIADM1B','2023','2'),
('2322120020','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2322120021','CIA003','CIADM1B','2023','2'),
('2322120021','CIA007','CIADM1B','2023','2'),
('2322120021','CIA011','CIADM1B','2023','2'),
('2322120021','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2322120018','CIA003','CIADM1B','2023','2'),
('2322120018','CIA007','CIADM1B','2023','2'),
('2322120018','CIA011','CIADM1B','2023','2'),
('2322120018','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2322120003','CIA003','CIADM1B','2023','2'),
('2322120003','CIA007','CIADM1B','2023','2'),
('2322120003','CIA011','CIADM1B','2023','2'),
('2322120003','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2312120008','CIA003','CIADM1B','2023','2'),
('2312120008','CIA007','CIADM1B','2023','2'),
('2312120008','CIA011','CIADM1B','2023','2'),
('2312120008','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2322120019','CIA003','CIADM1B','2023','2'),
('2322120019','CIA007','CIADM1B','2023','2'),
('2322120019','CIA011','CIADM1B','2023','2'),
('2322120019','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2312120027','CIA003','CIADM1B','2023','2'),
('2312120027','CIA007','CIADM1B','2023','2'),
('2312120027','CIA011','CIADM1B','2023','2'),
('2312120027','CIA054','CIADM1B','2023','2');
insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2312120030','CIA003','CIADM1B','2023','2'),
('2312120030','CIA007','CIADM1B','2023','2'),
('2312120030','CIA011','CIADM1B','2023','2'),
('2312120030','CIA054','CIADM1B','2023','2');

--TURMA CIADM3A

insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2312120036','CIA014','CIADM3A','2024','1'),
('2312120036','MDCI189','CIADM3A','2024','1'),
('2312120036','HMDC668','CIADM3A','2024','1');

insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2312120030','CIA014','CIADM3A','2024','1'),
('2312120030','MDCI189','CIADM3A','2024','1'),
('2312120030','HMDC668','CIADM3A','2024','1'),
('2322120009','CIA014','CIADM3A','2024','1'),
('2322120009','MDCI189','CIADM3A','2024','1'),
('2322120009','HMDC668','CIADM3A','2024','1'),
('2312120015','CIA014','CIADM3A','2024','1'),
('2312120015','MDCI189','CIADM3A','2024','1'),
('2312120015','HMDC668','CIADM3A','2024','1'),
('2312120033','CIA014','CIADM3A','2024','1'),
('2312120033','MDCI189','CIADM3A','2024','1'),
('2312120033','HMDC668','CIADM3A','2024','1');

--TURMA CIADM1B

insert into Matriculado (Mat_Aluno, Co_Disciplina, Co_Turma, Anos, Seme_Mat)
values
('2322120005','CIA002','CIADM1B','2024','1'),
('2322120011','CIA002','CIADM1B','2024','1'),
('2322120009','CIA002','CIADM1B','2024','1'),
('2322120020','CIA002','CIADM1B','2024','1'),
('2322120021','CIA002','CIADM1B','2024','1'),
('2322120018','CIA002','CIADM1B','2024','1'),
('2322120003','CIA002','CIADM1B','2024','1'),
('2322120019','CIA002','CIADM1B','2024','1');


