-- Create TEST_ENV Database

USE TEST_ENV;


SELECT * FROM [dbo].[Product];

SELECT * FROM [dbo].[Test-Environmental-Inventory];



-- Finding all the Unique Product ID from Test Environmental Inventory table and if they Match all the 20 Product ID in Product Table

SELECT DISTINCT(Product_ID) 
FROM [dbo].[Test-Environmental-Inventory];

-- Distinct Value For ORder Date in Test Environmental Inventory table
SELECT DISTINCT([Order_Date_DD_MM_YYYY])
FROM [dbo].[Test-Environmental-Inventory];

-- Distinct Value For Availability Column in Test Environmental Inventory table
SELECT DISTINCT(Availability)
FROM [dbo].[Test-Environmental-Inventory];

-- Distinct Value For Demand Column in Test Environmental Inventory table
SELECT DISTINCT(Demand)
FROM [dbo].[Test-Environmental-Inventory];

-- Join Tables
SELECT ENV.[Order_Date_DD_MM_YYYY], ENV.[Product_ID], ENV.[Availability], ENV.[Demand], PROD.[Product_Name], PROD.[Unit_Price]
FROM [dbo].[Test-Environmental-Inventory] as ENV
LEFT JOIN [dbo].[Product] AS PROD
ON ENV.Product_ID = PROD.Product_ID;


-- Insert into a new Table with Joins

SELECT *
INTO NEW_TABLE
FROM (SELECT ENV.[Order_Date_DD_MM_YYYY], ENV.[Product_ID], ENV.[Availability], ENV.[Demand], PROD.[Product_Name], PROD.[Unit_Price]
FROM [dbo].[Test-Environmental-Inventory] as ENV
LEFT JOIN [dbo].[Product] AS PROD
ON ENV.Product_ID = PROD.Product_ID
) X;


-----------------------------------------------------------
SELECT * FROM [dbo].[NEW_TABLE];

SELECT * FROM NEW_TABLE;


-----------------------------------------------------------------
-- Create New Database for products as PROD

CREATE DATABASE PROD;

USE PROD;

SELECT * FROM [dbo].[Prod-Env-Inventory-Dataset];

SELECT COUNT(*) 
FROM [dbo].[Prod-Env-Inventory-Dataset];

SELECT DISTINCT	Order_Date_DD_MM_YYYY
FROM [dbo].[Prod-Env-Inventory-Dataset];

SELECT DISTINCT	Order_Date_DD_MM_YYYY
FROM [dbo].[Prod-Env-Inventory-Dataset]
WHERE Order_Date_DD_MM_YYYY IS NULL
OR Order_Date_DD_MM_YYYY = ''
;

SELECT DISTINCT	Product_ID
FROM [dbo].[Prod-Env-Inventory-Dataset]
WHERE Product_ID IS NULL
OR Product_ID = ''
;

-- There are 2 extra Product_ID in the PROD ENV Inventory Table so there are 22 IDS  but there are only 20 Product ids in Test Env  so the condition is give as 21ID = 7ID and 22ID = 11 ID

UPDATE [dbo].[Prod-Env-Inventory-Dataset] 
SET Product_ID = 7 
WHERE Product_ID = 21;

UPDATE [dbo].[Prod-Env-Inventory-Dataset]
SET Product_ID = 11
WHERE Product_ID = 22;

SELECT DISTINCT	Product_ID
FROM [dbo].[Prod-Env-Inventory-Dataset] 
ORDER BY Product_ID ASC;

SELECT DISTINCT	Availability
FROM [dbo].[Prod-Env-Inventory-Dataset];

SELECT DISTINCT	Demand
FROM [dbo].[Prod-Env-Inventory-Dataset];

SELECT DISTINCT	Availability
FROM [dbo].[Prod-Env-Inventory-Dataset]
WHERE Availability IS NULL
OR Availability = ''
;

SELECT DISTINCT	Demand
FROM [dbo].[Prod-Env-Inventory-Dataset]
WHERE Demand IS NULL
OR Demand = ''
;

SELECT PROD_INV.Order_Date_DD_MM_YYYY, PROD_INV.Product_ID, PROD_INV.Availability, PROD_INV.Demand, PROD.Product_Name, PROD.Unit_Price
FROM [dbo].[Prod-Env-Inventory-Dataset] AS PROD_INV
LEFT JOIN [dbo].[Product] AS PROD
ON PROD_INV.Product_ID = PROD.Product_ID

SELECT * INTO NEW_Table
FROM
(SELECT PROD_INV.Order_Date_DD_MM_YYYY, PROD_INV.Product_ID, PROD_INV.Availability, PROD_INV.Demand, PROD.Product_Name, PROD.Unit_Price
FROM [dbo].[Prod-Env-Inventory-Dataset] AS PROD_INV
LEFT JOIN [dbo].[Product] AS PROD
ON PROD_INV.Product_ID = PROD.Product_ID)X