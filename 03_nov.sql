# PA que reciba nombre de la obra, costo, tipo, y nombre de la exposicion
# y almacene la obra
# si  la exposicion no existe el PA debe crearla 
# El PA debe devolver el codigo de la exposicion por parametro

drop procedure if exists pa1;
Delimiter $$
create procedure pa1(IN nom_obra varchar(30), IN costo_obra float, IN tipo_obra varchar(30), IN nom_expo varchar(30))
begin
declare id_exp int ;
declare id_obr int ;
declare cod_exp int;
 set id_exp= (round(rand(0)*100,0));
 set id_obr= (round(rand(0)*100,0));
 set @id_expo=(select exp_id_expo from EXPOSICION where exp_nombre_expo=nom_expo);
if nom_expo = (select exp_nombre_expo from EXPOSICION where exp_nombre_expo=nom_expo) then
 Insert into OBRA values (id_obr, nom_obra, costo_obra, tipo_obra, @id_expo); 
 elseif nom_expo != (select exp_nombre_expo from EXPOSICION where exp_nombre_expo=nom_expo) then 
Insert into EXPOSICION values (id_exp, nom_expo);
 end if;
 set @cod_exp=id_exp;
  select @cod_exp;
end $$

delimiter ;

call pa1("obra1", 2000, "tipo1", "expo1");
call pa1("obra2", 2000, "tipo1", "Da Vinci");
select * from OBRA;
