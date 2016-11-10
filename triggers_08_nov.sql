# borrado en cascada, al borrar un autor deben borrarse los libros que escribio de la tabla libro
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

drop trigger if exists borrado_1;
drop trigger if exists borrado_2;

delimiter $$
create trigger borrado_2 before delete on autor
FOR EACH ROW BEGIN
SET @id=old.AUT_id;
SELECT AUT_nombre into @nom FROM libro_has_autor JOIN autor ON AUTOR_AUT_id=AUT_id where AUTOR_AUT_id=@id;
SELECT lib_titulo into @title FROM libro_has_autor JOIN libro ON lib_id=LIBRO_lib_id where AUTOR_AUT_id=@id;
INSERT INTO historia(HIS_lib_titulo,HIS_lib_AUT_nombre,HIS_fecha) VALUES(@title,@nom,curdate()); 
DELETE FROM libro_has_autor WHERE AUTOR_AUT_id=@id;

end; $$
delimiter ;


delimiter $$
CREATE TRIGGER borrado_1 AFTER DELETE ON libro_has_autor
FOR EACH ROW BEGIN
set @lib=old.LIBRO_lib_id;
DELETE FROM editorial WHERE id_libro=@lib;
DELETE FROM libro WHERE lib_id=@lib;
end; $$
delimiter ;

DELETE FROM autor WHERE AUT_id = 1345;
SELECT * FROM historia;
