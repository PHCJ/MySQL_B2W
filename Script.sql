-- MySQL Script
-- 11 out 2018 22:00
-- Model: New Model    Version: 2.2
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
-- Cria tabela financeiro caso não exista.
CREATE TABLE IF NOT EXISTS B2W.financeiro(
  `idFinanceiro` INT NOT NULL AUTO_INCREMENT,
  `Faturamento_Produto` DOUBLE NOT NULL,
  `Faturamento_Frete` FLOAT NULL,
  `Custo_Produto` FLOAT NOT NULL,
  `Custo_Frete` FLOAT NULL,
  `Custo_Mkt` FLOAT NULL,
  `Desconto_Produto` FLOAT NULL,
  `Desconto_Frete` FLOAT NULL,
  `fk_Departamento` INT NOT NULL,
  `fk_Item` INT NOT NULL,
  `fk_Mes` INT NOT NULL,
  `fk_Uf` INT NOT NULL,
  PRIMARY KEY (`idFinanceiro`)
)ENGINE = InnoDB;
-- Adiciona uma restrição na coluna fk_item para aceitar apenas um valor já existente na tabela item(idItem).
ALTER TABLE financeiro ADD CONSTRAINT financeiro_item_fk
	FOREIGN KEY (fk_Item) REFERENCES item(idItem);
-- Adiciona uma restrição igual a da fk_item na coluna fk_Departamento com sua dependência na tabela departamento(idDepartamento).
ALTER TABLE financeiro ADD CONSTRAINT financeiro_departamento_fk
	FOREIGN KEY (fk_Departamento) REFERENCES departamento(idDepartamento);
-- Adiciona uma restrição como as anteriores nas respectivas dependências.
ALTER TABLE financeiro ADD CONSTRAINT financeiro_uf_fk
	FOREIGN KEY (fk_Uf) REFERENCES uf(idUf);
-- Adiciona uma restrição como as anteriores nas respectivas dependências.
ALTER TABLE financeiro ADD CONSTRAINT financeiro_mes_fk
	FOREIGN KEY (fk_Mes) REFERENCES mes(idMes);
