-- Demonstration B

-- Step 1:
-- Switch the query window to use your copy of the AdventureWorksLT database

-- Step 2: Use collation in a query
SELECT CustomerId, LastName 
FROM SalesLT.Customer
WHERE LastName COLLATE Latin1_General_CS_AS = N'Miller';

-- Step 3a: Use a case sensitive collation in a query
SELECT CustomerId, LastName 
FROM SalesLT.Customer
WHERE LastName COLLATE Latin1_General_BIN = N'miller';
-- NOTE: this will return no results

-- Step 3b:
SELECT CustomerId, LastName 
FROM SalesLT.Customer
WHERE LastName COLLATE Latin1_General_BIN = N'Miller';
-- NOTE: the change in this query from the previous query is the case of the search term

-- Step 4: Using the CONCAT function to join strings
SELECT CustomerId, FirstName, MiddleName, LastName, 
CONCAT(LastName, N', ' + FirstName, N' ', MiddleName) AS FullName
FROM SalesLT.Customer;

-- Step 5: Use concatenation with + (plus) in a query
SELECT CustomerId, FirstName, MiddleName, LastName, 
FirstName + N' ' + LastName AS FullName
FROM SalesLT.Customer;

-- Step 6: Use string functions in a query
-- FORMAT
declare @my_name varchar(10) = 'Sadeed'


declare @my_title varchar(20) = 'CEO'
select * from tsql.HR.Employees
where title =  @my_title


DECLARE @m money = 120.595
SELECT @m AS unformatted_value, 
FORMAT(@m,'C','zh-cn') AS zh_cn_currency,
FORMAT(@m,'C','en-us') AS en_us_currency,
FORMAT(@m,'C','de-de') AS de_de_currency;
-- end FORMAT example


declare @my_name as varchar(20) = 'FaIsAl'
select upper(@my_name), lower(@my_name)

select 'abc', '123', '01/26/2025'


SELECT FORMAT(cast('08/10/2024' as date ), 'd', 'en-US') AS 'US English',
       FORMAT(cast('08/10/2024' as date ), 'd', 'en-gb') AS 'British English',
       FORMAT(cast('08/10/2024' as date ), 'd', 'de-de') AS 'German',
       FORMAT(cast('08/10/2024' as date ), 'd', 'zh-cn') AS 'Chinese Simplified (PRC)';



DECLARE @d AS DATE = '08/10/2024';

SELECT FORMAT(@d, 'd', 'en-US') AS 'US English',
       FORMAT(@d, 'd', 'en-gb') AS 'British English',
       FORMAT(@d, 'd', 'de-de') AS 'German',
       FORMAT(@d, 'd', 'zh-cn') AS 'Chinese Simplified (PRC)';

SELECT FORMAT(@d, 'D', 'en-US') AS 'US English',
       FORMAT(@d, 'D', 'en-gb') AS 'British English',
       FORMAT(@d, 'D', 'de-de') AS 'German',
       FORMAT(@d, 'D', 'zh-cn') AS 'Chinese Simplified (PRC)';



SELECT SUBSTRING('Microsoft SQL Server',11,3) AS Result;

SELECT LEFT('Microsoft SQL Server',9) AS left_example, RIGHT('Microsoft SQL Server',6) as right_example;

SELECT LEN('Microsoft SQL Server') AS [LEN];

SELECT LEN('   Microsoft SQL Server     ') AS [LEN];

SELECT DATALENGTH('Microsoft SQL Server     ') AS [DATALENGTH];

SELECT CHARINDEX('SQL','Microsoft SQL Server') AS Result;


select replace('','','')

SELECT REPLACE('Learning about T-SQL string functions','T-SQL','Transact-SQL') AS Result;

SELECT UPPER('Microsoft SQL Server') AS UP, LOWER('Microsoft SQL Server') AS LOW;

-- Step 7: Use the LIKE predicate in a query - the % (percent) character
SELECT AddressID, CountryRegion
FROM SalesLT.Address
WHERE CountryRegion LIKE N'United%'

select * from tsql.HR.Employees as e
where e.firstname like 'S%'


select len('1211-5656-3655-2113')

select REPLICATE('*', len('1211-5656-3655-2113')-4)

declare @cc as varchar(20) = '1211-5656-3655-2113'

select  REPLICATE('*', len(@cc)-4)+ right(@cc,4 )as credit_card



