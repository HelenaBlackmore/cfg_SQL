-- ***********************************************************************************
-- CORE REQUIREMENTS
-- ************************************************************************************
-- create database and 5+ tables with constraints & relationships:
CREATE DATABASE carbon_footprint;
USE carbon_footprint;

CREATE TABLE foods 
	(id VARCHAR(10) PRIMARY KEY,
    category TEXT(25) NOT NULL,
    co2_eq DECIMAL(4,2),
    cals_per100 DECIMAL(6,1),
    protein DECIMAL(4,1),
    carbs DECIMAL(4,1),
    fat DECIMAL(4,1));
    
CREATE TABLE countries (c_id VARCHAR(10) PRIMARY KEY, 
						country_name VARCHAR(20) NOT NULL, 
                        distance_miles INTEGER);
                        
CREATE TABLE products (p_id VARCHAR(10) PRIMARY KEY, 
					  category SET('meat', 'fish', 'vegeterian', 'plantbased'), 
                      p_name VARCHAR(25) NOT NULL, 
                      weight_g INTEGER NOT NULL, 
                      packaging SET('1_PETE', '2_HDPE', '3_PVC', '4_LDPE', '5_PP', '6_PS', '7_otherplastic', 'paper', 'metal', 'mix', 'none'), 
                      country_code VARCHAR(10) NOT NULL, 
                      price DECIMAL(6,2) NOT NULL,
                      transport SET('air', 'ship', 'drive'),
                      food_code VARCHAR(10),
                      FOREIGN KEY (country_code) REFERENCES countries (c_id),
                      FOREIGN KEY (food_code) REFERENCES foods(id));  

                      
CREATE TABLE customers(customer_id VARCHAR(10) PRIMARY KEY,
					customer_name VARCHAR(25) NOT NULL,
                    customer_surname VARCHAR(25),
                    email VARCHAR(50) CHECK (email LIKE '%@%'),
                    age int CHECK (age>=18),
                    postcode VARCHAR(8) CHECK (7 < LENGTH(postcode) < 8));

CREATE TABLE shops(shop_id VARCHAR(10) PRIMARY KEY, 
					items_total INT CHECK (items_total>0), 
                    customer_id VARCHAR(10),
                    FOREIGN KEY (customer_id) REFERENCES customers(customer_id));
				

CREATE TABLE shops_has_products (shop_id VARCHAR(10), 
								 p_id VARCHAR(10),
                                 FOREIGN KEY (shop_id) REFERENCES shops(shop_id),
                                 FOREIGN KEY (p_id) REFERENCES products(p_id)); 
							
                                 
-- populate tables

INSERT INTO foods (id, category, co2_eq, cals_per100, protein, carbs, fat )
	VALUES(001, 'beef', 60, 169, 23, 0, 8),
		  (002, 'lamb', 24, 250, 21, 0, 18),
          (003, 'cheese',21, 405, 27, 4, 34),
          (004, 'chocolate', 19, 432, 2, 15, 7),
          (005, 'coffee', 17, 250, 0, 1, 0),
          (006, 'pork',7, 120, 20, 0.9, 4),
          (007, 'poultry',6, 160, 18, 0, 10),
          (008, 'olive oil', 6, 884, 0, 0, 100),
          (009, 'farmed fish', 5, 100, 20, 1 , 2),
          (010, 'eggs', 4.5, 140, 12, 0, 10),
          (011, 'rice', 3, 300, 3, 37,0),
          (012, 'wild fish', 3, 100, 20, 1 , 2),
          (013, 'milk', 3, 50, 4, 5, 2),
          (014, 'cane sugar', 3, 387, 0,100,0),
          (018, 'tomatoes',1.4, 15, 1, 2, 1),
          (019, 'corn', 1.0, 90, 2, 15, 1),
          (020, 'soy milk', 0.9, 34, 3,1,2),
          (021, 'peas', 0.9,84, 5, 15,0),
          (022, 'bananas', 0.7, 89, 1, 23,0),
          (023, 'root vegetables', 0.4, 28, 1,6, 0),
          (024, 'apples', 0.4, 52, 0, 14, 0),
          (025, 'citrus fruit', 0.3,39,  0, 10,0),
          (026, 'nuts', 0.3,656, 14, 12, 66 );

