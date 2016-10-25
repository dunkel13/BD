create view vw_obra2 as select * from obra;
select * from vw_obra2;
update vw_obra2 set obr_costo=1500 where obr_nombre_obra='Mona Lisa';
set SQL_SAFE_UPDATES=0;

update vw_obra2 set obr_tipo_obra='Boceto' where  obr_nombre_obra='Mona Lisa';
