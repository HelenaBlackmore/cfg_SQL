-- Create a new database called SHOP 
CREATE DATABASE SHOP;

-- Add a new table called SALES1.

CREATE TABLE SALES1
(Store varchar(50) NOT NULL,
Week INT NOT NULL,
Day VARCHAR(50) NOT NULL,
Salesperson VARCHAR(20) NOT NULL,
SalesAmount FLOAT NOT NULL,
Month VARCHAR(5) NOT NULL);

INSERT INTO SALES1 
(Store, Week, Day, Salesperson, SalesAmount, Month)
VALUES
('London', 2, 'Monday', 'Frank', 56.25,'May'),
('London', 5, 'Tuesday', 'Frank', 74.32, 'Sep'),
('London', 5, 'Monday', 'Bill', 98.42, 'Sep'),
('London', 5, 'Saturday', 'Bill', 73.90,'Dec'),
('London', 1, 'Tuesday', 'Josie', 44.27,'Sep'),
('Dusseldorf', 4, 'Monday', 'Manfred', 77.00, 'Jul'),
('Dusseldorf', 3, 'Tuesday', 'Inga', 9.99,'Jun'),
('Dusseldorf', 4, 'Wednesday', 'Menfred', 86.81, 'Jul'),
('London', 6,'Friday','Josie', 74.02, 'Oct'),
('Dusseldorf', 1, 'Saturday', 'Manfred', 43.11, 'Apr');

-- practice with select, select distinct and where
SELECT * FROM SALES1;
SELECT DISTINCT s.STORE FROM SALES1 s;
SELECT s.Salesperson FROM SALES1 s WHERE Month = 'May';

USE customers;
SELECT * FROM SALES1
LIMIT 3;

SELECT * FROM SALES1 
	WHERE MONTH != 'Dec' AND Store= 'London' AND (Salesperson = 'Frank' OR Salesperson= 'Bill') AND SalesAmount > 20;
    
SELECT Week, 
	COUNT(*) FROM SALES1 GROUP BY Week;
    
SELECT Week, 
	COUNT(*) FROM SALES1 GROUP BY Week
    ORDER BY week;
    
SELECT Week, 
	COUNT(*) FROM SALES1 GROUP BY Week
    ORDER BY week DESC;
    
SELECT Week, Day, 
	COUNT(*) FROM SALES1 
	GROUP BY Week
    ORDER BY Week;
    
USE customers;
UPDATE SALES1
	SET Salesperson='Anette'
	WHERE Salesperson='Inga';
USE customers;

-- Find out how many sales did Annete do
SELECT SUM(SalesAmount) as 'total sales', SalesPerson AS 'name' 
	FROM SALES1
	WHERE Salesperson= 'Anette';
   -- the result comes out weird 

SELECT * FROM SALES1
WHERE Salesperson= 'Anette';
-- Find the total sales amount by each person by day

SELECT Salesperson AS 'name', SUM(SalesAmount) AS 'total', day
	FROM SALES1
    GROUP BY Salesperson, day;
    
--  How much (sum) each person sold for the given period

SELECT Salesperson AS 'name', SUM(SalesAmount) AS 'total'
	FROM SALES1
    GROUP BY Salesperson;

-- How much (sum) each person sold for the given period
-- including the number of sales per person, average , min and max sale

SELECT Salesperson AS 'name',
	   SUM(SalesAmount) AS 'total',
       AVG(SalesAmount) AS 'average',
       MIN(SalesAmount) AS 'lowest sale',
       MAX(SalesAmount) AS 'highest sale'
	FROM SALES1
    GROUP BY Salesperson
    ORDER BY SUM(SalesAmount) DESC;
    
-- Find the total monetary sales amount achieved by each store

SELECT Store, SUM(SalesAmount) AS 'total'
	FROM SALES1
    GROUP BY Store
    ORDER BY SUM(SalesAmount) DESC;
    
-- Find the number of sales by each person if they did less than 3 sales for the past period

SELECT Salesperson AS 'name', COUNT(*) AS 'number of sales'
	FROM SALES1
    GROUP BY Salesperson
	HAVING COUNT(*) < 3;
    
-- Find the total amount of sales by month where combined total
-- is less than £100

SELECT  Month,
		SUM(SalesAmount) AS 'total'
	FROM SALES1
	GROUP BY month
    HAVING SUM(SalesAmount) < 100
    ORDER by Month DESC;
	   
    
-- 