USE `los_artesanos` ;

DROP PROCEDURE IF EXISTS sp_IVA;
-- Calcular el IVA que incluye un producto -- 
DELIMITER //
CREATE PROCEDURE sp_IVA(in n_prod varchar(50), in iva decimal(3,2))
BEGIN
   DECLARE like_ VARCHAR(20);
	SET like_ = CONCAT('%',n_prod,'%');
   SELECT nombre_prod,(Precio_Prod * iva) AS precio_IVA FROM TABLA_PRODUCTOS WHERE nombre_prod like like_;

END //
DELIMITER ;

-- Traer los productos que cuesten mas de X Dolares -- 
DELIMITER // 
CREATE PROCEDURE sp_valores (in n_prod int)
BEGIN
	SELECT
	Nombre_Prod FROM tabla_productos WHERE Precio_Prod > n_prod;
    
    END //
    DELIMITER ;


    