
CREATE DATABASE Seriale
GO

USE Seriale
GO

CREATE TABLE Kanał (
	id_kanału int IDENTITY(1,1) PRIMARY KEY, 
	nazwa varchar(40) NOT NULL, 
	rok_powstania int NOT NULL
);

CREATE TABLE Serial (
	id_serialu int IDENTITY(1,1) PRIMARY KEY,
	nazwa varchar(40) NOT NULL,
	rok_start int NOT NULL,
	rok_koniec int,
	id_kanału int NOT NULL FOREIGN KEY REFERENCES Kanał(id_kanału),
	ocena int NOT NULL
);

CREATE TABLE Postać (
	id_postaci int IDENTITY(1,1) PRIMARY KEY,
	postać varchar(40) NOT NULL,
	ginie char NOT NULL,
	id_serialu int NOT NULL FOREIGN KEY REFERENCES Serial(id_serialu)
);