ALTER TABLE countries 
			MODIFY country_name VARCHAR(50); --  name of USA is too long, causes problems below
            
INSERT INTO countries (c_id , country_name , distance_miles )
VALUES  ('CHN', 'China', 4846),
		('IND', 'India', 4767),
        ('USA', 'United States of America', 4255),
        ('INA', 'Indonesia', 7313),
        ('PKT', 'Pakistan', 3867),
        ('BRZ', 'Brazil', 5560),
        ('NIG', 'Nigeria', 5245),
        ('BNG', 'Bangladesh', 5036),
        ('RUS', 'Russia', 3501),
        ('JPN', 'Japan', 5731),
        ('MXC', 'Mexico', 5237),
        ('ETH', 'Ethiopia', 3981),
        ('PHL', 'Philipines', 6766),
        ('EGP', 'Egypt', 2611),
        ('VTN', 'Vietnam', 6242),
        ('CNG', 'Democratic Republic of Congo', 4338),
        ('GRM', 'Germany', 644),
        ('TRK', 'Turkey', 2106),
        ('IRN', 'Iran', 3146),
        ('THL', 'Thailand', 5873),
        ('FRN', 'France', 679),
        ('ITL', 'Italy', 1181),
        ('SAF', 'South Africa', 6120),
        ('SPN', 'Spain', 1031);
        
INSERT INTO countries (c_id, country_name, distance_miles)
VALUES('UKM', 'United Kingdom (mainland)', 0);

ALTER TABLE products
	MODIFY packaging SET('1_PETE','2_HDPE','3_PVC','4_LDPE','5_PP','6_PS','7_otherplastic','paper','metal','glass','mix','none'); -- adding glass packaging


INSERT INTO products (p_id, p_name, category, weight_g, packaging, country_code, transport,food_code, price)
VALUES('P001', 'bananas loose', 'plantbased', 1000, 'none', 'SAF', 'ship', 022, 1.15),
	   ('D002', 'milk', 'vegeterian', 1500, '1_PETE', 'UKM', 'drive', 013, 1.60),
       ('P003', 'rice', 'plantbased', 250, '4_LDPE', 'IND', 'air', 011, 1.25),
       ('P004', 'baby corn pack', 'plantbased', 1000, '1_PETE', 'EGP', 'ship', 019, 1.90),
       ('V005', 'eggs (12)', 'vegeterian', 600, 'paper', 'UKM', 'drive', 010, 2.40),
       ('V006', 'eggs (6)', 'vegeterian', 300, 'paper', 'UKM', 'drive', 010, 1.60),
       ('F007', 'salmon wild', 'fish', 1000, 'none', 'FRN', 'drive', 012, 24.90),
       ('M008', 'chicken breast sliced', 'meat', 150, '1_PETE', 'RUS', 'air', 007, 2.80),
       ('M009', 'lamb chops', 'meat', 400, '1_PETE', 'JPN', 'ship',002, 15.70 ),
       ('P010', 'frozen peas', 'plantbased', 1000, '4_LDPE', 'SPN', 'drive', 021,1.15),
       ('P011', 'tomatoes', 'plantbased', 1000, 'none', 'TRK', 'ship', 018, 3.90),
       ('P012', 'oranges', 'plantbased', 1000, '4_LDPE', 'ITL', 'drive', 025, 1.40),
       ('P013', 'carrots loose', 'plantbased', 1000, 'none', 'ETH', 'ship', 023, 1.20),
       ('P014', 'carrots packaged', 'plantbased', 800, '4_LDPE', 'SPN', 'ship', 023, 1.70),
       ('P015', 'olive oil bottle', 'plantbased', 750, '5_PP', 'ITL', 'ship', 008, 3.30),
       ('P016', 'olive oil glass', 'plantbased', 500, 'glass', 'ITL', 'ship',008, 4.90),
       ('P017', 'sugar', 'plantbased', 500, 'paper', 'INA', 'air', 014, 1.40),
       ('V018', 'milk chocolate', 'vegeterian', 100, '4_LDPE', 'GRM', 'drive',014, 2.20),
       ('P019', 'soy milk', 'plantbased', 1000, 'mix', 'CHN', 'ship', 020, 1.90 ),
       ('P020', 'apples', 'plantbased', 1000, 'none', 'UKM', 'ship',024, 2.20),
       ('P021', 'soy milk unsweetened', 'plantbased', 1000, 'mix', 'CHN', 'ship', 020, 1.95),
       ('M022', 'sausages', 'meat', 350, '1_PETE', 'VTN', 'ship', 006, 2.90),
       ('M023', 'pork chops', 'meat', 600, '1_PETE', 'BRZ', 'air', 006, 5.20),
       ('P024', 'walnuts pack', 'plantbased', 180, '4_LDPE', 'USA', 'air', 026, 4.10),
       ('V025', 'cheddar sliced', 'vegeterian', 250, '1_PETE', 'FRN', 'drive',003, 2.80 );


