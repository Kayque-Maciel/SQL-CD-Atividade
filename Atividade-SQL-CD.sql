create database db_cds;


use db_cds;

create table tb_artistas(
	idArtista int auto_increment not null,
    NomeArtista varchar(256) not null UNIQUE,
    constraint PK_artistas primary key (idArtista)
    );

INSERT INTO tb_artistas VALUES
  (NULL, 'João Silva'),
  (NULL, 'Maria Santos'),
  (NULL, 'Pedro Almeida'),
  (NULL, 'Ana Oliveira'),
  (NULL, 'Carlos Sousa'),
  (NULL, 'Mariana Costa'),
  (NULL, 'Ricardo Pereira'),
  (NULL, 'Sofia Mendes'),
  (NULL, 'André Fernandes'),
  (NULL, 'Patrícia Rodrigues');
  
create table tb_gravadoras(
	idGravadora int auto_increment not null,
    NomeGravadora varchar(256) not null UNIQUE,
    constraint PK_gravadoras primary key (idGravadora)
    );
    
INSERT INTO tb_gravadoras VALUES
  (NULL, 'Gravadora A'),
  (NULL, 'Gravadora B'),
  (NULL, 'Gravadora C'),
  (NULL, 'Gravadora D'),
  (NULL, 'Gravadora E'),
  (NULL, 'Gravadora F'),
  (NULL, 'Gravadora G'),
  (NULL, 'Gravadora H'),
  (NULL, 'Gravadora I'),
  (NULL, 'Gravadora J');
  
  UPDATE tb_gravadoras
SET NomeGravadora = CASE idGravadora
    WHEN 1 THEN 'Universal Music Group'
    WHEN 2 THEN 'Sony Music Entertainment'
    WHEN 3 THEN 'Warner Music Group'
    WHEN 4 THEN 'EMI Group'
    WHEN 5 THEN 'BMG Rights Management'
    WHEN 6 THEN 'Atlantic Records'
    WHEN 7 THEN 'Capitol Records'
    WHEN 8 THEN 'Interscope Records'
    WHEN 9 THEN 'Columbia Records'
    WHEN 10 THEN 'RCA Records'
    END
WHERE idGravadora IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

    
create table tb_categorias(
	idCategoria int auto_increment not null,
    NomeCategoria varchar(100) not null UNIQUE,
    constraint PK_categorias primary key (idCategoria)
    );
    
INSERT INTO tb_categorias VALUES
  (NULL, 'Rock'),
  (NULL, 'Pop'),
  (NULL, 'R&B'),
  (NULL, 'Hip Hop'),
  (NULL, 'Jazz'),
  (NULL, 'Eletrônica'),
  (NULL, 'Reggae'),
  (NULL, 'Sertanejo'),
  (NULL, 'Funk'),
  (NULL, 'Country');

create table tb_estados(
	SiglaEstado char(2) not null,
    NomeEstado varchar(100) not null UNIQUE,
    constraint PK_estados primary key (SiglaEstado)
    );
    
INSERT INTO tb_estados VALUES
  ('AC', 'Acre'),
  ('AL', 'Alagoas'),
  ('AP', 'Amapá'),
  ('AM', 'Amazonas'),
  ('BA', 'Bahia'),
  ('CE', 'Ceará'),
  ('DF', 'Distrito Federal'),
  ('ES', 'Espírito Santo'),
  ('GO', 'Goiás'),
  ('MA', 'Maranhão');

    
create table tb_cidades(
	idCidade int auto_increment not null,
    SiglaEstado char(2) not null,
    NomeCidade varchar(100) not null,
    constraint PK_cidades primary key (idCidade),
    constraint FK_cidades_estados foreign key (SiglaEstado)
		references tb_estados (SiglaEstado)
    );
    
