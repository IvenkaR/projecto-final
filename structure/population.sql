USE `los_artesanos` ;

SET GLOBAL local_infile = true;

LOAD DATA LOCAL INFILE '/structure/data-csv/tabla_artesanos.csv'
INTO TABLE tabla_artesanos
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE '/structure/data-csv/tabla_categorias.csv'
INTO TABLE tabla_categorias
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

