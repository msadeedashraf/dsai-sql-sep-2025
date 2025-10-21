--  Demonstration D

--  Step 1: Open a new query window to the TSQL database
USE TSQL;
GO

-- Step 2: Join 2 tables
-- Select and execute the following query
-- to display all employees with managers
-- and the manager's ID and name.


select * from hr.Employees e

select * into hr.managers
from (
select e.empid as manager_id , 
concat(e.firstname , ' ', e.lastname) as Manager_name
from hr.employees e
where e.empid in (select distinct e.mgrid  from hr.Employees e	where mgrid is not null )
) as A

select * from hr.Employees e
select * from hr.managers

select e.firstname + ' ' + e.lastname as EmployeeName ,
		m.Manager_name	
from 
	hr.Employees e
	inner join 
	hr.managers m
on e.mgrid = m.manager_id



select e.firstname + ' ' + e.lastname as EmployeeName ,
		m.Manager_name	
from 
	hr.Employees e
	inner join 
	hr.managers m
on e.mgrid = m.manager_id


select e.firstname + ' ' + e.lastname as EmployeeName ,
		m.Manager_name	
from 
	hr.Employees e
	left outer join 
	hr.managers m
on e.mgrid = m.manager_id

Drop table hr.managers




select 
e.firstname + ' ' + e.lastname as EmployeeName ,
m.firstname + ' ' + m.lastname as ManagerName 
from hr.Employees as E
inner join hr.Employees as M
on e.mgrid = m.empid



select 
e.firstname + ' ' + e.lastname as EmployeeName ,
m.firstname + ' ' + m.lastname as ManagerName 
from hr.Employees as E
left outer join hr.Employees as M
on e.mgrid = m.empid



 SELECT e.empid ,e.lastname as empname,e.title,e.mgrid, m.lastname as mgrname
  FROM HR.Employees AS e
  JOIN HR.Employees AS m
  ON e.mgrid=m.empid;

-- Step 3: Join 2 tables
-- Select and execute the following query
-- to display all employees 
-- and the manager's ID and name.
  SELECT e.empid ,e.lastname as empname,e.title,e.mgrid, m.lastname as mgrname
  FROM HR.Employees AS e
  LEFT OUTER JOIN HR.Employees AS m
  ON e.mgrid=m.empid;
  
-- Step 4: Cross Join 2 tables
-- Select and execute the following query
-- to generate all combinations of first and last
-- names from the HR.Employees table
SELECT e1.firstname, e2.lastname
FROM HR.Employees AS e1 CROSS JOIN HR.Employees AS e2;
