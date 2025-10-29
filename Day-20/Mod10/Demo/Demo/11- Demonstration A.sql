-- Demonstration A

-- Step 1: Open a new query window to the TSQL database
USE TSQL;
GO

-- Step 2: Scalar subqueres:
-- Select this query and execute it to
-- obtain most recent order
SELECT MAX(orderid) AS lastorder
FROM Sales.Orders;


select top(1) orderid 
from Sales.Orders 
order by 1 desc



-- Step 3: Select this query and execute it to
-- find details in Sales.OrderDetails
-- for most recent order
SELECT orderid, productid, unitprice, qty
FROM Sales.OrderDetails
WHERE orderid = 11077

SELECT  sum(qty)
FROM Sales.OrderDetails
WHERE orderid = 11077


SELECT orderid, productid, unitprice, qty
FROM Sales.OrderDetails
WHERE orderid =
	(SELECT MAX(orderid) AS lastorder
	FROM Sales.Orders);

-- Step 4: THIS WILL FAIL, since
-- subquery returns more than 
-- 1 value
SELECT orderid, productid, unitprice, qty
FROM Sales.OrderDetails
WHERE orderid = 
	(SELECT orderid AS O
	FROM Sales.Orders
	WHERE empid =2);

SELECT orderid, productid, unitprice, qty
FROM Sales.OrderDetails
WHERE orderid  in (10265,10277)

SELECT orderid, productid, unitprice, qty
FROM Sales.OrderDetails
WHERE orderid  in (SELECT orderid AS O
	FROM Sales.Orders
	WHERE empid =2);


SELECT orderid, productid, unitprice, qty
FROM Sales.OrderDetails
WHERE orderid  = 10265 
	or orderid  = 10277
	or orderid  = 10280
	or orderid  = 10295

/*
--In Oracle
SELECT orderid, productid, unitprice, qty
FROM Sales.OrderDetails od
WHERE (orderid, productid ) = (10265 , 17)
*/

SELECT orderid, productid, unitprice, qty
FROM Sales.OrderDetails od
WHERE orderid =10265  
and productid = 17


-- Step 5: Multi-valued subqueries 
-- Select this query and execute it to	
-- return order info for customers in Mexico

select sum(unitprice*qty) Total_sales from Sales.OrderDetails od
where od.orderid in (  SELECT orderid
						FROM Sales.orders
						WHERE custid IN  (
										SELECT custid
										FROM Sales.Customers
										WHERE country = N'Mexico'
										)
					);


select sum(unitprice*qty) Total_sales 
	from  
		Sales.orders as o
	inner join 
		Sales.Customers as c
	on o.custid = c.custid
	inner join 
		Sales.OrderDetails as od
	on od.orderid = o.orderid
where 
	c.country = 'Mexico'


select c.country,  sum(unitprice*qty) Total_sales 
	from  
		Sales.orders as o
	inner join 
		Sales.Customers as c
	on o.custid = c.custid
	inner join 
		Sales.OrderDetails as od
	on od.orderid = o.orderid
group by c.country 




select sum(unitprice*qty) Total_sales 
	from  
		Sales.orders as o
	inner join 
		Sales.Customers as c
	on o.custid = c.custid
	inner join 
		Sales.OrderDetails as od
	on od.orderid = o.orderid
where 
	c.country = 'Mexico'









-- Step 6: Same result expressed as a join:
SELECT c.custid, o.orderid
FROM Sales.Customers AS c JOIN Sales.Orders AS o
ON c.custid = o.custid
WHERE c.country = N'Mexico';
