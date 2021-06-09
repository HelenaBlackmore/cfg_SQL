-- ****************** in built functions********************************
-- STRINGS
	-- length, concat, LOWER, UPPER, SUBSTR, SELECT LEFT(column, n), SELECT RIGHT(), TRIM(), LTRIM,RTRIM, 
	-- REVERSE, STROMP

-- NUMERIC
	-- ROUND, RAND, ABS, CEILING, FLOOR, PI, POW , SQRT 

-- DATE
	-- CURDATE, CURTIME, NOW(), CURRENT_TIMESTAMP, ADDDATE, SUBDATE, CONVERT

-- IF statements
	-- IF (condition, then, otherwise)
    
-- CASE operator (for multiple IF ELSE statements)

-- TRANSACTIONS

START TRANSACTION ;
SELECT booking_num FROM bookings


COMMIT;

-- Our SQL transaction needs to do the  following: 
-- check that the balance of the first account is greater than £50. 
-- Deduct £50 from the first account.
-- Add £50 to the second account

CREATE DATABASE bank;
USE bank;

CREATE TABLE accounts_table 
(account_num INTEGER NOT NULL,
first_name VARCHAR(34) NOT NULL,
surname VARCHAR(23) NOT NULL,
balance DECIMAL,
overdraft BOOLEAN);

INSERT INTO accounts_table (account_num, first_name, surname, balance, overdraft)
VALUES (123456, 'Helena', 'Blackmore', 456.90, FALSE),
		(98765, 'Dennis', 'Blackmore', 67.00, TRUE),
        (654377, 'Hannah', 'Smith', 345.00, FALSE);
        
START TRANSACTION;

SELECT
@moneyAvailable:= IF (balance>50, balance, 0) AS MONEY
FROM accounts_table
	WHERE account_num = 123456
		AND surname = 'Blackmore';
------------------------------------------------------
SET @Transferamount=50;
----------------------------------------------------
UPDATE accounts_table
		SET balance = balance + 50
			WHERE account_num = 98765
			AND surname = 'Blackmore';

UPDATE accounts_table
	SET balance = balance -50
		WHERE account_num =123456
		AND SURNAME = 'Blackmore';
        	
COMMIT;

SELECT * FROM accounts_table;

-- table locking