-- Inserir dados na tabela financeiro usando os respectivos id de cada chave estrangeira.
-- Para que essa inserção ocorra é preciso que as outras tabelas relacionadas possuam os dados inseridos.
INSERT INTO financeiro(fk_Mes,fk_Departamento,fk_Uf,fk_Item,Faturamento_Produto,Faturamento_Frete,Custo_Produto,Custo_Frete,Custo_Mkt,Desconto_Produto,Desconto_Frete)
	VALUES 
		(1,2,3,1,149250,42984,71640,35820,5970,0,4776),
		(1,2,3,2,148050,30456,76140,25380,4230,0,3384),
		(1,2,3,3,133650,21384,89100,17820,2970,0,2376),
		(2,2,3,1,314712.5,94784,177720,88860,74050,55537.5,23696),
		(2,2,3,2,392105,84352,237240,79080,65900,69195,21088),
		(2,2,3,3,457087.5,76480,358500,71700,59750,80662.5,19120),
		(3,2,3,1,219187.5,93520,140280,70140,58450,73062.5,0),
		(3,2,3,2,268537.5,81840,184140,61380,51150,89512.5,0),
		(3,2,3,3,286200,67840,254400,50880,42400,95400,0),
		(4,2,3,1,158312.5,53640,89400,44700,22350,27937.5,5960),
		(4,2,3,2,176417.5,42696,106740,35580,17790,31132.5,4744),
		(4,2,3,3,166387.5,31320,130500,26100,13050,29362.5,3480),
		(1,2,2,1,57420,23490,31320,22185,2610,0,2610),
		(1,2,2,2,54250,15750,31500,14875,1750,0,1750),
		(1,2,2,3,35200,7920,26400,7480,880,0,880),
		(2,2,2,1,145486,62240,93360,66130,38900,25674,15560),
		(2,2,2,2,179443.5,54480,122580,57885,34050,31666.5,13620),
		(2,2,2,3,208760,49120,184200,52190,30700,36840,12280),
		(3,2,2,1,103125,62500,75000,53125,31250,34375,0),
		(3,2,2,2,125550,54000,97200,45900,27000,41850,0),
		(3,2,2,3,131400,43800,131400,37230,21900,43800,0),
		(4,2,2,1,65824,31680,42240,29920,10560,11616,3520),
		(4,2,2,2,67456,23040,46080,21760,7680,11904,2560),
		(4,2,2,3,57800,15300,51000,14450,5100,10200,1700),
		(1,2,1,1,36240,10872,18120,10570,1510,0,1208),
		(1,2,1,2,45210,9864,24660,9590,1370,0,1096),
		(1,2,1,3,39480,6768,28200,6580,940,0,752),
		(2,2,1,1,69768,21888,41040,23940,17100,12312,5472),
		(2,2,1,2,86113.5,19648,55260,21490,15350,15196.5,4912),
		(2,2,1,3,97461,17472,81900,19110,13650,17199,4368),
		(3,2,1,1,52380,23280,34920,20370,14550,17460,0),
		(3,2,1,2,67815,21920,49320,19180,13700,22605,0),
		(3,2,1,3,71505,18160,68100,15890,11350,23835,0),
		(4,2,1,1,39576,13968,23280,13580,5820,6984,1552),
		(4,2,1,2,42916.5,11016,27540,10710,4590,7573.5,1224),
		(4,2,1,3,43197,8712,36300,8470,3630,7623,968),
        (1,3,3,1,372400,0,292600,23940,23940,0,26600),
        (1,3,3,2,462000,0,346500,20790,20790,0,23100),
        (1,3,3,3,684700,0,517700,15030,15030,0,16700),
        (2,3,3,1,637560,0,556600,45540,45540,70840,50600),
        (2,3,3,2,894600,0,745500,44730,44730,99400,49700),
        (2,3,3,3,1527660,0,1283400,37260,37260,169740,41400),
        (3,3,3,1,625100,23500,517000,42300,42300,32900,23500),
        (3,3,3,2,744800,19600,588000,35280,35280,39200,19600),
        (3,3,3,3,1374935,17650,1094300,31770,31770,72365,17650),
        (4,3,3,1,474600,33900,372900,30510,30510,0,0),
        (4,3,3,2,554000,27700,415500,24930,24930,0,0),
        (4,3,3,3,885600,21600,669600,19440,19440,0,0),
        (1,3,2,1,146900,0,124300,12430,10170,0,13560),
        (1,3,2,2,199500,0,142500,10450,8550,0,11400),
        (1,3,2,3,262200,0,213900,7590,6210,0,8280),
        (2,3,2,1,258570,0,243100,24310,19890,28730,26520),
        (2,3,2,2,523530,0,415500,30470,24930,58170,33240),
        (2,3,2,3,882360,0,799800,28380,23220,98040,30960),
        (3,3,2,1,329745,16020,293700,29370,24030,17355,16020),
        (3,3,2,2,436905,13140,328500,24090,19710,22995,13140),
        (3,3,2,3,754490,12540,647900,22990,18810,39710,12540),
        (4,3,2,1,188500,7400,159500,15950,13050,0,0),
        (4,3,2,2,231000,13200,165000,12100,9900,0,0),
        (4,3,2,3,395200,12480,322400,11440,9360,0,0),
        (1,3,1,1,151200,0,129600,5400,9720,0,8640),
        (1,3,1,2,277400,0,262800,7300,13140,0,11680),
        (1,3,1,3,352600,0,287000,4100,7380,0,6560),
        (2,3,1,1,268380,0,255600,10650,19170,29820,17040),
        (2,3,1,2,470250,0,495000,13750,24750,52250,22000),
        (2,3,1,3,1021680,0,924000,13200,23760,113520,21120),
        (3,3,1,1,355110,10680,320400,13350,24030,18690,10680),
        (3,3,1,2,319485,7080,318600,8850,15930,16815,7080),
        (3,3,1,3,571900,5600,490000,7000,12600,30100,5600),
        (4,3,1,1,183400,10480,157200,6550,11790,0,0),
        (4,3,1,2,307800,12960,291600,8100,14580,0,0),
        (4,3,1,3,417100,7760,339500,4850,8730,0,0),
        (1,1,3,1,3372.5,7100,710,4970,710,177.5,0),
        (1,1,3,2,2916.5,6140,614,4298,614,153.5,0),
        (1,1,3,3,2660,5600,560,3920,560,140,0),
        (2,1,3,1,5062.5,11250,1125,7875,2250,562.5,0),
        (2,1,3,2,5553,12340,1234,8638,2468,617,0),
        (2,1,3,3,4594.5,10210,1021,7147,2042,510.5,0),
        (3,1,3,1,4878,10298,1084,7588,1084,542,542),
        (3,1,3,2,4333.5,9148.5,963,6741,963,481.5,481.5),
        (3,1,3,3,3721.5,7856.5,827,5789,827,413.5,413.5),
        (4,1,3,1,3780,6804,756,5292,2268,0,756),
        (4,1,3,2,3330,5994,666,4662,1998,0,666),
        (4,1,3,3,2925,5265,585,4095,1755,0,585),
        (1,1,2,1,4954.25,8940,1490,5960,745,260.75,0),
        (1,1,2,2,4229.4,7632,1272,5088,636,222.6,0),
        (1,1,2,3,3650.85,6588,1098,4392,549,192.15,0),
        (2,1,2,1,8712.9,16596,2766,11064,2766,968.1,0),
        (2,1,2,2,8227.8,15672,2612,10448,2612,914.2,0),
        (2,1,2,3,7528.5,14340,2390,9560,2390,836.5,0),
        (3,1,2,1,7434,13452,2360,9440,1180,826,708),
        (3,1,2,2,6759.9,12232.2,2146,8584,1073,751.1,643.8),
        (3,1,2,3,6066.9,10978.2,1926,7704,963,674.1,577.8),
        (4,1,2,1,6006,9266.4,1716,6864,2574,0,1029.6),
        (4,1,2,2,5390,8316,1540,6160,2310,0,924),
        (4,1,2,3,4543,7009.2,1298,5192,1947,0,778.8),
        (1,1,1,1,2576.4,5424,1356,4520,452,135.6,0),
        (1,1,1,2,2057.7,4332,1083,3610,361,108.3,0),
        (1,1,1,3,1977.9,4164,1041,3470,347,104.1,0),
        (2,1,1,1,4033.8,8964,2241,7470,1494,448.2,0),
        (2,1,1,2,3585.6,7968,1992,6640,1328,398.4,0),
        (2,1,1,3,3510,7800,1950,6500,1300,390,0),
        (3,1,1,1,4023,8493,2235,7450,745,447,447),
        (3,1,1,2,3245.4,6851.4,1803,6010,601,360.6,360.6),
        (3,1,1,3,3472.2,7330.2,1929,6430,643,385.8,385.8),
        (4,1,1,1,3402,6123.6,1701,5670,1701,0,680.4),
        (4,1,1,2,2832,5097.6,1416,4720,1416,0,566.4),
        (4,1,1,3,2688,4838.4,1344,4480,1344,0,537.6);
