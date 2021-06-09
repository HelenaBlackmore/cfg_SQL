-- •Design and create a relational normalised database called customers.
-- •Set reasonable primary keys to the tables. 
-- •Set NOT NULL constraints on the columns that you think must have values.
USE customers;

DROP TABLE address;
DROP TABLE customers;

CREATE TABLE names (
id INT PRIMARY KEY,
name VARCHAR(20) NULL,
surname VARCHAR(20) NOT NULL,
email VARCHAR(50) NULL);


CREATE TABLE contacts (
c_id INT PRIMARY KEY,
address_firstline VARCHAR(30) NOT NULL,
address_secondline VARCHAR(50) NULL,
postcode VARCHAR(8) CHECK ( 5 < CHAR_LENGTH(postcode) <8),
CONSTRAINT PK_id FOREIGN KEY  contacts(c_id) REFERENCES customers(id) );

CREATE TABLE orders (
o_id VARCHAR(20) NOT NULL,
id VARCHAR(20) NOT NULL,
no_orders INT NULL,
usual VARCHAR(30) NULL,
last_order VARCHAR(30) NULL);

USE customers;





INSERT INTO orders 
(o_id, id, no_orders, usual, last_order)
VALUES
('A12', 'B56', 45, 'pizza', 'pizza')





