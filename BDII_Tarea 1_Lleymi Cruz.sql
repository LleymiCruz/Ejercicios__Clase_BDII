CREATE DATABASE REPASO;
USE REPASO;
---------------------------------------------------------
CREATE TABLE Hotel(
codigo VARCHAR(10) NOT NULL PRIMARY KEY,
nombre VARCHAR(60) NOT NULL,
direccion VARCHAR(60) NOT NULL
);
--------------------------------------------------------
CREATE TABLE Cliente(
identidad VARCHAR(13) NOT NULL PRIMARY KEY,
nombre VARCHAR(60) NOT NULL,
telefono VARCHAR(8) NOT NULL
);
--------------------------------------------------------
CREATE TABLE Reserva(
fechain DATE NOT NULL,
fechaout DATE NOT NULL,
cantidad_personas INT DEFAULT 0,
codigo_hotel VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES Hotel(codigo),
identidad_cliente VARCHAR(13) NOT NULL FOREIGN KEY REFERENCES Cliente(identidad)
CONSTRAINT PK_Reserva PRIMARY KEY (codigo_hotel, identidad_cliente, fechain)
);
-----------------------------------------------------------
CREATE TABLE Boleto(
codigo VARCHAR(10) NOT NULL PRIMARY KEY,
no_vuelo INT NOT NULL,
fecha DATE NOT NULL,
destino VARCHAR(60) NOT NULL,
identidad_cliente VARCHAR(13) NOT NULL FOREIGN KEY REFERENCES Cliente(identidad),
codigo_aerolinea varchar(10) NOT NULL,
CONSTRAINT CHK_boleto CHECK (destino in ('Mexico','Guatemala','Panama'))
);
------------------------------------------------------------
CREATE TABLE Aerolinea(
codigo VARCHAR(10) NOT NULL PRIMARY KEY,
descuento FLOAT NOT NULL,
CONSTRAINT CHK_aerolinea CHECK (descuento>=10)
);
---------------------------------------------------------------
ALTER TABLE  Boleto ADD CONSTRAINT FK_boleto_aerolinea
FOREIGN KEY (codigo_aerolinea) references Aerolinea(codigo);

------------------INSERTS------------------------------------
INSERT INTO Hotel VALUES ('00001', 'Hotel California', 'Ciudad de California, USA');
INSERT INTO Hotel VALUES ('00002', 'Hotel Descansito', 'Ciudad de Tegucigalpa, Honduras');
SELECT*FROM Hotel;

INSERT INTO Cliente VALUES ('0909200415789', 'Dario José Montaner', '98815867');
INSERT INTO Cliente VALUES ('1008200415711', 'Christ Evans', '97675432');
INSERT INTO Cliente VALUES ('0804200387678', 'Natasha Romanoff', '98456754');
SELECT*FROM Cliente;

INSERT INTO Reserva (fechain,fechaout,codigo_hotel,identidad_cliente) VALUES ('02-12-2021', '02-13-2021','00001','0909200415789');
INSERT INTO Reserva (fechain,fechaout,codigo_hotel,identidad_cliente) VALUES ('02-12-2021', '02-13-2021','00002','0804200387678');
INSERT INTO Reserva VALUES ('05-16-2022', '05-18-2022','1','00001','0909200415789');
INSERT INTO Reserva VALUES ('12-21-2021', '12-23-2021','2','00002','1008200415711');
INSERT INTO Reserva VALUES ('08-23-2022', '08-25-2022','5','00002','1008200415711');
SELECT*FROM Reserva;

INSERT INTO Aerolinea VALUES ('001', '10');
INSERT INTO Aerolinea VALUES ('002', '10.5');
INSERT INTO Aerolinea VALUES ('003', '20');
SELECT*FROM Aerolinea;

INSERT INTO Boleto VALUES ('A-01', '233','08-25-2022','Panama','1008200415711','001');
INSERT INTO Boleto VALUES ('A-02', '455','05-18-2022','Mexico','0909200415789','002');
INSERT INTO Boleto VALUES ('A-03', '875','02-13-2021','Guatemala','0804200387678','003');
SELECT*FROM Boleto;

