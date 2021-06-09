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

SELECT * FROM SALES1;
SELECT DISTINCT STORE FROM SALES1;