INSERT INTO customers (customer_id, customer_name, customer_surname, email, age, postcode)
VALUES ('C001', 'Helena', 'Blackmore', 'helena@gmail.com', 32, 'BN229PR'),
	   ('C002', 'David', 'Peters', 'gfdgfgh@gmail.com', 78, 'BN198PR'),
       ('C003', 'Peter', 'Andrews', 'hvwgx@yahoo.com', 34, 'BN119TY'),
       ('C004', 'Ciada', 'May', 'hwefdwe@hotmail.com', 18, 'BN129OR'),
       ('C005', 'Martin', 'Cameron', 'uuuuu@gmail.com', 56, 'BN248PR'),
       ('C006', 'Karl', 'Reese', 'ytrew@gmail.com', 32, 'BN299PP'),
       ('C007', 'Milo', 'Phalange', 'lkhgd@hotmail.com', 27, 'BN299PP'),
       ('C008', 'Chalene', 'Raider', 'iuyredf@yahoo.com', 21, 'BN79PR'),
       ('C009', 'Lucy', 'Miles', 'jhgfrtdt@gmail.com', 19, 'BN127TF'),
       ('C010', 'Vera', 'Johnson', 'kjhgfd@hotmail.com', 27, 'BN327TR'),
       ('C011', 'Rachel', 'Jones', 'hhtdsghdv@yahoo.com', 42, 'BN229QQ'),
       ('C012', 'Maria', 'Rosewater', 'uuuw@gmail.com', 49, 'BN129PR'),
       ('C013', 'Petros', 'Smith', 'eee@gmail.com', 39, 'BN229PZ'),
       ('C014', 'Selma', 'Mavrokefalos', 'SEEE@yahoo.com', 35, 'BN229PR');
ALTER TABLE shops
	ADD COLUMN purchase_date TIMESTAMP;
ALTER TABLE shops
	MODIFY COLUMN purchase_date DATE;
    
INSERT INTO shops (shop_id, items_total, customer_id, purchase_date)
VALUES ('S001', 12, 'C014', '2021-05-30'),
		('S002', 3, 'C011', '2021-05-30'),
		('S003', 1, 'C011', '2021-06-01'),
		('S004', 5, 'C009', '2021-06-01'),
		('S005', 15, 'C001', '2021-06-01'),
		('S006', 10, 'C008', '2021-06-02'),
		('S007', 8, 'C005', '2021-06-02'),
		('S008', 14, 'C007', '2021-06-02'),
		('S009', 11, 'C002', '2021-06-02'),
		('S010', 2, 'C013', '2021-06-03'),
		('S011', 5, 'C012',  '2021-06-03');

