use sys;
CREATE TABLE EXPOSICION (
    exp_id_expo INT(10) NOT NULL PRIMARY KEY,
    exp_nombre_expo VARCHAR(30) NOT NULL
);
CREATE TABLE MUSEO (
    mus_id_museo INT(10) NOT NULL PRIMARY KEY,
    mus_nombre_museo VARCHAR(30) NOT NULL
);
create table OBRA(
obr_id_obra		int(10)		NOT NULL	primary key,
obr_nombre_obra		varchar(30)		NOT NULL,
obr_costo		float	NOT NULL,
obr_tipo_obra	varchar(30)		NOT NULL,
obr_id_expo		int(10)		NOT NULL,
FOREIGN KEY(obr_id_expo) REFERENCES EXPOSICION(exp_id_expo)
);
create table PRESENTACION(
pre_id_obra		int(10)		NOT NULL,
pre_fecha_ini_exp		date		NOT NULL,
pre_fecha_fin_exp		date		NOT NULL,
pre_id_museo	int(10)		NOT NULL,
FOREIGN KEY(pre_id_museo) REFERENCES MUSEO(mus_id_museo),
FOREIGN KEY(pre_id_obra) REFERENCES OBRA(obr_id_obra),
primary key(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp)
);
insert into EXPOSICION(exp_id_expo,exp_nombre_expo) values("1003","Da Vinci");
insert into EXPOSICION(exp_id_expo,exp_nombre_expo) values("1004","Renacimiento");
insert into EXPOSICION(exp_id_expo,exp_nombre_expo) values("1005","Cubismo");
insert into EXPOSICION(exp_id_expo,exp_nombre_expo) values("1006","Impresionismo");
insert into MUSEO(mus_id_museo,mus_nombre_museo) values("101","Louvre");
insert into MUSEO(mus_id_museo,mus_nombre_museo) values("102","Met");
insert into MUSEO(mus_id_museo,mus_nombre_museo) values("205","Shangai");
insert into MUSEO(mus_id_museo,mus_nombre_museo) values("304","Britanico");
insert into OBRA(obr_id_obra,obr_nombre_obra,obr_costo,obr_tipo_obra,obr_id_expo) values("111","Mona Lisa","1000","Pintura","1003");
insert into OBRA(obr_id_obra,obr_nombre_obra,obr_costo,obr_tipo_obra,obr_id_expo) values("112","Ultima Cena","800","Pintura","1003");
insert into OBRA(obr_id_obra,obr_nombre_obra,obr_costo,obr_tipo_obra,obr_id_expo) values("113","Hombre vitruvio","400","Boceto","1003");
insert into OBRA(obr_id_obra,obr_nombre_obra,obr_costo,obr_tipo_obra,obr_id_expo) values("114","Planos","200","Planos","1003");
insert into OBRA(obr_id_obra,obr_nombre_obra,obr_costo,obr_tipo_obra,obr_id_expo) values("200","Fornarina","400","Pintura","1004");
insert into OBRA(obr_id_obra,obr_nombre_obra,obr_costo,obr_tipo_obra,obr_id_expo) values("201","David","700","Escultura","1004");
insert into OBRA(obr_id_obra,obr_nombre_obra,obr_costo,obr_tipo_obra,obr_id_expo) values("202","Nacimiento venus","250","Pintura","1004");
insert into OBRA(obr_id_obra,obr_nombre_obra,obr_costo,obr_tipo_obra,obr_id_expo) values("300","Violin and candlestick","300","Pintura","1005");
insert into OBRA(obr_id_obra,obr_nombre_obra,obr_costo,obr_tipo_obra,obr_id_expo) values("301","Les demoiselles d’avignon","350","Pintura","1005");
insert into OBRA(obr_id_obra,obr_nombre_obra,obr_costo,obr_tipo_obra,obr_id_expo) values("302","Cabeza de mujer","300","Escultura","1005");
insert into OBRA(obr_id_obra,obr_nombre_obra,obr_costo,obr_tipo_obra,obr_id_expo) values("400","Autorretrato","100","Pintura","1006");
insert into OBRA(obr_id_obra,obr_nombre_obra,obr_costo,obr_tipo_obra,obr_id_expo) values("401","La parade","300","Pintura","1006");
insert into OBRA(obr_id_obra,obr_nombre_obra,obr_costo,obr_tipo_obra,obr_id_expo) values("402","Solei levant","300","Pintura","1006");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("111","2013/01/01","2013/03/31","101");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("111","2013/10/01","2013/12/31","101");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("111","2013/07/01","2013/08/31","304");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("112","2013/01/01","2013/03/31","101");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("112","2013/01/04","2013/06/30","102");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("112","2013/09/01","2013/09/30","102");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("113","2013/10/01","2013/12/31","101");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("113","2013/04/01","2013/06/30","102");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("113","2013/09/01","2013/09/30","102");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("113","2013/07/01","2013/07/31","205");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("114","2013/07/01","2013/07/31","205");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("114","2013/07/01","2013/08/31","304");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("200","2013/05/01","2013/09/30","101");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("200","2013/10/01","2013/12/31","205");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("201","2013/05/01","2013/09/30","101");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("201","2013/01/01","2013/04/30","102");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("202","2013/01/01","2013/04/30","102");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("202","2013/10/01","2013/12/31","205");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("300","2013/01/01","2013/07/31","102");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("301","2013/01/01","2013/07/31","102");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("301","2013/10/01","2013/12/31","205");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("302","2013/10/01","2013/12/31","205");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("400","2013/08/01","2013/11/30","304");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("401","2013/03/01","2013/06/30","205");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("402","2013/03/01","2013/06/30","205");
insert into PRESENTACION(pre_id_obra,pre_fecha_ini_exp,pre_fecha_fin_exp,pre_id_museo) values("402","2013/08/01","2013/11/30","304");
show tables;
