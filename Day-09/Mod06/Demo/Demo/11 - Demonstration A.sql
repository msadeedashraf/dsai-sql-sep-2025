-- Demonstration A

-- Step 1: 
-- Switch the query window to use your copy of the AdventureWorksLT database

-- Step 2: Use implicit conversion in a query
-- Demonstrate implicit conversion from the lower type (varchar)
-- to the higher (int)
SELECT 1 + 2 AS result;

SELECT '1' + '2' AS result;

select e.firstname + e.lastname from tsql.hr.Employees e

SELECT '1' + cast('2'  as int)  AS result;

-- Step 3: Use implicit conversion in a query
-- Demonstrate implicit conversion from the lower type (varchar) 
-- to the higher (int)
-- NOTE: THIS WILL FAIL

SELECT 1 + 'abc' AS result;

SELECT '1' + 'abc' AS result;

SELECT trim(cast(1 as char)) + 'abc' AS result;

select  '    Sadeed       ' as name
select  trim('    Sadeed       ') as name

select getdate() 

select upper('sadeed')

select lower('SADEED')

/*
This kfdslkfjkjdsk
fsdlk;lfk;sdl
fsdlk;lfkdsa
lksadfkl;k

*/
select 
	SUBSTRING(e.lastname, 1,4), 
	upper(e.firstname)
from tsql.hr.Employees e

select concat(e.firstname, ' * ', e.lastname) as [Full Name]
from tsql.hr.Employees e






-- Step 4: Use explicit conversion in a query

SELECT CAST(1 AS VARCHAR(10)) + 'abc' AS result;
