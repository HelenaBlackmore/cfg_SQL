-- view = virtual table
	-- results of a query
    -- slect sattement stored as an object

-- create a table amd then create a view without salary column

USE shop;

USE customers;

SELECT * FROM customers.sales1;

CREATE VIEW VWSalesman
AS
SELECT Salesperson, SalesAmount
	FROM Sales1;
    
SELECT * FROM VWSalesman;

-- query a view just as a table

SELECT DISTINCT Salesperson FROM VWSalesman;

CREATE DATABASE practice;

USE practice;

-- stored procedure