INSERT INTO tb_cidades VALUES
  (NULL, 'AC', 'Rio Branco'),
  (NULL, 'AL', 'Maceió'),
  (NULL, 'AP', 'Macapá'),
  (NULL, 'AM', 'Manaus'),
  (NULL, 'BA', 'Salvador'),
  (NULL, 'CE', 'Fortaleza'),
  (NULL, 'DF', 'Brasília'),
  (NULL, 'ES', 'Vitória'),
  (NULL, 'GO', 'Goiânia'),
  (NULL, 'MA', 'São Luís');

create table tb_clientes(
	idCliente int auto_increment not null,
	idCidade int not null,
	NomeCliente varchar(100) not null,
	EnderecoCliente varchar(200) not null,
	RendaCliente decimal (10,2) not null,
	SexoCliente char(1) not null,
    constraint PK_clientes primary key (idCliente),
    constraint FK_clientes_cidades foreign key (idCidade)
		references tb_cidades (idCidade)
);

INSERT INTO tb_clientes VALUES
  (NULL, 1, 'Ana Silva', 'Rua dos Flores, 123', 2500.00, 'F'),
  (NULL, 2, 'João Santos', 'Avenida das Palmeiras, 456', 3500.00, 'M'),
  (NULL, 3, 'Maria Oliveira', 'Rua Principal, 789', 1800.00, 'F'),
  (NULL, 4, 'Pedro Almeida', 'Rua das Pedras, 987', 4000.00, 'M'),
  (NULL, 5, 'Carla Souza', 'Avenida Central, 321', 2800.00, 'F'),
  (NULL, 6, 'Luiz Costa', 'Travessa das Estrelas, 654', 3200.00, 'M'),
  (NULL, 7, 'Mariana Pereira', 'Rua das Oliveiras, 741', 2200.00, 'F'),
  (NULL, 8, 'Rafael Mendes', 'Avenida dos Coqueiros, 852', 2900.00, 'M'),
  (NULL, 9, 'Sofia Fernandes', 'Rua do Sol, 369', 3800.00, 'F'),
  (NULL, 10, 'André Rodrigues', 'Avenida das Flores, 159', 2700.00, 'M');

create table tb_conjuges(
	idCliente int not null,
    NomeConjuge varchar(100) not null,
    RendaConjuge decimal(10,2),
    SexoConjuge char(1),
    constraint PK_conjuges primary key (idCliente)
    );
    
INSERT INTO tb_conjuges VALUES
  (1, 'Maria Silva', 2000.00, 'F'),
  (2, 'Pedro Santos', 2500.00, 'M'),
  (3, 'Felipe Oliveira', 1800.00, 'M'),
  (4, 'João Almeida', 3000.00, 'M'),
  (5, 'Carla Souza', 2200.00, 'F'),
  (6, 'Sandra Costa', 2800.00, 'F'),
  (7, 'Mariana Pereira', 1900.00, 'F'),
  (8, 'Rafaela Mendes', 2700.00, 'F'),
  (9, 'Caio Fernandes', 2500.00, 'M'),
  (10, 'Andreia Rodrigues', 2300.00, 'F');
  
    
create table tb_funcionarios(
	idFuncionario int auto_increment not null,
    NomeFuncionario varchar(100) not null,
    EnderecoFuncionario varchar(200) not null,
    SalarioFuncionario decimal(10,2) not null,
    SexoFuncionario char(1),
    constraint PK_funcionarios primary key (idFuncionario)
    );
    
INSERT INTO tb_funcionarios VALUES
  (NULL, 'João Silva', 'Rua dos Flores, 123', 2500.00, 'M'),
  (NULL, 'Maria Santos', 'Avenida das Palmeiras, 456', 3500.00, 'F'),
  (NULL, 'Pedro Oliveira', 'Rua Principal, 789', 1800.00, 'M'),
  (NULL, 'Ana Almeida', 'Rua das Pedras, 987', 4000.00, 'F'),
  (NULL, 'Carlos Souza', 'Avenida Central, 321', 2800.00, 'M'),
  (NULL, 'Luiza Costa', 'Travessa das Estrelas, 654', 3200.00, 'F'),
  (NULL, 'Mariano Pereira', 'Rua das Oliveiras, 741', 2200.00, 'M'),
  (NULL, 'Rafaela Mendes', 'Avenida dos Coqueiros, 852', 2900.00, 'F'),
  (NULL, 'Sergio Fernandes', 'Rua do Sol, 369', 3800.00, 'M'),
  (NULL, 'Andrea Rodrigues', 'Avenida das Flores, 159', 2700.00, 'F');

    