INSERT INTO shops_has_products (shop_id, p_id)
VALUES('S001', 'P003' ), ('S001', 'P001' ), ('S001', 'M009' ), ('S001', 'M022' ), ('S001', 'V018' ), ('S001', 'V025' ), ('S001', 'P024' ), ('S001', 'P016' ), ('S001', 'P017' ), ('S001', 'P015' ), ('S001', 'V006' ), ('S001', 'V005' ),
	  ('S002', 'D002' ), ('S002', 'P001' ), ('S002', 'P003' ),
      ('S003', 'D002' ),
      ('S004', 'D002' ), ('S004', 'P003' ), ('S004', 'P004' ), ('S004', 'M009' ),('S004', 'P010' ),
      ('S005', 'P003' ),('S005', 'P001' ),('S005', 'P010' ),('S005', 'M009' ),('S005', 'P011' ),('S005', 'P012' ),('S005', 'P013' ),('S005', 'P016' ),('S005', 'P019' ),('S005', 'V025' ),('S005', 'P021' ),('S005', 'P003' ),('S005', 'V018' ),('S005', 'P017' ),('S005', 'V005' ),
      ('S006', 'F007' ),('S006', 'P003' ),('S006', 'D002' ),('S006', 'P010' ),('S006', 'P012' ),('S006', 'P011' ),('S006', 'P013' ),('S006', 'P019' ),('S006', 'P016' ),('S006', 'P017' ),('S006', 'V006' ),
      ('S007', 'F007' ), ('S007', 'M008' ), ('S007', 'P003' ), ('S007', 'P001' ),('S007', 'P011' ), ('S007', 'P012' ),('S007', 'P014' ),('S007', 'M022' ),
      ('S008', 'P003' ), ('S008', 'P020' ),('S008', 'M008' ),('S008', 'P020' ),('S008', 'P011' ),('S008', 'P012' ),('S008', 'P014' ),('S008', 'P003' ),('S008', 'P015' ),('S008', 'P017' ),('S008', 'V018' ),('S008', 'P020' ),('S008', 'P019' ),('S008', 'V006' ),
      ('S009', 'M008' ), ('S009', 'P003' ),('S009', 'P020' ),('S009', 'P021' ),('S009', 'D002' ),('S009', 'P011' ),('S009', 'P014' ),('S009', 'P017' ),('S009', 'P015' ),('S009', 'V018' ),('S009', 'V006' ),
      ('S010', 'P003' ),('S010', 'P012' ),
      ('S011', 'P003' ), ('S011', 'P010' ), ('S011', 'P004' ), ('S011', 'D002' ),('S011', 'M008' );
      
         
-- Using any type of the joins create a view that combines multiple tables in a logical way
	-- how many items did each person buy, ordered by date and in alphabetical order (if same date):

SELECT s.purchase_date AS date, c.customer_surname AS surname, s.items_total AS 'number of items'  FROM customers AS c
INNER JOIN shops AS s
ON c.customer_id = s.customer_id
ORDER BY s.purchase_date DESC, c.customer_surname ASC;

	-- products sorted by their carbon footprint:
 SELECT p.p_name, p.weight_g, f.co2_eq AS 'co2 equivalent emitted per 1kg', (f.co2_eq * p.weight_g/1000) AS 'co2 equivalent emited per product'
	FROM products AS p
    INNER JOIN foods AS f
    ON f.id = p.food_code
    ORDER BY (f.co2_eq * p.weight_g/1000) DESC;

-- in your DB, create a stored function that can be applied to a query in your DB
	-- calculate carbon footrprint  per calorie of each item in a shop
    
DELIMITER //
CREATE FUNCTION co2_kcal(calories DECIMAL(6,2), co2_eq DECIMAL(4,2))
		RETURNS DECIMAL(4,2) DETERMINISTIC
BEGIN
  RETURN 100*(co2_eq/calories);
END// 
DELIMITER ;
	-- use of the co2_kcal function
SELECT p.p_name AS product, co2_kcal(f.cals_per100, f.co2_eq) AS 'co2 per kcal' FROM products AS p 
INNER JOIN foods AS f
ON p.food_code = f.id;

    
-- Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis
	-- products that were imporetd from less than 2000 miles away by ship or car, distance and country of origin
    
