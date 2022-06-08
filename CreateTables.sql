

CREATE DATABASE p8g10RedeComboios;


CREATE TABLE Esta��o (
			Nome VARCHAR(255) UNIQUE NOT NULL,
			nLinhas int NOT NULL,
			nPlataformas int NOT NULL,
			PRIMARY KEY (Nome),
);

CREATE TABLE TipoFunc (
			ID int NOT NULL UNIQUE,
			Cargo VARCHAR (50) NOT NULL,
			PRIMARY KEY (ID)
);

CREATE TABLE Funcion�rio (
			ID int UNIQUE NOT NULL,
			Nome VARCHAR(250) not null,
			Sal�rio int not null,
			Data_Nascimento Date not null,
			N_Telem�vel VARCHAR(9) NOT NULL,
			Morada VARCHAR(250) NOT NULL,
			FuncID int,
			FOREIGN KEY (FuncID) REFERENCES TipoFunc(ID) ON DELETE CASCADE,
			CONSTRAINT chk_phone CHECK (N_Telem�vel like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
			PRIMARY KEY (ID)

);

CREATE TABLE Balc�o (
			N�mero int NOT NULL,
			NomeEsta��o VARCHAR(255) NOT NULL,
			FuncId int NOT NULL,
			FOREIGN KEY (NomeEsta��o) REFERENCES Esta��o(Nome) ON DELETE CASCADE,
			FOREIGN KEY (FuncId) REFERENCES Funcion�rio(ID) ON DELETE CASCADE
);

CREATE TABLE Bilhete (

			ID INT IDENTITY(1,1) NOT NULL,
			Esta��oPartida VARCHAR(255) NOT NULL,
			Esta��oChegada VARCHAR(255) NOT NULL,
			N_Passageiros INT NOT NULL,
			PRIMARY KEY (ID),
			FOREIGN KEY (Esta��oPartida) REFERENCES Esta��o(Nome) ON DELETE  NO ACTION,
			FOREIGN KEY (Esta��oChegada) REFERENCES Esta��o(Nome) ON DELETE  NO ACTION,
			CONSTRAINT checkTraj  check (Esta��oPartida != Esta��oChegada),
			CONSTRAINT CheckPass  check (N_Passageiros >= 0) ,


);


CREATE TABLE Passageiro (
			
			Num_CC VARCHAR(8) NOT NULL,
			Nome VARCHAR(250) NOT NULL,
			Num_Tel VARCHAR(9),
			Data_Nascimento Date not null,

			CONSTRAINT chk_phonePass CHECK (Num_Tel like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
			CONSTRAINT chk_CC CHECK (Num_CC like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),

			PRIMARY KEY (Num_CC),

);


CREATE TABLE ViajaComBilhete (
	
			ID_Bilhete  INT NOT NULL,
			NUM_CC VARCHAR (8) NOT NULL,
			
			PRIMARY KEY (NUM_CC,ID_Bilhete),
			FOREIGN KEY (NUM_CC) REFERENCES Passageiro(Num_CC) ON DELETE CASCADE,
			FOREIGN KEY (ID_Bilhete) REFERENCES Bilhete(ID) ON DELETE CASCADE,

);

CREATE TABLE Comboio (
			ID int IDENTITY(1,1) not null,
			Condutor_ID int NOT NULL,
			Revisor_ID int NOT NULL,

			PRIMARY KEY (ID),

			FOREIGN KEY (Condutor_ID) REFERENCES Funcion�rio(ID),
			FOREIGN KEY (Revisor_ID) REFERENCES Funcion�rio(ID),

);

CREATE TABLE Carruagem (
			Comboio_ID int Not null,
			N_Carruagem int not null,
			N_lugares int not null,
			PRIMARY KEY (Comboio_ID, N_Carruagem),
			FOREIGN KEY (Comboio_ID) REFERENCES Comboio(ID)
);

CREATE TABLE Trajeto (
			
			ID int identity(1000,1) not null ,
			Esta��oPartida VARCHAR(255) NOT NULL,
			Esta��oChegada VARCHAR(255) NOT NULL,
			PRIMARY KEY (ID),
			FOREIGN KEY (Esta��oPartida) REFERENCES Esta��o(Nome) ON DELETE  NO ACTION,
			FOREIGN KEY (Esta��oChegada) REFERENCES Esta��o(Nome) ON DELETE  NO ACTION,
			
			CONSTRAINT check_Traj  check (Esta��oPartida != Esta��oChegada),


);


CREATE TABLE FazParagem(
			TrajetoID int not null,
			Esta��o VARCHAR(255) NOT NULL,
			PRIMARY KEY (TrajetoID,Esta��o),
			FOREIGN KEY (TrajetoID) References Trajeto(ID) ON DELETE CASCADE, 
			FOREIGN KEY (Esta��o) REFERENCES Esta��o(Nome) ON DELETE CASCADE,
);



CREATE TABLE Hor�rioTrajeto (

			TrajetoID int not null,
			HoraSaida DATETIME NOT NULL,
			HoraChegada DATETIME NOT NULL,
			PRIMARY KEY (TrajetoID,HoraSaida,HoraChegada),

);

CREATE TABLE ComboioFazTrajeto (
			Comboio_ID  int Not null,
			TrajetoID int not null,
			PRIMARY KEY (Comboio_ID,TrajetoID),
			FOREIGN KEY (Comboio_ID) REFERENCES Comboio(ID) ON DELETE CASCADE,
			FOREIGN KEY (TrajetoID) References Trajeto(ID) ON DELETE CASCADE, 

);
