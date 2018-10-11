-- MySQL Script
-- 11 out 2018 17:00:06
-- Model: New Model    Version: 2.1
-- By Paulo Henrique Cardoso de Jesus
DROP DATABASE B2W;
-- Cria banco de dados caso não exista.
CREATE DATABASE IF NOT EXISTS B2W;
CREATE SCHEMA IF NOT EXISTS B2W DEFAULT CHARACTER SET utf8;
USE B2W;
-- Cria tabela item caso não exista na base de dados.
CREATE TABLE IF NOT EXISTS B2W.item(
	`idItem` INT NOT NULL AUTO_INCREMENT,
  	`Itemcol` INT NOT NULL,
  	PRIMARY KEY (`idItem`)
)ENGINE = InnoDB;
-- Inserir dados na tabela item.
INSERT INTO item(Itemcol) 
	VALUES 
		(1),
        (2),
        (3);
-- Cria tabela UF caso não exista.
CREATE TABLE IF NOT EXISTS `B2W`.`uf` (
  `idUf` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,  
  `Ufcol` CHAR(2) NOT NULL
)ENGINE = InnoDB;
-- Inserir dados na tabela UF.
INSERT INTO uf(Ufcol) 
	VALUES 
		("MT"),
        ("PE"),
        ("SP");
