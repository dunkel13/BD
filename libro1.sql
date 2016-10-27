# con precio como var local
drop database if exists OCT27;
CREATE DATABASE OCT27;
USE OCT27;

drop table if exists promocion;
drop table if exists libro;
create table libro(
	lib_id INT(10) PRIMARY KEY auto_increment,
    lib_titulo VARCHAR(100) NOT NULL,
    lib_precio INT NOT NULL    
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
drop table if exists promocion;
create table promocion(
	pro_id int PRIMARY KEY auto_increment,
    pro_Nprecio double NOT NULL,
    id_producto INT(10) NOT NULL,
    FOREIGN KEY (id_producto)
	REFERENCES libro (lib_id)
    
);

select* from promocion;

drop procedure if exists sp_promocion_libros;
delimiter $$
CREATE PROCEDURE sp_promocion_libros(id INT(10))
begin
declare precio int;
set precio =(select lib_precio from libro where lib_id=id);
-- select precio into var_precio from libro where lib_id=id;
	if precio < 50000 then 
	insert into promocion(id_producto, pro_Nprecio) values(id,precio*0.9);
    elseif precio >= 50000 and precio >1000000 then
    insert into promocion(id_producto, pro_Nprecio) values(id,precio*0.85);
	end if;
	end $$
    
delimiter ;
call sp_promocion_libros(7);
select * from promocion;
