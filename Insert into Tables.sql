


-- INSERT ESTA��ES

INSERT INTO Esta��o VALUES ('S�o Bento',6,12);
INSERT INTO Esta��o VALUES ('Espinho',2,1);
INSERT INTO Esta��o VALUES ('Granja',2,2);
INSERT INTO Esta��o VALUES ('Ovar',4,8);
INSERT INTO Esta��o VALUES ('Aveiro',5,10);

-- SELECT * FROM Esta��o;

INSERT INTO TipoFunc VALUES (10322, 'Secret�rio' );
INSERT INTO TipoFunc VALUES (10001, 'Condutor' );
INSERT INTO TipoFunc VALUES (10002, 'Revisor' );

-- SELECT * FROM TipoFunc;

INSERT INTO Funcion�rio VALUES (10001,'Bruno Peterson',1200,'1980-2-2',918833999,'Aveiro rua tal e coiso',10322);
INSERT INTO Funcion�rio VALUES (10002,'Marcus Teles',1500,'1980-2-2',918833779,'Aveiro rua coiso e tal',10001);
INSERT INTO Funcion�rio VALUES (10003,'Rui Luis',1500,'1980-2-2',918835999,'Porto alameda do bairro',10002);

-- SELECT * FROM Funcion�rio;
-- SELECT * FROM Funcion�rio, TipoFunc WHERE TipoFunc.ID = FuncID

INSERT INTO Balc�o VALUES (1,'Aveiro',10001);


-- SELECT * FROM Balc�o;
-- SELECT * FROM Balc�o, Funcion�rio Where Balc�o.FuncId = Funcion�rio.ID;

INSERT INTO Bilhete VALUES ('Aveiro','S�o Bento',1);
INSERT INTO Bilhete VALUES ('Aveiro','Ovar',1);

-- SELECT * FROM Bilhete
-- SELECT * FROM Bilhete WHERE Esta��oChegada = 'Ovar' 

