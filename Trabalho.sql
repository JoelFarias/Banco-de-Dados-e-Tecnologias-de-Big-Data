-- Criação da tabela Loja
CREATE TABLE Loja (
    Número_Loja VARCHAR(3) PRIMARY KEY,
    Endereço VARCHAR(255),
    Cidade VARCHAR(255),
    Estado CHAR(2)
);

-- Criação da tabela Empregado
CREATE TABLE Empregado (
    CPF_Empregado CHAR(11) PRIMARY KEY,
    Nome VARCHAR(255),
    Sexo VARCHAR(10),
    Data_de_Nascimento DATE,
    Funcao VARCHAR(255) CHECK (Funcao IN ('Gerente', 'Estoquista', 'Caixa', 'Padeiro', 'Açogueiro', 'Atendente')),
    Loja_de_trabalho VARCHAR(3) REFERENCES Loja (Número_Loja)
);

-- Criação da tabela Produto
CREATE TABLE Produto (
    Codigo_Produto CHAR(6) PRIMARY KEY,
    Nome_Produto VARCHAR(255),
    Unidade_de_Medida VARCHAR(10)
);

-- Criação da tabela Estoque
CREATE TABLE Estoque (
    Loja_Estoque VARCHAR(3),
    Codigo_Produto CHAR(6),
    Quantidade_em_Estoque INT,
    Valor_Unitario NUMERIC(10, 2),
    PRIMARY KEY (Loja_Estoque, Codigo_Produto),
    FOREIGN KEY (Loja_Estoque) REFERENCES Loja (Número_Loja),
    FOREIGN KEY (Codigo_Produto) REFERENCES Produto (Codigo_Produto)
);

-- Criação da tabela Venda (Nota Fiscal)
CREATE TABLE Venda (
    Numero_Nota_Fiscal CHAR(3),
    Loja VARCHAR(3),
    Data_Venda DATE CHECK (Data_Venda >= '2020-01-02'),
    Codigo_Produto CHAR(6),
    Nome_Produto VARCHAR(255),
    Quantidade INT,
    Valor_Unitario NUMERIC(10, 2),
    Total_a_pagar NUMERIC(10, 2) GENERATED ALWAYS AS (Quantidade * Valor_Unitario) STORED,
    PRIMARY KEY (Numero_Nota_Fiscal),
    FOREIGN KEY (Loja) REFERENCES Loja (Número_Loja),
    FOREIGN KEY (Codigo_Produto) REFERENCES Produto (Codigo_Produto)
);
--Inserets: 

INSERT INTO Loja (Número_Loja, Endereço, Cidade, Estado)
VALUES
    ('001', 'SQS409, Bloco B, Loja 1, Asa Sul', 'Brasília', 'DF'),
    ('002', 'Estrada do Contorno, 413', 'Belo Horizonte', 'MG'),
    ('003', 'Av. Rio Branco, 123', 'Rio de Janeiro', 'RJ'),
    ('004', 'Rua Goiás, 456', 'Goiânia', 'GO'),
    ('005', 'Av. Brasília, 789', 'Brasília', 'DF'),
    ('006', 'Rua Minas Gerais, 567', 'Belo Horizonte', 'MG'),
    ('007', 'Av. Paulista, 1010', 'São Paulo', 'SP'),  --TENTAR VIOLAR O CHECK DE ESTADO
    ('008', 'Rua Ceará, 1234', 'Goiânia', 'GO'),
    ('009', 'Rua da Lapa, 678', 'Rio de Janeiro', 'RJ'),
    ('010', 'SQS306, Bloco C, Loja 4, Asa Sul', 'Brasília', 'DF');



INSERT INTO Empregado (CPF_Empregado, Nome, Sexo, Data_de_Nascimento, Funcao, Loja_de_trabalho)
VALUES
    ('334.557.889-87', 'Carlos Henrique Rodrigues', 'Masculino', '1987-09-07', 'Gerente', '001'),
    ('443.766.909-13', 'Maria Felisberto Soares', 'Feminino', '2000-05-15', 'Gerente', '002'),
    ('778.998.098-01', 'Leonardo Borges Azevedo', 'Masculino', '2004-09-13', 'Estoquista', '002'),
    ('123.456.789-10', 'Ana Souza', 'Feminino', '1990-02-20', 'Caixa', '001'),
    ('987.654.321-21', 'João Silva', 'Masculino', '2006-11-15', 'Padeiro', '003'), --TENTAR VIOLAR O CHECK DE IDADE
    ('555.555.555-55', 'Maria Santos', 'Feminino', '1978-08-30', 'Açogueiro', '004'),
    ('111.222.333-44', 'José Carvalho', 'Masculino', '1995-04-05', 'Atendente', '006'),
    ('999.888.777-66', 'Luciana Pereira', 'Feminino', '1982-07-12', 'Faxineira', '007'),--TENTAR VIOLAR O CHECK DE CARGO
    ('666.777.888-99', 'Paulo Oliveira', 'Masculino', '1989-10-25', 'Padeiro', '008'),
    ('222.333.444-55', 'Fernanda Santos', 'Feminino', '1992-03-18', 'Estoquista', '009');


    INSERT INTO Produto (Codigo_Produto, Nome_Produto, Unidade_de_Medida)
VALUES
    ('001.413', 'Batata inglesa', 'Kg'),
    ('001.417', 'Feijão preto', 'Kg'),
    ('001.621', 'Óleo de soja Lisa', 'Litro'),
    ('001.100', 'Arroz', 'Kg'),
    ('001.200', 'Feijão carioca', 'Kg'),
    ('001.300', 'Açúcar refinado', 'Kg'),
    ('001.700', 'Pão francês', 'Unidade'),
    ('001.800', 'Carne bovina', 'Kg'),
    ('001.900', 'Leite integral', 'Litro'),
    ('001.600', 'Frango', 'Kg');


INSERT INTO Estoque (Loja_Estoque, Codigo_Produto, Quantidade_em_Estoque, Valor_Unitario)
VALUES
    ('001', '001.413', 30, 3.50),
    ('001', '001.417', 50, 7.50),
    ('002', '001.621', 25, 12.67),
    ('003', '001.100', 40, 5.00),
    ('003', '001.200', 60, 6.50),
    ('004', '001.300', 35, 4.80),
    ('005', '001.700', 100, 0.60),
    ('005', '001.800', 20, 10.00),
    ('006', '001.900', 45, 2.80),
    ('007', '001.600', 55, 8.00);

INSERT INTO Venda (Numero_Nota_Fiscal, Loja, Data_Venda, Codigo_Produto, Nome_Produto, Quantidade, Valor_Unitario)
VALUES
INSERT INTO Estoque (Loja_Estoque, Codigo_Produto, Quantidade_em_Estoque, Valor_Unitario)
VALUES
    ('001', '001.413', 30, 3.50),
    ('001', '001.417', 50, 7.50),
    ('002', '001.621', 25, 12.67),
    ('003', '001.100', 40, 5.00),
    ('003', '001.200', 60, 6.50),
    ('004', '001.300', 35, 4.80),
    ('005', '001.700', 100, 0.60),
    ('005', '001.800', 20, 10.00),
    ('006', '001.900', 45, 2.80),
    ('007', '001.600', 55, 8.00);


