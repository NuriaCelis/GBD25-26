-- FUNCIONES DE AGREGADO: SUM, MAX, MIN, COUNT, AVG, GROUP_CONCAT

SELECT count(*) FROM contratos;
SELECT count(ffin) FROM contratos;
SELECT count(*) FROM automoviles;
SELECT count(DISTINCT marca) FROM automoviles;

SELECT avg(kfin-kini), max(kfin-kini),min(kfin-kini) 
FROM contratos;

SELECT group_concat(nombre) 
FROM clientes 
WHERE localidad='toledo';

SELECT sum(kfin-kini) 
FROM contratos 
INNER JOIN clientes ON dnicliente=dni 
WHERE localidad='madrid';

-- AGRUPAMIENTO DE REGISTROS. HACES UN GRUPO Y TRABAJAS SOBRE EL RESULTADO DE ESE CONJUNTO
SELECT marca,modelo 
FROM automoviles 
INNER JOIN contratos ON contratos.matricula = automoviles.matricula 
WHERE year(ffin)=2018 GROUP BY marca,modelo;

SELECT localidad 
FROM clientes 
GROUP BY localidad;

SELECT nombre,apellidos 
FROM clientes 
INNER JOIN contratos ON dnicliente=dni 
WHERE fini >='2017-12-24' 
GROUP BY dnicliente 
ORDER BY apellidos,nombre;

SELECT marca,count(*) 
FROM automoviles 
GROUP BY marca;

SELECT nombre,apellidos,count(*) 
FROM clientes 
INNER JOIN contratos ON dnicliente=dni 
WHERE fini >='2016-12-27' 
GROUP BY dnicliente 
ORDER BY apellidos,nombre;

SELECT marca,avg(precio)AS medio ,max(precio),min(precio) 
FROM automoviles 
GROUP BY marca 
ORDER BY medio DESC;

SELECT avg(precio),max(precio),min(precio) 
FROM automoviles 
WHERE marca='SEAT';

SELECT localidad,count(*) 
FROM clientes 
GROUP BY localidad 
HAVING count(*)>3;

SELECT marca FROM automoviles 
GROUP BY marca 
HAVING avg(precio)<105;

SELECT marca,avg(precio) AS media 
FROM automoviles 
GROUP BY marca 
HAVING media >=75 AND media<=100;
