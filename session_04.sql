-- inner join

SELECT * FROM customers c
	INNER JOIN names n
    ON c.id=n.id;
    
-- left outer join

SELECT  c.name, c.email, n.surname FROM customers c
	left outer JOIN names n
    ON c.id=n.id;

-- right outer join
SELECT  c.name, c.email, n.surname FROM customers c
	RIGHT OUTER JOIN names n
    ON c.id=n.id;
-- full outer join - not available in Mysql,use UNION instead
-- *******************************************************************************
--        PRACTICE   
-- *****************************************************************************
CREATE DATABASE JOINS_PRACTICE;

USE JOINS_PRACTICE;

-- Create table 1
CREATE TABLE Table1_fruit_basket
(ID INT, Fruit VARCHAR(50));

INSERT INTO Table1_fruit_basket 
(ID, Fruit)
VALUES
(1, 'pear'),
(2, 'apple'),
(3, 'kiwi'),
(4, 'orange'),
(5, 'banana');


-- Create table 2
CREATE TABLE Table2_fruit_basket
(ID INT, Fruit VARCHAR(50));

INSERT INTO Table2_fruit_basket 
(ID, Fruit)
VALUES
(1, 'pear'),
(2, 'apple'),
(3, 'kiwi'),
(6, 'melon'),
(7, 'peach'),
(8, 'plum');

-- inner join
SELECT t1.*, t2.* FROM table1_fruit_basket t1
	INNER JOIN table2_fruit_basket t2
    ON t1.id=t2.id;
    
-- left outer join
SELECT t1.fruit, t2.fruit FROM table1_fruit_basket t1
	LEFT OUTER JOIN table2_fruit_basket t2
    ON t1.id=t2.id;

-- right outer join

SELECT t1.fruit, t2.fruit FROM table1_fruit_basket t1
	RIGHT OUTER JOIN table2_fruit_basket t2
    ON t1.id=t2.id;
    
-- cross join

SELECT t1.fruit, t2.fruit FROM table1_fruit_basket t1
	CROSS JOIN table2_fruit_basket t2;
    
-- self join

SELECT t1.fruit, t2.fruit FROM table1_fruit_basket t1
	 JOIN table1_fruit_basket t2;
-- *********************************************************
USE JOINS_PRACTICE;

-- Create a Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(55),
    ManagerID INT
);

-- Insert Sample Data
INSERT INTO Employee
(EmployeeID, Name, ManagerID)
VALUES
(1, 'Mike', 3),
(2, 'David', 3),
(3, 'Roger', NULL),
(4, 'Marry',2),
(5, 'Joseph',2),
(7, 'Ben',2);

SELECT * FROM employee;

-- self join

SELECT e1.name AS 'employee name' , e1.name AS 'manager name' FROM Employee e1
	INNER JOIN Employee e2 
     ON e1.ManagerID=e2.employeeID;
     
SELECT e1.name AS 'employee name' , e1.name AS 'manager name' FROM Employee e1
	LEFT JOIN Employee e2 
     ON e1.ManagerID=e2.employeeID;
     
-- union
	-- combining sets of results
    -- joins combine columns, unions combine rows
    -- by default union removes duplicates
    -- no keep duplicates use UNION ALL
USE JOINS_PRACTICE;
SELECT t1.* FROM table1_fruit_basket t1
	UNION 
    SELECT t2.* FROM table2_fruit_basket t2;
    
 SELECT t1.* FROM table1_fruit_basket t1
	UNION ALL
    SELECT t2.* FROM table2_fruit_basket t2;   
-- subquery
	-- must be in parentheses
    -- WHERE, HAVING, SELECT

