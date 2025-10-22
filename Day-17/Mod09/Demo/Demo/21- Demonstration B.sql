-- Demonstration B

-- Step 1: Using GROUP BY
-- Change to AdventureWorks database
USE AdventureWorks;
GO

-- Step 2a: Using GROUP BY
-- Select this query and execute it to
-- show orders by Sales Person from low to high count
-- (this is the source data before groups created)
SELECT SalesPersonID, COUNT(*) AS Total_Orders
FROM Sales.SalesOrderHeader
GROUP BY SalesPersonID
ORDER BY Total_Orders asc;


SELECT SalesPersonID,  COUNT(*) AS Total_Orders
FROM Sales.SalesOrderHeader
group by SalesPersonID

ORDER BY Total_Orders asc;



-- Step 2b: Select this query and execute it to
-- show customer orders per customer and per year 
-- for Sales Person 285 (per previous query)
SELECT CustomerID, YEAR(OrderDate) AS [year], COUNT(*) AS Total_Orders
FROM Sales.SalesOrderHeader
WHERE SalesPersonID = 285
GROUP BY CustomerID, YEAR(OrderDate);

select CustomerID, year(OrderDate),  Count(*) 
from Sales.SalesOrderHeader soh
where SalesPersonID = 285
group by CustomerID, year(OrderDate)



select A.cust_id, A.order_year, B.total_sales
from 
(
select	CustomerID as cust_id, 
		year(OrderDate)  as order_year 
from Sales.SalesOrderHeader
where SalesPersonID = 285
group by CustomerID, year(OrderDate)
) as A, 

(
select   
	sum(unitprice * orderqty )  as total_sales
from [Sales].[SalesOrderDetail] sod
where   salesorderid in 
			(select salesorderid  from Sales.SalesOrderHeader
			where SalesPersonID = 285
			)
) as B








select * from [Sales].[SalesOrderDetail] sod





-- Step 3: Workflow of grouping
-- Source queries for workflow slide:
SELECT SalesOrderID, SalesPersonID, CustomerID
FROM Sales.SalesOrderHeader;

SELECT SalesOrderID, SalesPersonID, CustomerID
FROM Sales.SalesOrderHeader
WHERE CustomerID IN (29777, 30010);

SELECT SalesPersonID, COUNT(*)
FROM Sales.SalesOrderHeader
WHERE CustomerID IN (29777, 30010)
GROUP BY SalesPersonID;

-- Step 4a: Using Aggregates with GROUP BY
-- Show an aggregate on the column used to group
SELECT CustomerID, COUNT(*) AS Total_Orders
FROM Sales.SalesOrderHeader
GROUP BY CustomerID;

-- Step 4b: Show an aggregate on a column not in GROUP BY list
SELECT ProductID, MAX(OrderQty) AS largest_order
FROM Sales.SalesOrderDetail
GROUP BY productid;