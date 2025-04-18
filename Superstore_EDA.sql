-- SQL PORTFOLIO PROJECT 

-- METHODOLOGY:
-- 1.DATA PROCESSING/DATA CLEANING(Import Data, Remove Duplicates, Handle NULL values)
-- 2.EXPLORATORY DATA ANALYSIS

-- DATA PROCESSING/DATA CLEANING:

-- Create Database and Import data
CREATE DATABASE Superstore;
USE Superstore;

-- Remove Duplicates
WITH Duplicates AS(SELECT *, ROW_NUMBER() OVER (PARTITION BY OrderID, ProductID ORDER BY RowID) AS RowNum
FROM OrderDetails)
DELETE 
FROM Duplicates
WHERE RowNum >1;

-- Observation: 8 Duplicates found
-- Action: Delete Duplicates

-- Handling Null values
SELECT*
FROM Orderdetails
WHERE Profit is NULL;
-- Observation: 1 Null found

UPDATE OrderDetails
SET Profit = (SELECT AVG(Profit) 
FROM Orderdetails
WHERE Profit >=0)
WHERE Profit is Null;

-- Action: NULL filled with Average of Profit

SELECT*
FROM Orderdetails
WHERE Profit < 0;

-- Obseration: Negative Profit found which is Loss


-- EXPLORATORY DATA ANALYSIS

-- Sales by Product Category
SELECT 
	Category, 
	SUM(Sales) AS TotalSales
FROM OrderDetails
GROUP BY Category
ORDER BY TotalSales DESC;

-- Best-selling Products by Revenue
SELECT TOP 5
	ProductName, 
	SUM(Sales) AS Revenue
FROM OrderDetails
GROUP BY ProductName
ORDER BY Revenue DESC;

-- Total Profit
SELECT 
	SUM(Profit) AS TotalProfit
FROM OrderDetails
WHERE Profit >=0; -- Total Profit $442,187

-- Total Loss
SELECT 
	SUM(Profit) AS TotalLoss
FROM OrderDetails
WHERE Profit <=0 -- Total Loss $155,699.22

-- Net Profit
SELECT 
	SUM(Profit) AS NetProfit
FROM OrderDetails -- Net Profit $286,488.29

-- Profit by Product Category
SELECT 
	Category, 
	SUM(Profit) AS TotalProfit
FROM OrderDetails
WHERE Profit >=0
GROUP BY Category
ORDER BY TotalProfit DESC;


-- Total Sales over time
SELECT 
	SUM(Sales) AS TotalSales
FROM OrderDetails;


-- Total Quantity sold Over time
SELECT 
	SUM(Quantity) AS TotalQuantity
FROM OrderDetails;


-- which months or quarters had the highest  and lowest sales?
SELECT TOP 1
	DATEPART(MONTH, OrderDate) AS SalesMonth,
	SUM(Sales) AS TotalSales
FROM OrderDetails
GROUP BY DATEPART(MONTH, OrderDate)
ORDER BY TotalSales DESC; -- Highest Sales Month

SELECT TOP 1
	DATEPART(MONTH, OrderDate) AS SalesMonth,
	SUM(Sales) AS TotalSales
FROM OrderDetails
GROUP BY MONTH(OrderDate)
ORDER BY TotalSales ASC;-- Lowest Sales Month

SELECT 
    DATEPART(QUARTER, OrderDate) AS SalesQuarter,
    SUM(Sales) AS TotalQuarterlySales
FROM OrderDetails
GROUP BY 
    DATEPART(QUARTER, OrderDate)
ORDER BY  
    SalesQuarter DESC;-- Highest & Lowest Sales Quarter

-- Average Order Value
SELECT 
	SUM(Sales)/COUNT(DISTINCT(OrderID)) AS AverageOrderValue
FROM OrderDetails;

-- Top Customers by Revenue
SELECT TOP 5
	CustomerName,
	SUM(sales) AS Revenue
FROM OrderDetails
GROUP BY CustomerName
ORDER BY Revenue DESC;

-- Average purchase frequency by Customer 
SELECT 
	COUNT(DISTINCT(OrderID))/ COUNT(DISTINCT(CustomerID)) AS AveragePurchaseFrequency
FROM OrderDetails; 

-- which customer segment spends most
SELECT TOP 1
	Segment, 
	SUM(Sales) AS TotalSpend
FROM OrderDetails
GROUP BY Segment
ORDER BY TotalSpend DESC;

-- Which Regions generates the most Sales
SELECT Top 2
	Region, 
	SUM(Sales) AS Sales
FROM OrderDetails
GROUP BY Region
ORDER BY Sales DESC;

-- Sales performance across City 
SELECT Top 5
	City,
	SUM(Sales) AS Sales
FROM OrderDetails
GROUP BY City
ORDER BY Sales DESC;



