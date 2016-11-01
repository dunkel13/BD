use museo;
drop procedure if exists TipoObra;
DELIMITER $$
  CREATE PROCEDURE TipoObra (IN tipo varchar(25))
BEGIN
declare salida INT;
call contarTipoObra(tipo, salida);
select salida;
END$$
  DELIMITER ;
  
 call TipoObra("pintura");
 call TipoObra("boseto");
 
  drop procedure if exists contarTipoObra;
  DELIMITER $$
  CREATE PROCEDURE contarTipoObra (IN tipo varchar(25), OUT total INT)
BEGIN
SELECT COUNT(obr_id_Obra) INTO total FROM obra where obr_tipo=tipo;
END$$
  DELIMITER ;
  
# función que retorne el numero de obras de algun tipo 

delimiter //
create function contarTipoObra (tipo varchar(25))
returns INT
begin
declare total int;
SELECT COUNT(obr_id_Obra) INTO total FROM obra where obr_tipo=tipo;
return total;
end //
 delimiter ;
 set @a=contarTipoObra("pintura");
 select @a;
