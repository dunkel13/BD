SELECT * FROM sys.exposicion;
create view vista1 as select exp_nombre_expo, obr_nombre_obra from Exposicion join obra;  
SHOW CREATE VIEW vista1;
SELECT * FROM vista1;
