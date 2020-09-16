
CREATE TABLE PROPIETARIO(
idPropietario NUMBER NOT NULL,
nombre VARCHAR2(50)NOT NULL,
ciudad VARCHAR2(50)NOT NULL,
CONSTRAINT PROPIETARIO_PK PRIMARY KEY (idPropietario)
);

CREATE TABLE VEHICULO(
idVehiculo NUMBER NOT NULL, 
idPropietario NUMBER NOT NULL,
modelo VARCHAR2(50)NOT NULL,
motor VARCHAR2(50)NOT NULL, 
marca VARCHAR2(50)NOT NULL,
a�o VARCHAR2(20)NOT NULL,
CONSTRAINT idVehiculo_PK PRIMARY KEY(idVehiculo),
CONSTRAINT idPropietario_FK
    FOREIGN KEY (idPropietario)
    REFERENCES PROPIETARIO(idPropietario)
);

CREATE TABLE OFICINAGOB(
idOficinaGob NUMBER NOT NULL, 
idVehiculo NUMBER NOT NULL,
valorVehiculo DOUBLE NOT NULL,
ubicacion VARCHAR2(50)NOT NULL,
nPolizades VARCHAR(50)NOT NULL,
nPlacas VARCHAR2(20),
CONSTRAINT idOficinaGob_PK PRIMARY KEY(idOficinaGob),
CONSTRAINT idVehiculo_FK
    FOREIGN KEY (idVehiculo)
    REFERENCES VEHICULO(idVehiculo)
);

CREATE TABLE INFRACCION(
idInfraccion NUMBER NOT NULL,
idNorma NUMBER NOT NULL, 
idAgente NUMBER NOT NULL, 
hora VARCHAR2(20)NOT NULL, 
fecha TIMESTAMP NOT NULL, 
valorMulta DOUBLE NOT NULL, 
nPlaca VARCHAR2(20)NOT NULL,
CONSTRAINT idInfraccion_PK PRIMARY KEY (idInfraccion),
CONSTRAINT idNorma_FK
    FOREIGN KEY (idNorma)
    REFERENCES NORMASDET(idNorma),
CONSTRAINT idAgente_FK
    FOREIGN KEY (idAgente)
    REFERENCES AGENTE(idAgente)
);

CREATE TABLE NORMASDET (
idNorma NUMBER NOT NULL,
nuNorma VARCHAR2(20) NOT NULL,
descripcion VARCHAR2(100) NOT NULL,
CONSTRAINT idNorma_PK PRIMARY KEY (idNorma)
);

CREATE TABLE AGENTE(
idAgente NUMBER NOT NULL, 
idPuestoDeControl NUMBER NOT NULL,
cedulaa VARCHAR2(20) NOT NULL, 
nombre VARCHAR2(20) NOT NULL,
rango VARCHAR2(20) NOT NULL, 
CONSTRAINT idAgente_PK PRIMARY KEY (idAgente), 
CONSTRAINT idPuestoDeControl_FK
    FOREIGN KEY (idPuestoDeControl)
    REFERENCES PUESDECONTROL(idPuestoDeControl)
);

CREATE TABLE PUESDECONTROL(
idPuestoDeControl NUMBER NOT NULL,
idZona NUMBER NOT NULL, 
ubicacion VARCHAR2(50) NOT NULL, 
CONSTRAINT idPuestoDeControl_PK PRIMARY KEY (idPuestoDeControl), 
CONSTRAINT idZona_FK
    FOREIGN KEY (idZona)
    REFERENCES ZONA(idZona)
);

CREATE TABLE ZONA(
idZona NUMBER NOT NULL,
ubicacion VARCHAR2(50) NOT NULL,
CONSTRAINT idZona_PK PRIMARY KEY (idZona)
);

CREATE TABLE ACTA (
idActa NUMBER NOT NULL,
idAudiencia NUMBER NOT NULL,
idZona NUMBER NOT NULL,
idAgente NUMBER NOT NULL,
idAccidente NUMBER NOT NULL,
hora VARCHAR2(50) NOT NULL,
fecha TIMESTAMP NOT NULL, 
CONSTRAINT idActa_PK PRIMARY KEY (idActa),
CONSTRAINT idAudiencia_FK
    FOREIGN KEY (idAudiencia)
    REFERENCES AUDIENCIA(idAudiencia),
CONSTRAINT idZona_FK
    FOREIGN KEY (idZona)
    REFERENCES ZONA(idZona),
CONSTRAINT idAgente_FK
    FOREIGN KEY (idAgente)
    REFERENCES AGENTE(idAgente),
CONSTRAINT idAccidente_FK
    FOREIGN KEY (idAccidente)
    REFERENCES ACCIDENTE(idAccidente)
);

CREATE TABLE AUDIENCIA(
idAudiencia NUMBER NOT NULL,
hora VARCHAR2(50) NOT NULL,
fecha TIMESTAMP NOT NULL,
lugar VARCHAR2(50) NOT NULL,
CONSTRAINT idAudiencia_PK PRIMARY KEY (idAudiencia)
);

CREATE TABLE ACCIDENTE (
idAccidente NUMBER NOT NULL,
idAgente NUMBER NOT NULL,
nPlaca VARCHAR2(20)NOT NULL,
hora VARCHAR2(50) NOT NULL,
fecha TIMESTAMP NOT NULL,
descripcion VARCHAR2(100) NOT NULL,
CONSTRAINT idAccidente_PK PRIMARY KEY (idAccidente)
);

