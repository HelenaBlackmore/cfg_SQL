USE bakery;

-- all savoury items with pork and beef
SELECT * FROM savoury;

SELECT * FROM savoury 
WHERE main_ingredient = 'pork' or main_ingredient = 'beef';

-- sweet items 50p or cheaper

SELECT * FROM sweet
	WHERE price <= 0.50;
-- all items name and price but cannolli

SELECT sw.item_name as item, sw.price FROM sweet AS sw
	WHERE item_name != 'canolli';
    
-- is, in, (not) between, like

SELECT * FROM sweet
	WHERE item_name LIKE 'c%';
    