create table tb_dependente(
	idDependente int auto_increment not null,
    idFuncionario int not null,
    NomeDependete varchar(100) not null,
    SexoDependente char(1) not null,
    constraint PK_dependentes primary key (idDependente),
    constraint FK_dependetes_funcionarios foreign key (idFuncionario)
		references tb_funcionarios (idFuncionario)
    );
    
INSERT INTO tb_dependente VALUES
  (NULL, 1, 'Ana Silva', 'F'),
  (NULL, 2, 'Pedro Santos', 'M'),
  (NULL, 3, 'Maria Oliveira', 'F'),
  (NULL, 4, 'João Almeida', 'M'),
  (NULL, 5, 'Carla Souza', 'F'),
  (NULL, 6, 'Luiz Costa', 'M'),
  (NULL, 7, 'Mariana Pereira', 'F'),
  (NULL, 8, 'Rafael Mendes', 'M'),
  (NULL, 9, 'Sofia Fernandes', 'F'),
  (NULL, 10, 'André Rodrigues', 'M');
    
create table tb_titulos(
	idTitulo int auto_increment not null,
	idCategoria int not null,
    idGravadora int not null,
    Nome_CD varchar(100) not null UNIQUE,
    Valor_CD decimal(10,2) not null,
    Quantidade_Estoque int not null,
    constraint PK_titulos primary key (idTitulo),
    constraint FK_categorias_titulos foreign key (idCategoria)
		references tb_categorias (idCategoria),
	constraint FK_gravadoras_titulos foreign key (idGravadora)
		references tb_gravadoras (idGravadora)
    );
    
    INSERT INTO tb_titulos VALUES
  (NULL, 1, 1, 'CD Aleatório 1', 19.99, 50),
  (NULL, 2, 2, 'CD Aleatório 2', 14.99, 30),
  (NULL, 3, 3, 'CD Aleatório 3', 12.99, 20),
  (NULL, 4, 4, 'CD Aleatório 4', 17.99, 40),
  (NULL, 5, 5, 'CD Aleatório 5', 24.99, 60),
  (NULL, 6, 6, 'CD Aleatório 6', 9.99, 15),
  (NULL, 7, 7, 'CD Aleatório 7', 21.99, 35),
  (NULL, 8, 8, 'CD Aleatório 8', 16.99, 25),
  (NULL, 9, 9, 'CD Aleatório 9', 11.99, 10),
  (NULL, 10, 10, 'CD Aleatório 10', 29.99, 55);
  
  UPDATE tb_titulos
SET Nome_CD = CASE idTitulo
    WHEN 1 THEN 'Greatest Hits'
    WHEN 2 THEN 'The Dark Side of the Moon'
    WHEN 3 THEN 'Thriller'
    WHEN 4 THEN 'Abbey Road'
    WHEN 5 THEN 'Back in Black'
    WHEN 6 THEN 'Nevermind'
    WHEN 7 THEN 'Rumours'
    WHEN 8 THEN 'The Joshua Tree'
    WHEN 9 THEN 'OK Computer'
    WHEN 10 THEN 'Led Zeppelin IV'
    END
WHERE idTitulo IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