-- Cria tabela departamento caso não exista.
CREATE TABLE IF NOT EXISTS B2W.departamento (
  `idDepartamento` INT AUTO_INCREMENT NOT NULL,
  `Departamentocol` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idDepartamento`)
)ENGINE = InnoDB;
-- Inserir dados na tabela departamento.
INSERT INTO departamento(Departamentocol)
	VALUES 
		("Bolas de Gude"),
        ("Cadeiras"),
        ("Maquinas Fotograficas");
-- Cria tabela mês caso não exista.
CREATE TABLE IF NOT EXISTS B2W.mes(
  `idMes` INT NOT NULL AUTO_INCREMENT,
  `mescol` DATE NOT NULL,
  PRIMARY KEY (`idMes`)
)ENGINE = InnoDB;
-- Inserir dados na tabela mês.
INSERT INTO mes(mescol)
	VALUES 
		("2018-06-01"),
		("2018-07-02"),
        ("2018-08-03"),
        ("2018-09-04");
-- Cria tabela vendas caso não exista.
CREATE TABLE IF NOT EXISTS B2W.vendas(
  idVendas INT NOT NULL AUTO_INCREMENT,
  Vendascol INT NOT NULL,
	PRIMARY KEY (idVendas)
)ENGINE = InnoDB;
-- Adiciona Coluna fk_Item de tipo inteiro na tabela vendas não permitindo valor nulo.
ALTER TABLE vendas ADD COLUMN fk_Item INT NOT NULL;
-- Adiciona Coluna fk_Departamento na tabela de vendas.
ALTER TABLE vendas ADD COLUMN fk_Departamento INT NOT NULL;
-- Adiciona Coluna fk_Uf na tabela de vendas.
ALTER TABLE vendas ADD COLUMN fk_Uf INT NOT NULL;
-- Adiciona Coluna fk_mes na tabela de vendas.
ALTER TABLE vendas ADD COLUMN fk_Mes INT NOT NULL;
-- Adiciona uma restrição na coluna fk_item para aceitar apenas um valor já existente na tabela item(idItem).
ALTER TABLE vendas ADD CONSTRAINT vendas_item_fk
	FOREIGN KEY (fk_Item) REFERENCES item(idItem);
-- Adiciona uma restrição igual a da fk_item na coluna fk_Departamento com sua dependência na tabela departamento(idDepartamento).
ALTER TABLE vendas ADD CONSTRAINT vendas_departamento_fk
	FOREIGN KEY (fk_Departamento) REFERENCES departamento(idDepartamento);
-- Adiciona uma restrição como as anteriores nas respectivas dependências.
ALTER TABLE vendas ADD CONSTRAINT vendas_uf_fk
	FOREIGN KEY (fk_Uf) REFERENCES uf(idUf);
-- Adiciona uma restrição como as anteriores nas respectivas dependências.
ALTER TABLE vendas ADD CONSTRAINT vendas_mes_fk
	FOREIGN KEY (fk_Mes) REFERENCES mes(idMes);
-- Inserir dados na tabela vendas usando os respectivos id de cada chave estrangeira.
-- Para que essa inserção ocorra é preciso que as outras tabelas relacionadas possuam os dados inseridos.
INSERT INTO vendas(fk_Mes,fk_Departamento,fk_Uf,fk_Item,Vendascol)
	VALUES 
		(1,2,3,1,590),
		(1,2,3,2,439),
		(1,2,3,3,292),
		(2,2,3,1,1469),
		(2,2,3,2,1333),
		(2,2,3,3,1143),
		(3,2,3,1,1178),
		(3,2,3,2,1026),
		(3,2,3,3,865),
		(4,2,3,1,732),
		(4,2,3,2,571),
		(4,2,3,3,443),
		(1,2,2,1,260),
		(1,2,2,2,171),
		(1,2,2,3,85),
		(2,2,2,1,783),
		(2,2,2,2,718),
		(2,2,2,3,609),
		(3,2,2,1,610),
		(3,2,2,2,527),
		(3,2,2,3,430),
		(4,2,2,1,344),
		(4,2,2,2,260),
		(4,2,2,3,179),
		(1,2,1,1,173),
		(1,2,1,2,135),
		(1,2,1,3,94),
		(2,2,1,1,344),
		(2,2,1,2,341),
		(2,2,1,3,286),
		(3,2,1,1,276),
		(3,2,1,2,272),
		(3,2,1,3,221),
        (4,2,1,1,200),
        (4,2,1,2,161),
        (4,2,1,3,135),
		(1,3,3,1,260),
		(1,3,3,2,236),
		(1,3,3,3,177),
        (2,3,3,1,506),
        (2,3,3,2,522),
        (2,3,3,3,414),
        (3,3,3,1,420),
        (3,3,3,2,392),
        (3,3,3,3,356),
        (4,3,3,1,325),
        (4,3,3,2,242),
        (4,3,3,3,218),
        (1,3,2,1,131),
        (1,3,2,2,113),
        (1,3,2,3,68),
        (2,3,2,1,307),
        (2,3,2,2,238),
        (2,3,2,3,217),
        (3,3,2,1,264),
        (3,3,2,2,202),
        (3,3,2,3,183),
        (4,3,2,1,132),
        (4,3,2,2,111),
        (4,3,2,3,95),
        (1,3,1,1,126),
        (1,3,1,2,144),
        (1,3,1,3,99),
        (2,3,1,1,274),
        (2,3,1,2,251),
        (2,3,1,3,249),
        (3,3,1,1,171),
        (3,3,1,2,228),
        (3,3,1,3,200),
        (4,3,1,1,151),
        (4,3,1,2,154),
        (4,3,1,3,147),
        (1,1,3,1,706),
        (1,1,3,2,633),
        (1,1,3,3,519),
        (2,1,3,1,1243),
        (2,1,3,2,1160),
        (2,1,3,3,1131),
        (3,1,3,1,1101),
        (3,1,3,2,1001),
        (3,1,3,3,857),
        (4,1,3,1,811),
        (4,1,3,2,703),
        (4,1,3,3,640),
        (1,1,2,1,735),
        (1,1,2,2,635),
        (1,1,2,3,548),
        (2,1,2,1,1398),
        (2,1,2,2,1306),
        (2,1,2,3,1189),
        (3,1,2,1,1184),
        (3,1,2,2,1075),
        (3,1,2,3,963),
        (4,1,2,1,871),
        (4,1,2,2,763),
        (4,1,2,3,654),
        (1,1,1,1,479),
        (1,1,1,2,443),
        (1,1,1,3,357),
        (2,1,1,1,747),
        (2,1,1,2,710),
        (2,1,1,3,632),
        (3,1,1,1,639),
        (3,1,1,2,706),
        (3,1,1,3,648),
        (4,1,1,1,550),
        (4,1,1,2,512),
        (4,1,1,3,380);

-- Cria tabela visitas caso não exista.
CREATE TABLE IF NOT EXISTS B2W.visitas(
  idVisitas INT NOT NULL AUTO_INCREMENT,
  Visitascol INT NOT NULL,
	PRIMARY KEY (idVisitas)
)ENGINE = InnoDB;
-- Adiciona Coluna fk_Item de tipo inteiro na tabela visitas não permitindo valor nulo.
ALTER TABLE visitas ADD COLUMN fk_Item INT NOT NULL;
-- Adiciona Coluna fk_Departamento na tabela de visitas.
ALTER TABLE visitas ADD COLUMN fk_Departamento INT NOT NULL;
-- Adiciona Coluna fk_Uf na tabela de visitas.
ALTER TABLE visitas ADD COLUMN fk_Uf INT NOT NULL;
-- Adiciona Coluna fk_mes na tabela de visitas.
ALTER TABLE visitas ADD COLUMN fk_Mes INT NOT NULL;
-- Adiciona uma restrição na coluna fk_item para aceitar apenas um valor já existente na tabela item(idItem).
ALTER TABLE visitas ADD CONSTRAINT visitas_item_fk
	FOREIGN KEY (fk_Item) REFERENCES item(idItem);
-- Adiciona uma restrição igual a da fk_item na coluna fk_Departamento com sua dependência na tabela departamento(idDepartamento).
ALTER TABLE visitas ADD CONSTRAINT visitas_departamento_fk
	FOREIGN KEY (fk_Departamento) REFERENCES departamento(idDepartamento);
-- Adiciona uma restrição como as anteriores nas respectivas dependências.
ALTER TABLE visitas ADD CONSTRAINT visitas_uf_fk
	FOREIGN KEY (fk_Uf) REFERENCES uf(idUf);
-- Adiciona uma restrição como as anteriores nas respectivas dependências.
ALTER TABLE visitas ADD CONSTRAINT visitas_mes_fk
	FOREIGN KEY (fk_Mes) REFERENCES mes(idMes);
-- Inserir dados na tabela visitas usando os respectivos id de cada chave estrangeira.
-- Para que essa inserção ocorra é preciso que as outras tabelas relacionadas possuam os dados inseridos.
INSERT INTO visitas(fk_Mes,fk_Departamento,fk_Uf,fk_Item,visitascol)
	VALUES 
		(1,2,3,1,14304),
		(1,2,3,2,14258),
		(1,2,3,3,14325),
		(2,2,3,1,14873),
		(2,2,3,2,14849),
		(2,2,3,3,14052),
		(3,2,3,1,14236),
		(3,2,3,2,14362),
		(3,2,3,3,14195),
		(4,2,3,1,14855),
		(4,2,3,2,14405),
		(4,2,3,3,14042),
		(1,2,2,1,8997),
		(1,2,2,2,8680),
		(1,2,2,3,8842),
		(2,2,2,1,8594),
		(2,2,2,2,8656),
		(2,2,2,3,8628),
		(3,2,2,1,8633),
		(3,2,2,2,8776),
		(3,2,2,3,8512),
		(4,2,2,1,8577),
		(4,2,2,2,8753),
		(4,2,2,3,8907),
		(1,2,1,1,3267),
		(1,2,1,2,3069),
		(1,2,1,3,3135),
		(2,2,1,1,3076),
		(2,2,1,2,3053),
		(2,2,1,3,3479),
		(3,2,1,1,3086),
		(3,2,1,2,3008),
		(3,2,1,3,3392),
		(4,2,1,1,3114),
		(4,2,1,2,3265),
		(4,2,1,3,3489),
        (1,3,3,1,4864),
        (1,3,3,2,4949),
        (1,3,3,3,4470),
        (2,3,3,1,4330),
        (2,3,3,2,4291),
        (2,3,3,3,4794),
        (3,3,3,1,4410),
        (3,3,3,2,4744),
        (3,3,3,3,4002),
        (4,3,3,1,4057),
        (4,3,3,2,4386),
        (4,3,3,3,4494),
        (1,3,2,1,2481),
        (1,3,2,2,2084),
        (1,3,2,3,2891),
        (2,3,2,1,2208),
        (2,3,2,2,2506),
        (2,3,2,3,2620),
        (3,3,2,1,2236),
        (3,3,2,2,2361),
        (3,3,2,3,2268),
        (4,3,2,1,2802),
        (4,3,2,2,2686),
        (4,3,2,3,2649),
        (1,3,1,1,2088),
        (1,3,1,2,1960),
        (1,3,1,3,1954),
        (2,3,1,1,2155),
        (2,3,1,2,1653),
        (2,3,1,3,1694),
        (3,3,1,1,1922),
        (3,3,1,2,1689),
        (3,3,1,3,1878),
        (4,3,1,1,1725),
        (4,3,1,2,1979),
        (4,3,1,3,1963),
        (1,1,3,1,9181),
        (1,1,3,2,8765),
        (1,1,3,3,9119),
        (2,1,3,1,9082),
        (2,1,3,2,9141),
        (2,1,3,3,8811),
        (3,1,3,1,8127),
        (3,1,3,2,8308),
        (3,1,3,3,8352),
        (4,1,3,1,8708),
        (4,1,3,2,8716),
        (4,1,3,3,8593),
        (1,1,2,1,10784),
        (1,1,2,2,10590),
        (1,1,2,3,10591),
        (2,1,2,1,10638),
        (2,1,2,2,10837),
        (2,1,2,3,10811),
        (3,1,2,1,10507),
        (3,1,2,2,10591),
        (3,1,2,3,10810),
        (4,1,2,1,10775),
        (4,1,2,2,18076),
        (4,1,2,3,10797),
        (1,1,1,1,4618),
        (1,1,1,2,5573),
        (1,1,1,3,5236),
        (2,1,1,1,5826),
        (2,1,1,2,4604),
        (2,1,1,3,5935),
        (3,1,1,1,5425),
        (3,1,1,2,5624),
        (3,1,1,3,5102),
        (4,1,1,1,5776),
        (4,1,1,2,4770),
        (4,1,1,3,5105);
    