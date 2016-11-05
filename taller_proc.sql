DROP DATABASE IF EXISTS tproc;

CREATE DATABASE tproc;

USE tproc;

-- ***************************************************************************
-- Procedure 1
-- ***************************************************************************
-- Crea la tabla T y crea la vista V_T

drop table if exists T;
CREATE TABLE T (
    cantidad INT,
    precio INT
);
INSERT INTO T VALUES(3, 50);
INSERT INTO T VALUES(2, 100);
INSERT INTO T VALUES(5, 80);
CREATE VIEW V_T AS
    SELECT 
        cantidad, precio, cantidad * precio AS valor
    FROM
        T;
SELECT 
    *
FROM
    V_T;

-- Crea el procedimiento proc_VER_T
drop procedure if exists proc_VER_T;
DELIMITER $$
CREATE PROCEDURE proc_VER_T()
BEGIN
select * from V_T;
END $$
DELIMITER //
# 1.1 El procedimiento almacenado hace la consulta de todas las filas de la tabla de la vista V_T

-- Ejecuta proc_VER_T
CALL proc_VER_T();
# 1.2 Al ejecutar el procedimiento se muestra la tabla de la vista V_T

CREATE USER 'user1'@'localhost' IDENTIFIED BY '54321';
GRANT ALL ON tproc.* TO 'user1'@'localhost';
# 1.3 Al ejecutar con otro usuario el procedimiento, muestra de igual forma la tabla de la vista V_T

-- ***************************************************************************
-- Procedure 2
-- ***************************************************************************

DELIMITER $$
CREATE PROCEDURE simpleproc (OUT param1 INT)
BEGIN
SELECT COUNT(*) INTO param1 FROM T;
END$$
DELIMITER ;
# 2.1 El anterior procedimiento cuenta los registros de la tabla T, y almacena este valor en la variable 'param1' que es de tipo salida
# param1 es un parámetro de salida  

CALL simpleproc (@total);
select @total;
# 2.2 Las instrucciones anteriores llaman el procedimiento simpleproc y consultan el valor total
# @total es una variable de tipo entero

drop table if exists ventas;
CREATE TABLE ventas ( stor_id char(4),
ord_num varchar(20),
fecha date );

drop procedure if exists proc_insert_ventas3;
DELIMITER $$
CREATE PROCEDURE proc_insert_ventas3( IN stor_id char(4), IN ord_num varchar(20), IN fecha date )
BEGIN
IF fecha is null THEN
set fecha = curdate();
END IF;
INSERT ventas values (stor_id, ord_num, fecha);
END$$
DELIMITER ;


# 2.3 El anterior procedimiento almacenado tiene 3 parámetros de entrada que son los atributos de la tabla 'ventas', 
# lo que hace este procedimiento es insertar valores a la tabla ventas a traves de la funcion values(), y ademas usa un if para asignar la fecha actual a taves de la funcion curdate() cuando la fecha es null.

-- Ejecuta el procedimiento 
CALL proc_insert_ventas3('v1', 'v111', '2005-08-03' );
select * from ventas;
# 2.4 Al ejecutar el procedimiento ocurre un error, el cual indica que el procedimiento 'proc_insert_ventas' no existe, por lo cual no lo puedo llamar
# una vez corregido el error anterior, al ejecutar el procedimiento, se inserta en la tabla 'ventas' 1 registro
# Resultados en la tabla de salida despues de ejecutar el procedimiento

#CALL proc_insert_ventas3('v2', 'v112' );
# 2.5 ocurre un error al llamar el procedimiento, porque le falta ingresar el parámetro de entrada correspondiente a fecha

CALL proc_insert_ventas3('v3','v113', null);
select * from ventas;
# 2.6 una vez corregido el mismo error que en 2.4,  al ejecutar el procedimiento se inserta en la tabla 'ventas' 1 registro, y dado que se cumple que la fecha es null, entonces se le asigna el valor de la fecha actual

-- ***************************************************************************
-- Procedure 3
-- ***************************************************************************
# 3.1 Crea la tabla libro 
drop table if exists libro;
create table libro(
	lib_ISBN INT(10) PRIMARY KEY,
    lib_titulo VARCHAR(100) NOT NULL,
    lib_precio DOUBLE NOT NULL,
    lib_tipo VARCHAR(50) NOT NULL
);

# 3.2 Insertar datos
-- deben existir por lo menos un libro de cada uno de los siguientes tipos: astronomía, fisica, bases de datos y computación

