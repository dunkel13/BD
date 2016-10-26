CREATE TABLE venta (cantidad INT, precio INT);   
INSERT INTO venta VALUES(5, 500);   
SELECT * FROM venta;

-- 1.2

 CREATE VIEW v AS SELECT cantidad, precio, cantidad*precio AS valor FROM venta;
 # La vista v creo un atributo llamado valor y le asigna el producto entre cantidad y precio 
  
-- 1.3
  SELECT * FROM v;
# Muestra la vista v con el nuevo atributo llamado valor

 -- 1.4
 INSERT INTO venta VALUES(2, 100); 
 INSERT INTO venta VALUES(5, 80);
 
 -- 1.5
 SELECT * FROM v;
 #Insertar nuevos registros en la tabla venta que se visualizaron en la vista v porque esta volviendo a consultar la tabla original
 
 -- 2.1
 
 CREATE TABLE venta2 (cantidad INT, precio INT, valor INT); 
 INSERT INTO venta2 VALUES(4, 200, cantidad *precio);
select * from venta2;

-- 2.2 
 CREATE VIEW v2 AS SELECT cantidad, precio FROM venta2;
#la vista v2 esta mostrando solo los atributos precio y cantidad con sus registros

-- 2.3
select * from v2;
#En la vista v2 solo se esta mostrando estos dos atributos como lo son Cantidad y precio 

-- 2.4
 UPDATE v2 SET cantidad = 20 WHERE valor = 200;
 select * from venta2;
 #Lo que sucede con la vista es que al actualizarla va a tener un error porque la condicion valor=200 no se cumple para esta vista porque el atributop valor no hace parte de la vista
 #La tabla original permanece igual 
 
 -- 3.1
 UPDATE v SET cantidad = 50 WHERE precio =200;
 
 -- 3.2
 # con la vista v no ocurre nada porque no se cumple para algun registro la condicion precio=200 con lo cual no se actualiza el valor de cantidad 
 
 -- 3.3
 drop view v;
 
 -- 4.1 
CREATE TABLE autor(    autor_id   integer(2)    NOT NULL  AUTO_INCREMENT PRIMARY KEY ,    nombre     varchar(10)   NULL,    apellido   varchar(10)   NOT NULL,    edad       integer(3)    NULL );

-- 4.2
INSERT INTO autor (  nombre, apellido, edad) VALUES ( 'Jose', 'Diaz', 23); 
INSERT INTO autor (  nombre, apellido, edad) VALUES ( 'Juan', 'Lopez', 20); 
INSERT INTO autor (  nombre, apellido, edad) VALUES ( 'Jose', 'Marin', 27); 
INSERT INTO autor (  nombre, apellido, edad) VALUES ( 'Maria', 'Suarez', 30); 
INSERT INTO autor (  nombre, apellido, edad) VALUES ( 'Ana', 'Garcia', 15);

select * from autor;
# el autor_id que tiene Maria Suarez es 4 porque la llave primaria es autoincremental

-- 4.3
CREATE VIEW view_autor1 AS SELECT nombre, apellido FROM autor;
#la vista view_autor1 muestra solo los atributos nombre y apellido de la tabla autor

-- 4.4
CREATE VIEW view_autor2 AS SELECT CONCAT(nombre, CONCAT(' ',apellido)) AS  nombre_completo FROM autor;
#La vista view_autor2 aplica la funcion concat a los atributos nombre y apellido para mostrar en la vista un solo atributo llamado nombre_completo
SHOW TABLES;
describe view_autor1;
describe view_autor2;

-- 4.5
INSERT INTO view_autor1 (apellido, edad) VALUES ( 'Paez', 35);
