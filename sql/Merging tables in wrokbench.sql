-- Joining Two TABLE USING JOIN

SELECT PROD_INV.`Product ID`, 
PROD_INV.`Order Date (DD/MM/YYYY)`, 
PROD_INV.Availability, 
PROD_INV.Demand,
PROD.`Product Name`, 
PROD.`Unit Price ($)` 
FROM `prod`.`prod-env-inventory-dataset` AS PROD_INV
LEFT JOIN `prod`.`product` AS PROD
ON PROD_INV.`Product ID` = PROD.`Product ID`;

CREATE TABLE prod.NEW_TABLE AS
SELECT PROD_INV.`Product ID` AS `Product_ID`, 
PROD_INV.`Order Date (DD/MM/YYYY)` AS `Order_Date_DD_MM_YYYY)`, 
PROD_INV.Availability, 
PROD_INV.Demand,
PROD.`Product Name` AS `Product_Name`, 
PROD.`Unit Price ($)` AS `Unit_Price`
FROM `prod`.`prod-env-inventory-dataset` AS PROD_INV
LEFT JOIN `prod`.`product` AS PROD
ON PROD_INV.`Product ID` = PROD.`Product ID`;