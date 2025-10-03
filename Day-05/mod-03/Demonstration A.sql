-- Demonstration A - Use the AdventureWorksLT database on SQL Azure

-- Step 1: Connect to the AdventureWorksLT database
-- The USE statement is not currently compatible with SQL Azure databases.
-- Instead, select AdventureWorksLT from the Available Databases list

use AdventureWorksLT2022

-- Step 2: Simple SELECT query
-- Select and execute the following query to retrieve all columns, 
-- all rows from SalesLT.ProductCategory table
SELECT *
FROM SalesLT.ProductCategory;

select * from [HR].[EMPLOYEES]

select * from employees

select * from saleslt.product

select * from [hr].[dbo].[countries]

select * from tsql.[Sales].[Customers]

select * FROM [AdventureWorksLT2022].[SalesLT].[Address]

select * from DB_NAME.SCHEMA.TABLE

select * from table_name



-- Step 3: Simple SELECT query
-- Select and execute the following query to retrieve all columns, 
-- all rows from SalesLT.ProductCategory table without using *
SELECT 
ProductCategoryID, ParentProductCategoryID, Name, rowguid, ModifiedDate
FROM SalesLT.ProductCategory;

select 
	empid, 
	firstname, 
	lastname, 
	hiredate 
from hr.EMPLOYEES

select 
e.firstname, e.lastname, e.city, e.birthdate
from hr.EMPLOYEES as e

select e.* from hr.employees e

select e.firstname, e.country from hr.employees e

select l.firstname, l.country from hr.employees l

select 
	e.firstname + ' '+  e.lastname AS FullName
from TSQL.hr.EMPLOYEES as e

select 
	e.firstname + ' '+  e.lastname AS "Full Name"
from TSQL.hr.EMPLOYEES as e

select 
	e.firstname + ' '+  e.lastname AS [Full Name]
from TSQL.hr.EMPLOYEES as e



-- Step 4: Simple SELECT query
-- Select and execute the following query to retrieve only ProductNumber, 
-- Name, Color, ListPrice columns from the SalesLT.Product table
SELECT ProductNumber, Name, Color, ListPrice
FROM SalesLT.Product;
  

-- Step 5: Simple SELECT query
-- Select and execute the following query to retrieve only Title, FirstName,
-- LastName, CompanyName, EmailAddress columns from the SalesLT.customer table
SELECT Title, FirstName, LastName, CompanyName, EmailAddress
FROM SalesLT.customer;


-- Step 6: Simple SELECT query with calculated column
-- Select and execute the following query to manipulate columns from SalesLT.Product table. 
-- Note the lack of name for the new calculated column.
SELECT ProductID, Name, ListPrice, (ListPrice * 1.1)
FROM SalesLT.Product;


-- Step 7: Simple SELECT query with calculated column
-- Select and execute the following query to manipulate columns from the Sales.OrderDetails table. 
-- Note the lack of name for the new calculated column.
SELECT SalesOrderID, ProductID, UnitPrice, OrderQty, (UnitPrice * OrderQty)
FROM SalesLT.SalesOrderDetail;