create table tb_pedidos(
	idPedido int auto_increment not null,
    idCliente int not null,
    idFuncionario int not null,
    Data_Pedido datetime not null,
    Valor_Pedido decimal(10,2) not null,
    constraint PK_pedidos primary key (idPedido),
    constraint FK_clientes_pedidos foreign key (idCliente)
		references tb_clientes (idCliente),
	constraint FK_funcionarios_pedidos foreign key (idFuncionario)
		references tb_funcionarios (idFuncionario)
    );
    
    INSERT INTO tb_pedidos VALUES
  (NULL, 1, 1, '2023-05-01', 100.00),
  (NULL, 2, 2, '2023-05-02', 150.00),
  (NULL, 3, 3, '2023-05-03', 200.00),
  (NULL, 4, 4, '2023-05-04', 120.00),
  (NULL, 5, 5, '2023-05-05', 180.00),
  (NULL, 6, 6, '2023-05-06', 90.00),
  (NULL, 7, 7, '2023-05-07', 130.00),
  (NULL, 8, 8, '2023-05-08', 170.00),
  (NULL, 9, 9, '2023-05-09', 110.00),
  (NULL, 10, 10, '2023-05-10', 140.00);

create table tb_titulospedidos(
	idPedido int not null,
    idTitulo int not null,
    Quantidade_CD int not null,
    Valor_CD decimal(10,2) not null,
    constraint FK_pedidos_titulospedidos foreign key (idPedido)
		references tb_pedidos (idPedido),
	constraint FK_titulos_titulospedidos foreign key (idTitulo)
		references tb_titulos (idTitulo)
    );
    
INSERT INTO tb_titulospedidos VALUES
  (1, 1, 5, 19.99),
  (2, 2, 3, 14.99),
  (3, 3, 2, 12.99),
  (4, 4, 4, 17.99),
  (5, 5, 6, 24.99),
  (6, 6, 1, 9.99),
  (7, 7, 4, 21.99),
  (8, 8, 3, 16.99),
  (9, 9, 2, 11.99),
  (10, 10, 5, 29.99);

create table tb_titulosartistas(
	idTitulo int not null,
    idArtista int not null,
    constraint FK_titulos_titulosartistas foreign key (idTitulo)
		references tb_titulos (idTitulo),
	constraint FK_artistas_titulosartistas foreign key (idArtista)
		references tb_artistas (idArtista)
    );
    
    INSERT INTO tb_titulosartistas VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);


SELECT tb_categorias.NomeCategoria, tb_titulos.Nome_CD
FROM tb_categorias
JOIN tb_titulos ON tb_categorias.idCategoria = tb_titulos.idCategoria;

SELECT tc.NomeCategoria, tt.Nome_CD
FROM tb_categorias tc
JOIN tb_titulos tt ON tc.idCategoria = tt.idCategoria;

SELECT tc.NomeCategoria, tt.Nome_CD
FROM tb_categorias tc, tb_titulos tt WHERE tc.idCategoria = tt.idCategoria;


SELECT tb_pedidos.idPedido, tb_clientes.NomeCliente
FROM tb_pedidos
JOIN tb_clientes ON tb_pedidos.idPedido = tb_clientes.idCliente;



SELECT tb_funcionarios.NomeFuncionario, tb_dependente.NomeDependete
FROM tb_funcionarios, tb_dependente WHERE tb_funcionarios.idFuncionario = tb_dependente.idFuncionario
LIMIT 6;


SELECT tb_funcionarios.NomeFuncionario, tb_pedidos.Valor_pedido
FROM tb_funcionarios
JOIN tb_pedidos ON tb_funcionarios.idFuncionario = tb_pedidos.idFuncionario
LIMIT 10;

SELECT tb_clientes.NomeCliente, tb_cidades.NomeCidade
FROM tb_clientes
JOIN tb_cidades ON tb_clientes.idCidade = tb_cidades.idCidade
WHERE tb_clientes.SexoCliente = 'F'
LIMIT 4;

SELECT tb_titulos.Nome_CD, tb_gravadoras.NomeGravadora
FROM tb_titulos
JOIN tb_gravadoras ON tb_titulos.idGravadora = tb_gravadoras.idGravadora
WHERE tb_titulos.Nome_CD LIKE 'R%' OR tb_titulos.Nome_CD LIKE 'T%';

