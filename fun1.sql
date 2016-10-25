-- Proceso Actualizar datos de ubicacion de Empleado

delimiter //

Create procedure Actualizar_Ubi_Emp(in id_ubi int,in dir varchar(45),in tel varchar(30),in fijo varchar(30))

begin
update ubicacion
set  ubi_direccion=dir, ubi_tel_fijo=tel, ubi_Tel_celular=fijo where id_ubi= ubi_cod;
end //

delimiter ;


call Actualizar_Ubi_Emp(2,545,5454,54);
select* from ubicacion;
select* from empleado;
select* from sector;
select* from contrato;

-- Proceso que me permite a travez de insertar la cedula del empleado ubicar el sector, la labor , y el nombre de este

delimiter %%

create procedure detectar_empleado (in ced_emp int)
select emp_nombre,sec_C_costo,con_labor 
from empleado join contrato using(emp_documento) join sector using(sec_cod)
where ced_emp=emp_documento group by emp_nombre;

delimiter ;

drop procedure detectar_empleado;

call detectar_empleado(5822260);


-- ----------------------------------------------------------------

delimiter $$

create procedure Salario_pension (in Documento int, out Sal2 int)

-- doucumento como parametro, mostrar salario con descuento

begin

if emp_documento = Documento and con_salario<650000 then 
set Sal2=con_salario-con_salario*0.5;

elseif emp_documento = Documento and con_salario>650000 then
set Sal2=con_salario-con_salario*0.6;

elseif emp_documento = Documento and 650000 <con_salario<1500000 then
set Sal2=con_salario-con_salario*0.7;

end if;

end $$


delimiter ;

drop procedure Salario_pension;

call Salario_pension(52756178,2);


-- --
