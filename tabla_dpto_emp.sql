CREATE TABLE departamento (
dep_id        int(10)     auto_increment primary key,
dep_nombre    varchar(30)     not null,
dep_edificio  varchar(30) not null

);

INSERT INTO departamento     (dep_id, dep_nombre,dep_edificio) 
VALUES             (1, 'Gerencia','Principal'),
            (2, 'Desarrollo','planta'),
            (3, 'Investigacion','planta'),
            (4, 'Compras','anexo');
            
CREATE TABLE empleado (
emp_id        int(10)     auto_increment primary key,
emp_nombre    varchar(30)     not null,
emp_apellido  varchar(30) not null,
emp_salario varchar(30) not null,
dep_dep_id int(10) not null,
FOREIGN KEY (dep_dep_id) REFERENCES departamento(dep_id )
);

INSERT INTO empleado    (emp_id, emp_nombre,emp_apellido,emp_salario,dep_dep_id) 
VALUES             (1, "juan","perez","500000",1),
            (2, "pedro","perez","600000",2),
            (3, "maria","martinez","700000",3),
            (4, "juana","gutierrez","500000",1);
