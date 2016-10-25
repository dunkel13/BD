create database bd_ciudades;

use bd_ciudades;

create table ciudad( 
	id_ciudad int auto_increment primary key,
	ciu_nombre varchar(20) not null
    );
    
    
create table destino(
   id_salida int,
   id_llegada int,
   PRIMARY KEY(id_salida, id_llegada)
    );

-- Ciudades

insert into ciudad (ciu_nombre) values('Bogota');
insert into ciudad (ciu_nombre) values('Cali');
insert into ciudad (ciu_nombre) values('Cartagena');
insert into ciudad (ciu_nombre) values('Medellin');
insert into ciudad (ciu_nombre) values('Florencia');

-- destino

insert into destino (id_salida,id_llegada) values('2','1');
insert into destino (id_salida,id_llegada) values('5','1');
insert into destino (id_salida,id_llegada) values('5','4');
insert into destino (id_salida,id_llegada) values('5','3');
insert into destino (id_salida,id_llegada) values('1','3');
insert into destino (id_salida,id_llegada) values('1','4');
insert into destino (id_salida,id_llegada) values('4','2');
insert into destino (id_salida,id_llegada) values('4','3');


select * from ciudad;
select * from destino;



select ciu_salida.ciu_nombre, ciu_llegada.ciu_nombre from destino 
join ciudad as ciu_salida on (destino.id_salida=ciu_salida.id_ciudad) 
join ciudad as ciu_llegada on (destino.id_llegada=ciu_llegada.id_ciudad);
