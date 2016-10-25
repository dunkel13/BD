-- Procedimientos Almacenados, funciones y triggers

-- 1. Funcion Calcular el Salario de un empleado a futuro. Fórmula valor presente (Función)

delimiter &&

Create function Valor_Futuro (X_sueldo int, interes decimal(5,3), per int)

returns int

Begin
declare VF int;
set VF = X_sueldo*pow(1+interes,per);
return VF;

End &&

delimiter ;

set @futuro = Valor_Futuro(10000,0.1,1);
select @futuro;

drop function Valor_Futuro;

-- Proceso Actualizar datos de ubicacion de Empleado



drop procedure Actualizar_Ubicacion;

select*from empleado;
select* from ubicacion;



-- ---------------------------------------------

-- crear funciones

delimiter &&

create function Suma_Numeros (num1 int, num2 int) returns int

begin 

declare result int; 
set result =num1+num2;
return result; -- return a+b; 

end &&

delimiter ;

set @suma = Suma_numeros(10,20);

select @suma;
