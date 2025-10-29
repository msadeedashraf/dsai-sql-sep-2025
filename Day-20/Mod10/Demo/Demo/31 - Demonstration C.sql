--  Demonstration C

--  Step 1: Open a new query window to the TSQL database
USE TSQL;
GO

-- Step 2: Using EXISTS
-- Select this query and execute it to show
-- any customer who placed an order
SELECT custid, companyname
FROM Sales.Customers AS c
WHERE EXISTS (
	SELECT * 
	FROM Sales.Orders AS o
	WHERE c.custid=o.custid);

-- Step 3: Using NOT EXISTS	
-- Return any customer who has not placed an order
SELECT custid, companyname
FROM Sales.Customers AS c
WHERE NOT EXISTS (
	SELECT * 
	FROM Sales.Orders AS o
	WHERE c.custid=o.custid);

--Show the top-paid employee in each department.
SELECT e.EmployeeID, e.FirstName, e.LastName, e.DepartmentID, e.Salary
FROM Employees e
WHERE e.Salary = (
    SELECT MAX(Salary)
    FROM Employees e2
    WHERE e2.DepartmentID = e.DepartmentID
);

	
-- Step 4a: Compare COUNT(*)>0 to EXISTS:
-- Use COUNT(*) > 0
SELECT empid, lastname
FROM HR.Employees AS e		
WHERE (SELECT COUNT(*)
		FROM Sales.Orders AS O
		WHERE O.empid = e.empid)>50;

-- Step 4b: Use EXISTS
SELECT empid, lastname
FROM HR.Employees AS e
WHERE EXISTS(	SELECT * 
		FROM Sales.Orders AS O
		WHERE O.empid = e.empid);		

/*
Correlated subqueries are evaluated once per row in the outer query ? can be slower for large datasets.

Often can be rewritten as a JOIN or window function for better performance.

Still very useful for readability and logic clarity in moderate-size queries.
*/