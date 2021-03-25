/*1.Obtener todos los apellidos de los empleados. */
SELECT apellidos FROM empleado;

/*2.Obtener los apellidos de los empleados sin repeticiones.*/
SELECT DISTINCT apellidos FROM empleado;

/*3.Obtener todos los datos de los empleados que se apellidan “Pérez”*/
SELECT *FROM empleado WHERE apellidos LIKE '%Pérez%';

/*4.Obtener todos los datos de los empleados que se apellidan “Pérez” o “López” */
SELECT *FROM empleado WHERE apellidos LIKE '%Pérez%' OR apellidos LIKE '%López%';

/*5.Obtener todos los datos de los empleados que trabajan para el departamento “Contabilidad” */
SELECT e.dpi,e.nombre,e.apellidos,d.codigo_departamento,d.nombre_depto as Departamento
FROM empleado e INNER JOIN departamento d ON e.cod_depto=d.codigo_departamento WHERE d.nombre_depto='Contabilidad';

/*6.Obtener todos los datos de los empleados que trabajan para el departamento “Contabilidad” y “Gerencial General” */
SELECT e.dpi,e.nombre,e.apellidos,d.codigo_departamento,d.nombre_depto as Departamento
FROM empleado e INNER JOIN departamento d ON e.cod_depto=d.codigo_departamento
WHERE d.nombre_depto='Contabilidad' OR d.nombre_depto='Gerencia';

/*7.Obtener todos los datos de los empleados cuyo apellido comienza por la letra “P” */
SELECT *FROM empleado WHERE apellidos LIKE 'P%';

/*8.Obtener el presupuesto total de todos los departamentos. */
SELECT SUM(presupuesto) as Total FROM departamento;

/*9.Obtener el número de empleados por cada departamento. */
SELECT COUNT(*) as Numero_Empleados,d.nombre_depto 
FROM empleado e INNER JOIN departamento d ON e.cod_depto=d.codigo_departamento
GROUP BY d.nombre_depto;

/*10.Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento. */
SELECT *FROM empleado e INNER JOIN departamento d ON e.cod_depto=d.codigo_departamento;

/*11.Obtener un listado completo de empleados, mostrando su nombre y apellido, junto con el nombre y presupuesto del departamento.
Todo ordenado descendentemente por el apellido. */
SELECT e.nombre, e.apellidos, d.nombre_depto, d.presupuesto 
FROM empleado e INNER JOIN departamento d ON e.cod_depto=d.codigo_departamento
ORDER BY e.apellidos DESC;

/*12.Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor a 60,000. */
SELECT e.nombre,e.apellidos, d.nombre_depto
FROM empleado e INNER JOIN departamento d ON e.cod_depto=d.codigo_departamento
WHERE d.presupuesto>='60000';

/*13.Obtener los datos de los departamentos cuyo presupuesto es superior al presupuesto medio de todos los departamentos. */
SELECT *FROM departamento WHERE presupuesto>=(SELECT AVG(presupuesto) FROM departamento);

/*14.Obtener los nombres de los departamentos que tienen más de 2 empleados. */
SELECT COUNT(*) as Numero_Empleados,d.codigo_departamento,d.nombre_depto
FROM empleado e INNER JOIN departamento d ON e.cod_depto=d.codigo_departamento
GROUP BY d.codigo_departamento,d.nombre_depto HAVING COUNT(*)>2;

/*15.Agregar un nuevo departamento “Control de Calidad”, con presupuesto de 40,000 y código 11.
Y agregar un empleado vinculado a este departamento de nombre Esther Vásquez y con DNI: 28948238*/

/*Inserta nuevo departamento*/
INSERT INTO departamento VALUES('11','Control De Calidad','40000');
/*Se verifca que se creo Correctamente*/
SELECT *FROM departamento WHERE codigo_departamento='11';
/*Se ingresa nuevo empleado que se vincula con el departamento*/
INSERT INTO empleado VALUES('28948238','Esther','Vásquez','11');
/*Se verifica que se creo correctamente*/
SELECT *FROM empleado WHERE dpi='28948238';