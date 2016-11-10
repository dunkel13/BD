# al borrar un autor deben borrarse los libro que escribio de la BD
# en la tabla historia quede el titulo_libro, nombre_autor, fecha (en la que ocurre el borrado)
# el trigger 2 es al cambiarle el precio a un libro, en la tabla bitacora quede (ISBN, precioantiguo, precionuevo)

drop database if exists NOV08;
CREATE DATABASE NOV08;
USE NOV08;

drop table if exists promocion;
drop table if exists libro;
create table libro(
	lib_id INT(10) PRIMARY KEY auto_increment,
    lib_titulo VARCHAR(100) NOT NULL,
    lib_precio DOUBLE NOT NULL    
);

SELECT * FROM libro;
INSERT INTO libro(lib_titulo, lib_precio) values("Cien años de soledad", 110000);
INSERT INTO libro(lib_titulo, lib_precio) values("la isla deltor Morou", 80000);
INSERT INTO libro(lib_titulo, lib_precio) values("La isla del doctor Morou", 40000);
INSERT INTO libro(lib_titulo, lib_precio) values("Pedro paramo", 90000);
INSERT INTO libro(lib_titulo, lib_precio) values("El olvido que seremos", 30000);
INSERT INTO libro(lib_titulo, lib_precio) values("La historia interminable", 45000);
INSERT INTO libro(lib_titulo, lib_precio) values("La odisea", 55000);
INSERT INTO libro(lib_titulo, lib_precio) values("Bases de datos", 45000);

create table Editorial(
	Edi_id INT(10) PRIMARY KEY auto_increment,
    Edi_nombre VARCHAR(100) NOT NULL,
    id_libro INTEGER NOT NULL,
    FOREIGN KEY (id_libro)
	REFERENCES libro (lib_id)   
);

SELECT * FROM Editorial;
INSERT INTO editorial(Edi_id, Edi_nombre,id_libro) values(965207,"De Bolsillo",1);
INSERT INTO editorial(Edi_id, Edi_nombre,id_libro) values(854109,"Planeta",2);
INSERT INTO editorial(Edi_id, Edi_nombre,id_libro) values(746320, "Oveja negra",3);
INSERT INTO editorial(Edi_id, Edi_nombre,id_libro) values(625109,"Springer",4);
INSERT INTO editorial(Edi_id, Edi_nombre,id_libro) values(514367,"Pearson",5);
INSERT INTO editorial(Edi_id, Edi_nombre,id_libro) values(847691,"Cangrejo",6);
INSERT INTO editorial(Edi_id, Edi_nombre,id_libro) values(524367,"Pearson",7);
INSERT INTO editorial(Edi_id, Edi_nombre,id_libro) values(827691,"Cangrejo",8);

create table Autor(
	AUT_id INT(10) PRIMARY KEY,
    AUT_nombre VARCHAR(100) NOT NULL,
    AUT_naCionalidad VARCHAR(50) NOT NULL   
);

INSERT INTO Autor(AUT_id, AUT_nombre,AUT_naCionalidad) values(1234,"Garcia Marquez","Colombiana");
INSERT INTO Autor(AUT_id, AUT_nombre,AUT_naCionalidad) values(1345,"Vargas Llosa","Peruano");
INSERT INTO Autor(AUT_id, AUT_nombre,AUT_naCionalidad) values(1456,"Coehlo","Brasilero");
INSERT INTO Autor(AUT_id, AUT_nombre,AUT_naCionalidad) values(1678,"Murakami","Japones");
INSERT INTO Autor(AUT_id, AUT_nombre,AUT_naCionalidad) values(1789,"Shakespeare","Británica");
INSERT INTO Autor(AUT_id, AUT_nombre,AUT_naCionalidad) values(2345,"Thomas","Estadounidense");
INSERT INTO Autor(AUT_id, AUT_nombre,AUT_naCionalidad) values(2456,"Stewart","Estadounidense");
INSERT INTO Autor(AUT_id, AUT_nombre,AUT_naCionalidad) values(2567,"Spivak","Estadounidense");


CREATE TABLE bitacora(
	BIT_lib_id INT(10) NOT NULL,
    BIT_lib_precioANT DOUBLE NOT NULL, 
    BIT_lib_precioNUE DOUBLE NOT NULL
);

CREATE TABLE historia(
	HIS_lib_titulo VARCHAR(100) NOT NULL,
    HIS_lib_AUT_nombre VARCHAR(100) NOT NULL, 
    HIS_fecha DATE NOT NULL
);

# tabla de la relacion muchos a muchos, tener cuidado con eso
CREATE TABLE libro_has_autor(
	AUTOR_AUT_id INT(10),
    LIBRO_lib_id INT(10),
    PRIMARY KEY (AUTOR_AUT_id, LIBRO_lib_id),
    FOREIGN KEY (AUTOR_AUT_id)
    REFERENCES Autor(AUT_id),
    FOREIGN KEY (LIBRO_lib_id)
    References libro(lib_id)
);

INSERT INTO libro_has_autor(AUTOR_AUT_id , LIBRO_lib_id) values(1234,1);
INSERT INTO libro_has_autor(AUTOR_AUT_id , LIBRO_lib_id) values(1345,2);
INSERT INTO libro_has_autor(AUTOR_AUT_id , LIBRO_lib_id) values(1456,3);
INSERT INTO libro_has_autor(AUTOR_AUT_id , LIBRO_lib_id) values(1678,4);
INSERT INTO libro_has_autor(AUTOR_AUT_id , LIBRO_lib_id) values(1789,5);
INSERT INTO libro_has_autor(AUTOR_AUT_id , LIBRO_lib_id) values(2345,6);
INSERT INTO libro_has_autor(AUTOR_AUT_id , LIBRO_lib_id) values(2456,7);
INSERT INTO libro_has_autor(AUTOR_AUT_id , LIBRO_lib_id) values(2567,8);

SELECT * FROM nov08.autor;
SELECT * FROM nov08.editorial;
SELECT * FROM nov08.libro;
SELECT * FROM nov08.libro_has_autor;
