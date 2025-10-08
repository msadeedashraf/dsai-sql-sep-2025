---------------------------------------------------------------------
-- LAB 03
--
-- Exercise 4
---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 1
-- Write a SELECT statement to display the categoryid and productname columns from the Production.Products table.
---------------------------------------------------------------------

select p.categoryid, p.productname from Production.Products as p

---------------------------------------------------------------------
-- Task 2
-- Enhance the SELECT statement in task 1 
--by adding a CASE expression that generates 
--a result column named categoryname. 
--The new column should hold the translation 
--of the category ID to its respective 
--category name, based on the mapping 
--table supplied earlier. 
--Use the value “Other” for any 
---category IDs not found in the mapping table.
---------------------------------------------------------------------

select p.*,
	case p.categoryid 
		when	1 then	'Beverages'
		when	2 then	'Condiments'
		when	3 then	'Confections'
		when	4 then	'Dairy Products'
		when	5 then	'Grains/Cereals'
		when	6 then	'Meat/Poultry'
		when	7 then	'Produce'
		when	8 then	'Seafood'
		--else cast(p.categoryid as char(2))
		else 'Others'
	end as categoryname
from Production.Products as p







---------------------------------------------------------------------
-- Task 3
-- Modify the SELECT statement in task 2 by adding 
--a new column named iscampaign. 
--This will show the description 
--“Campaign Products” for the categories Beverages,
--Produce, and Seafood and the description 
--“Non-Campaign Products” 
--for all other categories.
---------------------------------------------------------------------


select p.*,
	case p.categoryid 
		when	1 then	'Beverages'
		when	2 then	'Condiments'
		when	3 then	'Confections'
		when	4 then	'Dairy Products'
		when	5 then	'Grains/Cereals'
		when	6 then	'Meat/Poultry'
		when	7 then	'Produce'
		when	8 then	'Seafood'
		--else cast(p.categoryid as char(2))
		else 'Others'
	end as categoryname,

	case 
	when p.categoryid in (1,7,8) then 'Campaign Products' 
	else
	'Non-Campaign Products'
	end as iscampaign

from Production.Products as p