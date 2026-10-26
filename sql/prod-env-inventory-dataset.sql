SELECT * FROM prod.`prod-env-inventory-dataset`;

UPDATE `prod`.`prod-env-inventory-dataset`
SET `Product ID` = 7 
WHERE `Product ID` = 21;

UPDATE `PROD`.`prod-env-inventory-dataset`
SET `Product ID` = 11
WHERE `Product ID` = 22;

SELECT *
FROM `prod`.`prod-env-inventory-dataset`
WHERE `Product ID` IN (11, 7);