INSERT INTO libro(lib_ISBN, lib_titulo, lib_precio, lib_tipo) values(0321888030,"R for everyone", 110000,"computación");
INSERT INTO libro(lib_ISBN, lib_titulo, lib_precio, lib_tipo) values(2021152231,"Quantum Sapiens", 80000,"física");
INSERT INTO libro(lib_ISBN, lib_titulo, lib_precio, lib_tipo) values(2023216546,"Introducción a la astronomía", 40000,"astronomía");
INSERT INTO libro(lib_ISBN, lib_titulo, lib_precio, lib_tipo) values(2024279273,"Agujeros negros y máquinas del tiempo", 90000,"astronomía");
INSERT INTO libro(lib_ISBN, lib_titulo, lib_precio, lib_tipo) values(0781973819,"Enigma cuántico", 30000,"física");
INSERT INTO libro(lib_ISBN, lib_titulo, lib_precio, lib_tipo) values(2015734372,"La ciencia de programar", 45000,"computación");
INSERT INTO libro(lib_ISBN, lib_titulo, lib_precio, lib_tipo) values(1448146441,"Fundamentos de bases de datos", 55000,"bases de datos");
INSERT INTO libro(lib_ISBN, lib_titulo, lib_precio, lib_tipo) values(1447145441,"Bases de datos", 45000,"bases de datos");

# 3.3 Asignar a una variable el numero de registros leidos
SELECT * FROM libro;
set @rows = found_rows();
select @rows;

# 3.4 Crear un procedimiento almacenado para incrementar el precio de los libros en un porcentaje de acuerdo al tipo de libro
drop procedure if exists precio_lib;
DELIMITER ""
CREATE PROCEDURE precio_lib(IN tipo VARCHAR(50))
BEGIN 
if tipo="astronomía" then
update libro set lib_precio=round(lib_precio*1.05,0) where lib_tipo="astronomía";
elseif tipo="física" then
update libro set lib_precio=round(lib_precio*1.08,0) where lib_tipo="física";
elseif tipo="computación" then
update libro set lib_precio=round(lib_precio*1.08,0) where lib_tipo="computación";
elseif tipo="bases de datos" then
update libro set lib_precio=round(lib_precio*1.12,0) where lib_tipo="bases de datos";
END IF;
END ""

DELIMITER ;
# 3.5 Call proc_...(...) and then SELECT * from libro
CALL precio_lib("astronomía");
CALL precio_lib("física");
CALL precio_lib("bases de datos");
CALL precio_lib("computación");
SELECT * FROM libro;

-- ***************************************************************************
-- Procedure 4
-- ***************************************************************************

# Crear un procedimiento almacenado que reduzca el precio de los libros (de la tabla creada en el punto
# anterior) en un porcentaje (recibido por parámetro),
# solo si el precio del libro es mayor a un valor (también dado por parámetro). En caso de que no
# existan libros con precio mayor al dado por parametro
# sacar un mensaje que indique que el precio de todos los libros estaba por debajo de ese valor.

drop procedure if exists precio_lib2;
delimiter $$
CREATE PROCEDURE precio_lib2(IN per tinyint(2), IN valor DOUBLE)
begin
	set @message ='el precio de todos los libros esta por debajo de ese valor';
    set @perf= (100 - per)/100;
    set @price =(select max(lib_precio) from libro);  
    if valor < @price then
    update libro set lib_precio=round(lib_precio*@perf,0) where lib_precio > valor;
	elseif valor > @price then select @message; 
    end if;
    end $$
    
DELIMITER ;

CALL precio_lib2(50,150000);
select * from libro;

-- ***************************************************************************
-- Procedure 5
-- ***************************************************************************
# Crear un procedimiento almacenado que incremente el precio de los libros en 10.000, 
# hasta que el promedio del precio de los libros sea mayor que 150.000.
drop procedure if exists precio_lib3;
delimiter $$
CREATE PROCEDURE precio_lib3()
begin
 set @mean =(select avg(lib_precio) from libro);
 while (@mean<150000) do 
 update libro set lib_precio=round(lib_precio + 10000,0);
 set @mean =(select avg(lib_precio) from libro);
 end while;
end$$

call precio_lib3() 
select * from libro;
select avg(lib_precio) from libro


drop procedure if exists precio_lib4;
delimiter $$
CREATE PROCEDURE precio_lib4()
begin
 repeat  
 set @mean =(select avg(lib_precio) from libro); 
 update libro set lib_precio=round(lib_precio + 10000,0);
 until (@mean>150000)
 end repeat;
end$$

delimiter ;

call precio_lib4();
select * from libro;


-- ***************************************************************************
-- Procedure 6
-- ***************************************************************************
# Crear un procedimiento que reduce el precio de los libros a la mitad, mientras que el promedio de los libros es mayor que $50.000. 
# sin embargo si el máx precio de los libros cae por debajo de 80.000 se termina de reducir los precios de los otros libros.
drop procedure if exists precio_lib5;
delimiter $$
CREATE PROCEDURE precio_lib5()
begin
set @mean =(select avg(lib_precio) from libro);
set @price =(select max(lib_precio) from libro);
while (@mean>50000 or @price>80000) do
update libro set lib_precio=round(lib_precio*0.5,0);
set @mean =(select avg(lib_precio) from libro);
set @price =(select max(lib_precio) from libro);  
end while;
end $$

delimiter ;

call precio_lib5();
select * from libro;
