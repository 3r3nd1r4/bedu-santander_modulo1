# ------ EVIDENCIAS --------------
# Alumnx : Eréndira Celis Acosta
# ere.is.not.here@gmail.com
# Módulo 1 - Sesión 3
# Usando la base de datos tienda, escribe consultas 
# que permitan responder las siguientes preguntas:
SHOW DATABASES;
USE tienda;
SHOW TABLES;
# --------------------------------------------------
# Reto 1
#¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
SELECT nombre,apellido_paterno,apellido_materno 
FROM empleado 
WHERE id_puesto IN 
(SELECT id_puesto FROM puesto WHERE salario < 15000);

#¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT id_empleado, min(num_ventas), max(num_ventas)
FROM
 (SELECT clave, id_empleado, count(*) AS num_ventas
      FROM venta
      GROUP BY clave, id_empleado) AS sq
GROUP BY id_empleado;

#¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
SELECT clave FROM venta WHERE id_articulo IN
(SELECT id_articulo FROM articulo WHERE precio > 5000);
#-------------------------------------------------------------------
# Reto 2

#¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT clave, nombre, apellido_paterno, apellido_materno
FROM venta AS vv
JOIN empleado AS ee
ON ee.id_empleado = vv.id_empleado
ORDER BY clave;

#¿Cuál es el nombre de los artículos que se han vendido?
SELECT nombre
FROM venta AS vv
JOIN articulo aa
ON vv.id_articulo = aa.id_articulo
ORDER BY clave;

#¿Cuál es el total de cada venta?
SELECT clave,ROUND(SUM(precio),2) AS monto_total
FROM venta AS vv
JOIN articulo aa
ON vv.id_articulo = aa.id_articulo
GROUP BY clave;
#-------------------------------------------------------------------
# Reto 3

#Obtener el puesto de un empleado.
CREATE VIEW puestos_de_empleados AS
(SELECT ee.nombre, apellido_paterno, apellido_materno, pp.nombre AS puesto
FROM empleado AS ee
LEFT JOIN puesto pp
ON ee.id_puesto = pp.id_puesto);
SELECT * FROM puestos_de_empleados;

#Saber qué artículos ha vendido cada empleado.
CREATE VIEW articulos_por_empleado AS
(SELECT ee.nombre, apellido_paterno, apellido_materno, aa.nombre AS producto
FROM venta AS vv
JOIN empleado ee
ON vv.id_empleado = ee.id_empleado
JOIN articulo aa
ON vv.id_articulo = aa.id_articulo
ORDER BY ee.id_empleado);
SELECT * FROM articulos_por_empleado;

#Saber qué puesto ha tenido más ventas.
CREATE VIEW ventas_x_puesto AS
(SELECT pp.nombre,vv.clave
FROM empleado as ee
JOIN puesto pp
ON ee.id_puesto = pp.id_puesto
JOIN venta vv
ON ee.id_empleado = vv.id_empleado
ORDER BY pp.nombre);
SELECT nombre,COUNT(*) AS num_ventas
FROM ventas_x_puesto
GROUP BY nombre;