-- Demonstration D - Use the AdventureWorksLT database on SQL Azure

-- Step 1: Connect to the AdventureWorksLT database
-- The USE statement is not currently compatible with SQL Azure databases.
-- Instead, select AdventureWorksLT from the Available Databases list


-- Step 2: Simple CASE Expression
-- Select and execute the following query to show the use of a simple CASE expression
-- to convert values in a flag-type column to a label.
use AdventureWorksLT2022

SELECT ProductNumber, Name, ListPrice,
	
	CASE  size 
		WHEN 'S' THEN 'Small'
		WHEN 'M' THEN 'Medium'
		WHEN 'L' THEN 'Large' 
		WHEN 'XL' THEN 'Extra Large' 		
		else size
	END AS Size
	
FROM SalesLT.Product;


SELECT ProductNumber, Name, ListPrice,
	
	CASE 
		when Size is null then 'N-A'
		WHEN Size = 'S' THEN 'Small'
		WHEN Size= 'M' THEN 'Medium'
		WHEN Size= 'L' THEN 'Large' 
		WHEN Size= 'XL' THEN 'Extra Large' 		
		else size
	END AS Size
	
FROM SalesLT.Product;


-- Step 3: Simple CASE Expression
-- Select and execute the following query to show the use of a simple CASE expression
-- to replace an id with a name. Point out that a JOIN to a reference table will be 
-- a better solution.
SELECT 
	ProductNumber, 
	Name, 
	ProductCategoryID, 
	CASE 
		ProductCategoryID 
			WHEN 5 THEN 'Mountain Bikes' 
			WHEN 6 THEN 'Road Bikes' 
			WHEN 7 THEN 'Touring Bikes' 
			ELSE 'Bike Accessories' 
	END AS Category 
FROM SalesLT.Product;

SELECT 
	p.ProductNumber, 
	p.Name, 
	p.ProductCategoryID,
	pc.Name as Category	
FROM 
	SalesLT.Product p  
		inner join 
	SalesLT.ProductCategory pc
on p.ProductCategoryID = pc.ProductCategoryID;


select 
	e.first_name, 
	e.last_name, 
	e.department_id, 
	e.hire_date ,
	CASE 
		e.department_id
			WHEN cast(6 as char(2)) THEN 'IT'
			WHEN cast(8 as char(5))  THEN 'Sales'
			WHEN cast(9 as char(9))  THEN 'Executive'
			WHEN cast(10 as char(7))  THEN 'Finance'
			else
			cast(e.department_id as char(20))
	end  as department_name
from hr.dbo.Employees as e


select 
	e.first_name, 
	e.last_name, 
	e.department_id, 
	e.hire_date ,
	CASE 
		e.department_id
			WHEN 6 THEN 'IT'
			WHEN 8 THEN 'Sales'
			else
			'HR'
	end  as department_name
from hr.dbo.Employees as e



--SQL92
select 
	e.first_name, 
	e.last_name, 
	e.department_id, 
	e.hire_date ,
	d.department_name  as department_name
from hr.dbo.Employees as e inner join 
hr.dbo.departments as d
on e.department_id = d.department_id


--SQL89
select 
	e.first_name, 
	e.last_name, 
	e.department_id, 
	e.hire_date ,
	d.department_name  as department_name
from hr.dbo.Employees as e , hr.dbo.departments as d
where e.department_id = d.department_id


--SQL92
select 
	e.first_name, 
	e.last_name, 
	e.department_id, 
	e.hire_date ,
	d.department_name  as department_name,
	l.city
from hr.dbo.Employees as e inner join 
hr.dbo.departments as d
on e.department_id = d.department_id
inner join [hr].[dbo].[locations] as l
on d.location_id = l.location_id


--SQL89
select 
	e.first_name, 
	e.last_name, 
	e.department_id, 
	e.hire_date ,
	d.department_name  as department_name,
	l.city
from 
hr.dbo.Employees as e , 
hr.dbo.departments as d,
[hr].[dbo].[locations] as l
where 
	e.department_id = d.department_id
	and d.location_id = l.location_id




