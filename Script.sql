-- MySQL Script
-- 10 out 2018 19:00:06 -03
-- Model: New Model    Version: 2.0
-- By Paulo Henrique Cardoso de Jesus
DROP DATABASE B2W;
-- Cria banco de dados caso não exista.
CREATE DATABASE IF NOT EXISTS B2W;
CREATE SCHEMA IF NOT EXISTS B2W DEFAULT CHARACTER SET utf8;
USE B2W;
-- Cria tabela item caso não exista na base de dados.
CREATE TABLE IF NOT EXISTS B2W.item(
-- Inserir dados na tabela item.
	`idItem` INT NOT NULL AUTO_INCREMENT,
  	`Itemcol` INT NOT NULL,
  	PRIMARY KEY (`idItem`)
)ENGINE = InnoDB;
INSERT INTO item(Itemcol) 
	VALUES (1),(2),(3);
-- Cria tabela UF caso não exista.
CREATE TABLE IF NOT EXISTS `B2W`.`uf` (
-- Inserir dados na tabela UF.
  `idUf` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,  
  `Ufcol` CHAR(2) NOT NULL
)ENGINE = InnoDB;
INSERT INTO uf(Ufcol) 
	VALUES ("MT"),("PE"),("SP");
-- Cria tabela departamento caso não exista.
CREATE TABLE IF NOT EXISTS B2W.departamento (
-- Inserir dados na tabela departamento.
  `idDepartamento` INT AUTO_INCREMENT NOT NULL,
  `Departamentocol` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idDepartamento`)
)ENGINE = InnoDB;
INSERT INTO departamento(Departamentocol)
	VALUES ("Bolas de Gude"),("Cadeiras"),("Maquinas Fotograficas");
-- Cria tabela mês caso não exista.
CREATE TABLE IF NOT EXISTS B2W.mes(
-- Inserir dados na tabela mês.
  `idMes` INT NOT NULL AUTO_INCREMENT,
  `mescol` DATE NOT NULL,
  PRIMARY KEY (`idMes`)
)ENGINE = InnoDB;
INSERT INTO mes(mescol)
	VALUES ("2018_06_01"),("2018_07_02"),("2018_08_03"),("2018_09_04");
-- Cria tabela vendas caso não exista.
CREATE TABLE IF NOT EXISTS B2W.vendas(
-- Adiciona Coluna fk_Item de tipo inteiro na tabela vendas não permitindo valor nulo.
  idVendas INT NOT NULL AUTO_INCREMENT,
  Vendascol INT NOT NULL,
	PRIMARY KEY (idVendas)
)ENGINE = InnoDB;
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
     