SELECT p.p_name AS product, co.distance_miles AS 'distance (miles)', country_name AS country 
	FROM products AS p
	INNER JOIN countries AS co
    ON p.country_code = co.c_id
    WHERE country_code IN (
			SELECT  co.c_id 
			FROM countries AS co
			WHERE co.distance_miles < 2000 AND p.transport !='air')
	ORDER BY co.distance_miles DESC;
            
-- Create DB diagram where all table relations are shown
	-- done and saved as CarbonFootprint_Diagram, submitted alongside this script
    
-- ******************************************************************************************
-- ADVANCED REQUIREMENTS
-- *****************************************************************************************
-- In your database, create a stored procedure and demonstrate how it runs
	-- find 10 top spenders in the last month to be entered into a prize draw 


 DELIMITER //

CREATE PROCEDURE prize_draw() 

	BEGIN

SELECT MONTH(s.purchase_date) AS 'last month', s.customer_id, c.customer_surname AS customer, SUM(p.price) AS 'total spend' FROM shops_has_products AS i
	INNER JOIN products AS p
    ON i.p_id = p.p_id
		INNER JOIN shops AS s
        ON i.shop_id = s.shop_id
			INNER JOIN customers AS c
            ON s.customer_id = c.customer_id
            WHERE MONTH(s.purchase_date) =MONTH(now()) -1 
    GROUP BY s.customer_id
    ORDER BY SUM(p.price) DESC, MONTH(s.purchase_date) ASC
    LIMIT 10;
    
	END //
    DELIMITER ;
    
CALL prize_draw();


-- In your database, create a trigger and demonstrate how it runs
	-- change in price
DROP TRIGGER price_change;
DELIMITER //

CREATE TRIGGER price_change
AFTER UPDATE
ON products FOR EACH ROW
BEGIN
    IF OLD.price <> new.price THEN
        INSERT INTO priceChanges(p_id, old_price, new_price, change_perc, change_date)
        VALUES(old.p_id, old.price, new.price, 100*((new.price/old.price)-1), now());
    END IF;
END//

DELIMITER ;
	-- check that trigger works
    
		-- creating a new table to store info about price changes
DROP TABLE IF EXISTS priceChanges;
CREATE TABLE priceChanges (p_id VARCHAR(10), old_price DECIMAL(6,2), new_price DECIMAL(6,2), change_perc INTEGER , change_date DATE);

UPDATE products 
SET price = 2.90
WHERE p_id = 'P001';

SELECT * FROM priceChanges;

    
    
-- In your data base, create an event and demonstrate how it runs
	-- every day record number of shops
CREATE TABLE day_customers (bis_date DATE, total_customers INTEGER);
 

CREATE EVENT dailyCustomer_count
ON SCHEDULE EVERY 1 DAY
COMMENT 'Records number of consumers each day'

DO
INSERT INTO day_customers (bis_date, total_customers)
  SELECT
	DATE(now()) AS bis_date,
    SUM(s.customer_id)  FROM shops AS s
	WHERE s.purchase_date=DATE(now());

-- Create a view that uses at least 3-4 base tables; prepare and demonstrate a query that uses the view to produce a logically arranged result set for analysis.
-- Prepare an example query with group by and having to demonstrate how to extract data from your DB for analysis
	-- view customers who sepnd more than £20 this month (both requirements met in the query below)
    
SELECT MONTH(s.purchase_date), s.customer_id, c.customer_surname AS customer, SUM(p.price) AS 'total spend' FROM shops_has_products AS i
	INNER JOIN products AS p
    ON i.p_id = p.p_id
		INNER JOIN shops AS s
        ON i.shop_id = s.shop_id
			INNER JOIN customers AS c
            ON s.customer_id = c.customer_id
		WHERE MONTH(s.purchase_date)=MONTH(NOW())
    GROUP BY s.customer_id
    HAVING Sum(p.price) >20
    ORDER BY SUM(p.price) DESC, MONTH(s.purchase_date) ASC;
    

    