/*	
Cleaning Data in SQQL
Skills Used : CREATE,SELECT,Aggregate,CTE's,Window Functions,Creating Views,Converting Data Type,GROUP BY,ORDER BY
*/

CREATE DATABASE GlobalSuperstoreDB;
USE GlobalSuperstoreDB;

CREATE TABLE Orders (
    OrderID NVARCHAR(50),
    OrderDate DATE,
    ShipDate DATE,
    ShipMode NVARCHAR(50),
    CustomerID NVARCHAR(50),
    CustomerName NVARCHAR(100),
    Segment NVARCHAR(50),
	City NVARCHAR(50),
    Country NVARCHAR(50),
    Region NVARCHAR(50),
    ProductID NVARCHAR(50),
    Category NVARCHAR(50),
    SubCategory NVARCHAR(50),
    Sales FLOAT,
    Quantity INT,
    Discount FLOAT,
    Profit FLOAT
);

Select * from Orders;

--Remove Duplicates
DELETE FROM Orders
WHERE OrderID IN(
	SELECT OrderID FROM Orders
	GROUP BY OrderID HAVING COUNT(*) > 1
);

--Standardize Text
UPDATE Orders
SET City = UPPER(City);

/*Aggregate Functions
Average Sales and Maximum Profit
*/
SELECT AVG(Sales) AS AvgSales , MAX(Profit)AS MaxProfit
FROM Orders;

--Total Sales by Region
SELECT Region,SUM(Sales)AS TotalSales
FROM Orders
GROUP BY Region
ORDER BY TotalSales DESC;

--Most Profitatable Products
SELECT ShipMode ,SUM(Sales) as TotalProfit
FROM Orders
GROUP BY ShipMode
ORDER BY TotalProfit Desc;

--Monthly Sales Trend
SELECT FORMAT(OrderDate,'MM')AS SalesMonth ,SUM(Sales)AS TotalSales
FROM Orders
GROUP BY FORMAT(OrderDate,'MM')
ORDER BY SalesMonth;

/*CTE 
Top 5 Profitable Cities
*/
WITH CityProfit AS (
	SELECT City,SUM(Profit)  AS TotalProfit
	from Orders
	GROUP BY City
)
SELECT TOP 5 * FROM CityProfit
ORDER BY TotalProfit DESC;


--CTE for Yearly Sales
WITH YearlySales AS (
	SELECT FORMAT(OrderDate,'yyyy')AS Year,SUM(Sales) AS TotalSales
	FROM Orders
	GROUP BY FORMAT(OrderDate,'yyyy')
)
SELECT * FROM YearlySales ORDER BY TotalSales DESC;


/*window function
Rank Sales by Profiit
*/
SELECT OrderID,CustomerName,Sales,
	RANK() OVER(ORDER BY Profit DESC)AS SalesRank
FROM Orders;
 
--Running Total Sales by Region
SELECT Region,OrderDate,Sales,
	SUM(Sales) OVER (PARTITION BY Region ORDER BY OrderDate)AS RunningTotal
FROM Orders;

/*Data Type Conversion */
SELECT OrderID ,CustomerName,
	CAST(Sales AS INT) AS SalesInt
FROM Orders;

/* Creating Views */
CREATE VIEW HighSalesOrders AS
SELECT OrderID, CustomerName,Sales,Profit
FROM Orders
WHERE Sales>1000;

SELECT * FROM HighSalesOrders ORDER BY Sales DESC;
