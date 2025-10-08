-- Demonstration A
-- Step 1: Connect to the AdventureWorksLT database
-- Prepare the environment by running the following query (without this, all order dates are the same)
UPDATE SalesLT.SalesOrderHeader 
SET	OrderDate = DATEADD(d,SalesOrderID % 7000, '2008-06-01'),
	ShipDate = DATEADD(d,7 + (SalesOrderID % 7000), '2008-06-08'),
	DueDate = DATEADD(d,14 + (SalesOrderID % 7000), '2008-06-13');

-- Step 2: Use ORDER BY to sort results 
-- Sorting by column name
SELECT top 1 SalesOrderID, CustomerID, OrderDate
FROM SalesLT.SalesOrderHeader
ORDER BY OrderDate desc;

-- Step 3: Use ORDER BY to sort results
-- Sorting by column alias name
SELECT 
	SalesOrderID, 
	CustomerID, 
	MONTH(OrderDate) AS ordermonth,
	YEAR(OrderDate) as OrderYear
FROM SalesLT.SalesOrderHeader
ORDER BY ordermonth DESC;

select * from tsql.hr.Employees
order by hiredate desc

select * from tsql.hr.Employees
order by birthdate DESC


select 
	E.firstname, E.hiredate, E.birthdate 
from tsql.hr.Employees E
order by 2 DESC

-- Step 4: Use ORDER BY to sort results
-- Sorting by column name in descending order
SELECT SalesOrderID, CustomerID, OrderDate
FROM SalesLT.SalesOrderHeader
ORDER BY OrderDate DESC;

-- Step 5: Use ORDER BY to sort results
-- Changing sort order for multiple columns




SELECT  CONVERT(varchar(10), ModifiedDate, 105) MY_DATE, CustomerID, CompanyName
FROM SalesLT.Customer
ORDER BY MY_DATE DESC, CustomerID ASC;


SELECT  
CONVERT(varchar(10), GETDATE(), 110) MY_time 


SELECT  
CONVERT(varchar(10), ModifiedDate, 105) MY_DATE, 
CONVERT(varchar(10), ModifiedDate, 108) MY_time, 
CustomerID, 
CompanyName
FROM SalesLT.Customer
ORDER BY MY_DATE DESC, CustomerID ASC;


-- Step 6: Revert the changes made to date columns
UPDATE SalesLT.SalesOrderHeader 
SET OrderDate = '2008-06-01', 
	ShipDate = '2008-06-08',
	DueDate = '2008-06-13';
