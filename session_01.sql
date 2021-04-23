CREATE DATABASE food;
USE food;
CREATE TABLE food (
id INT NOT NULL,
vegetables VARCHAR(50) NOT NULL,
fruits VARCHAR(60) NOT NULL,
treats VARCHAR(20) NOT NULL,
price NUMERIC NOT NULL);

CREATE DATABASE cfg;
USE cfg;
CREATE TABLE register(
id INT NOT NULL,
first_name VARCHAR(20) NOT NULL
);
CREATE TABLE jobs(
first_name VARCHAR(20) NOT NULL,
dreamJob VARCHAR(50) NULL
);

SELECT * FROM register;

# inserting some values

INSERT INTO register
(id, first_name)
VALUES
(1, 'Mable'),
(2, 'Helena' ),
(3, 'Charlotte');

SELECT * FROM register;

CREATE DATABASE bakery;
USE bakery;
CREATE TABLE sweet(
id INT NOT NULL,
item_name VARCHAR(50) NOT NULL,
price FLOAT NOT NULL);

CREATE TABLE savoury(
id INT NOT NULL,
item_name VARCHAR(60) NOT NULL,
price FLOAT NOT NULL,
main_ingredient VARCHAR(50) NOT NULL);

INSERT INTO sweet
(id, item_name, price)
VALUES
(1, 'cake', 2.20),
(2, 'chocolate', 1.25 ),
(3, 'pastry', 2.75);

INSERT INTO savoury
(id, item_name, price, main_ingredient)
VALUES
(1, 'pizza', 4.30, 'tomato sauce'),
(2, 'cheese twist', 1.25 , 'cheese'),
(3, 'toastie', 2.75, 'bread');

SELECT * FROM savoury;