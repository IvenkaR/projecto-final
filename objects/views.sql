USE los_artesanos;

-- Mostrar nombre en mayuscula del producto
CREATE OR REPLACE VIEW NOMBRE_EN_MAYUSCULA_DEL_PRODUCTO AS 
SELECT 
UCASE(Nombre_Prod ) AS "Nombre Producto" 
FROM tabla_productos;

-- Nombre en minuscula del producto
CREATE OR REPLACE VIEW NOMBRE_EN_MINUSCULA_DEL_PRODUCTO AS 
SELECT 
LCASE(Nombre_Prod ) AS "Nombre Producto" 
FROM tabla_productos;

-- Numero de Artesanos en la Feria
CREATE OR REPLACE VIEW NUMERO_DE_ARTESANOS AS 
SELECT 
COUNT(Nombre_Art) AS "Cantidad de Artesanos" 
FROM tabla_artesanos;

-- TOP 10 Artesanos que mas han vendido por hora 
CREATE OR REPLACE VIEW Resumen_Ventas AS
SELECT ID_Art, day(Fecha_Hora) AS Dia,HOUR(Fecha_Hora) AS Hora, SUM(articulos_vendidos_vta) AS Total_Ventas
FROM tabla_venta
GROUP BY ID_Art,dia,Hora
ORDER BY Total_Ventas DESC
LIMIT 10;

-- Saber cuantos Artesanos hay por cada Region
CREATE OR REPLACE VIEW Artesanos_por_region AS 
SELECT 
Region_Art AS "Region de Artesanos",
COUNT(*) AS Total_Artesanos
FROM tabla_artesanos
GROUP BY Region_Art;

-- Cantidad de productos por categoria
CREATE OR REPLACE VIEW Productos_por_categoria AS
SELECT 
	C.Nombre_Cat,
	COUNT(P.ID_Prod) AS TotalProductos
FROM tabla_categorias C
JOIN tabla_productos P ON C.ID_Cat = P.ID_Cat
GROUP BY C.Nombre_Cat;