BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "NotaFiscal" (
	"id_nota"	INTEGER NOT NULL UNIQUE,
	"numero_nota"	NUMERIC NOT NULL UNIQUE,
	"data"	NUMERIC NOT NULL,
	"id_Vendedor"	INTEGER NOT NULL,
	"total_venda"	REAL NOT NULL,
	"id_cliente"	INTEGER NOT NULL,
	"nome_cliente"	TEXT,
	PRIMARY KEY("id_nota"),
	FOREIGN KEY("id_cliente") REFERENCES "Cliente",
	FOREIGN KEY("id_Vendedor") REFERENCES "Vendedor"
);
CREATE TABLE IF NOT EXISTS "Cliente" (
	"id_cliente"	INTEGER NOT NULL UNIQUE,
	"nome_cliente"	TEXT NOT NULL,
	"telefone_cliente"	NUMERIC NOT NULL,
	"email_cliente"	TEXT NOT NULL UNIQUE,
	"endereco_cliente"	TEXT NOT NULL,
	PRIMARY KEY("id_cliente")
);
CREATE TABLE IF NOT EXISTS "Fornecedor" (
	"id_fornecedor"	INTEGER NOT NULL,
	"nome_fornecedor"	TEXT NOT NULL,
	"endereco_fornecedor"	TEXT NOT NULL,
	"telefono_fornecedor"	NUMERIC NOT NULL,
	PRIMARY KEY("id_fornecedor")
);
CREATE TABLE IF NOT EXISTS "Vendedor" (
	"id_Vendedor"	INTEGER NOT NULL UNIQUE,
	"nome_Vendedor"	TEXT NOT NULL UNIQUE,
	"telefone_Vendedor"	NUMERIC NOT NULL,
	"endereco_Vendedor"	TEXT NOT NULL,
	PRIMARY KEY("id_Vendedor" AUTOINCREMENT),
	FOREIGN KEY("id_Vendedor") REFERENCES "NotaFiscal"
);
CREATE TABLE IF NOT EXISTS "produtos" (
	"id_produto"	INTEGER NOT NULL UNIQUE,
	"codigo_produto"	INTEGER NOT NULL UNIQUE,
	"nome_produto"	TEXT NOT NULL,
	"data_add"	NUMERIC NOT NULL,
	"precio_produto"	REAL NOT NULL,
	"id_fornecedor"	INTEGER NOT NULL,
	PRIMARY KEY("id_produto" AUTOINCREMENT),
	FOREIGN KEY("id_fornecedor") REFERENCES "Fornecedor"
);
INSERT INTO "NotaFiscal" ("id_nota","numero_nota","data","id_Vendedor","total_venda","id_cliente","nome_cliente") VALUES (1,1,'2021-12-01 14:23:21',1,'45,5',1,NULL),
 (2,2,'2021-12-01 14:25:34',4,'63,99',3,NULL),
 (3,3,'2021-12-01 14:31:54',2,'23,34',2,NULL),
 (4,4,'2021-12-01 15:01:54',3,'98,78',4,NULL),
 (5,5,'2021-12-01 15:15:14',2,'32,43',4,NULL),
 (6,6,'2021-12-02 09:15:14',1,'23,21',2,NULL);
INSERT INTO "Cliente" ("id_cliente","nome_cliente","telefone_cliente","email_cliente","endereco_cliente") VALUES (1,'carmen',21993434343,'urbina@gmail.com','rua cara'),
 (2,'carlos',21992993837,'lopez@hotmail.com','rua real'),
 (3,'carla',21993487567,'carurb@hotmail.com','rua barbosa'),
 (4,'Enrique',21993288989,'kikekike@gmail.com','rua coruripe'),
 (5,'Erick',21992877867,'erickjohar@gmail.com','rua Sanilopolis'),
 (6,'Karen',21992897867,'karen@hotmail.com','rua salinas'),
 (7,'GianFranco',21998776554,'gianfranco@gmail.com','rua salinas'),
 (8,'Luis Manuel',21986257788,'lmcuares@gmail.com','rua hermes');
INSERT INTO "Fornecedor" ("id_fornecedor","nome_fornecedor","endereco_fornecedor","telefono_fornecedor") VALUES (1,'Danilo Sousa','Rua Longa',21993564523),
 (2,'Cristoval Silva','Rua Pedrosa',21993451098),
 (3,'Mario Freitas','Rua Anil',21987654444),
 (4,'Carlos Alves','Rua Laranjeira',21776655434),
 (5,'Pedro Perez','Rua Pau da fome',21345678761);
INSERT INTO "Vendedor" ("id_Vendedor","nome_Vendedor","telefone_Vendedor","endereco_Vendedor") VALUES (1,'Carlos',21992452345,'Rua America'),
 (2,'Francisco',21992786778,'Rua nova America'),
 (3,'Felipe',21345778899,'Rua paris'),
 (4,'Natalia',21998765432,'Rua Maturin');
INSERT INTO "produtos" ("id_produto","codigo_produto","nome_produto","data_add","precio_produto","id_fornecedor") VALUES (1,1120001,'Blusa Preta','2021-11-02 09:13:45','25,99','Carlos '),
 (2,1120002,'Blusa Fucsia','2021-11-02 09:13:45','28,99','Mario'),
 (3,1120003,'Blusa Amarela','2021-11-02 09:20:53','28,99','Luis'),
 (4,1120004,'Blusa Preta Cat','2021-11-02 09:24:23','30,00','Luis'),
 (5,1120005,'Blusa Fucsia Cat','2021-11-02 09:28:56','30,00','Danilo'),
 (6,1120006,'Blusa Laranja Dog','2021-11-02 09:30:56','30,00','Cristoval'),
 (7,1120007,'Blusa Preta Dog','2021-11-02 09:36:26','30,00','Cristoval'),
 (8,1120008,'Blusa verde Dog','2021-11-02 09:40:25','30,00','Cristoval');
COMMIT;
