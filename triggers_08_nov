# borrado en cascada, al borrar un autor deben borrarse los libros que escribio de la tabla libro
drop trigger if exists tr_1;
delimiter $$
create trigger tr_1 after delete on autor
for each row begin
insert into historia values(OLD.lib_titulo, OLD.AUT_nombre, curdate());
delete from libro where 
end$$

delimiter ; 

drop trigger if exists tr_2;
delimiter $$
create trigger tr_2 after update on libro
for each row begin
insert into bitacora values (OLD.lib_id, OLD.lib_precio, NEW.lib_precio);
end$$

delimiter ; 

UPDATE libro set lib_precio=24000 where lib_id=8;
UPDATE libro set lib_precio=48000 where lib_id=8;
select * from bitacora;