SELECT tb_titulos.Nome_CD, tb_gravadoras.NomeGravadora, tb_titulos.Valor_CD, tb_titulos.Quantidade_Estoque
FROM tb_titulos
JOIN tb_gravadoras ON tb_titulos.idGravadora = tb_gravadoras.idGravadora
WHERE tb_titulos.Quantidade_estoque <500;

SELECT tb_clientes.NomeCliente, tb_pedidos.Valor_pedido
FROM tb_clientes
JOIN tb_pedidos ON tb_clientes.idCliente = tb_pedidos.idCliente
WHERE tb_clientes.SexoCliente = 'F'
AND YEAR(tb_pedidos.Data_pedido) = 2002
AND MONTH(tb_pedidos.Data_pedido) = 6
LIMIT 1;

SELECT tb_pedidos.idPedido, tb_pedidos.Valor_pedido, tb_pedidos.Data_pedido, tb_funcionarios.NomeFuncionario
FROM tb_pedidos
JOIN tb_funcionarios ON tb_pedidos.idFuncionario = tb_funcionarios.idFuncionario
WHERE YEAR(tb_pedidos.Data_pedido) = 2003
AND tb_funcionarios.NomeFuncionario LIKE 'Paula%'
LIMIT 2;

SELECT tb_pedidos.idPedido, tb_pedidos.Valor_pedido, tb_clientes.NomeCliente
FROM tb_pedidos
JOIN tb_clientes ON tb_pedidos.idCliente = tb_clientes.idCliente
ORDER BY tb_pedidos.Valor_pedido DESC
LIMIT 1;

SELECT DISTINCT tb_artistas.NomeArtista, tb_categorias.NomeCategoria 
FROM tb_artistas 
JOIN tb_categorias ON tb_artistas.idArtista = tb_categorias.idCategoria;

SELECT tb_clientes.NomeCliente, tb_clientes.idCliente, tb_funcionarios.NomeFuncionario, tb_funcionarios.idFuncionario 
FROM tb_clientes
JOIN tb_funcionarios ON tb_clientes.idCliente = tb_funcionarios.idFuncionario;

SELECT tb_clientes.NomeCliente, tb_titulos.Nome_CD 
FROM tb_clientes
JOIN tb_titulos ON tb_clientes.idCliente = tb_titulos.idTitulo;

SELECT tb_titulos.Nome_CD, tb_gravadoras.NomeGravadora, tb_categorias.NomeCategoria 
FROM tb_titulos
JOIN tb_gravadoras ON tb_titulos.idTitulo = tb_gravadoras.idGravadora 
JOIN tb_categorias ON tb_gravadoras.idGravadora= tb_categorias.idCategoria;

SELECT tb_funcionarios.NomeFuncionario, tb_dependente.NomeDependete, tb_clientes.NomeCliente, tb_conjuges.NomeConjuge 
FROM tb_funcionarios
JOIN tb_dependente ON tb_funcionarios.idFuncionario = tb_dependente.idDependente 
JOIN tb_clientes ON tb_dependente.idDependente= tb_clientes.idCliente 
JOIN tb_conjuges ON tb_clientes.idCliente= tb_conjuges.idCliente;

SELECT tb_clientes.NomeCliente, tb_funcionarios.NomeFuncionario, tb_titulos.Nome_CD, tb_categorias.NomeCategoria, tb_gravadoras.NomeGravadora 
FROM tb_clientes
JOIN tb_funcionarios ON tb_clientes.idCliente = tb_funcionarios.idFuncionario 
JOIN tb_titulos ON tb_funcionarios.idFuncionario= tb_titulos.idTitulo 
JOIN tb_categorias ON tb_titulos.idTitulo= tb_categorias.idCategoria 
JOIN tb_gravadoras ON tb_categorias.idCategoria= tb_gravadoras.idGravadora;















    

















