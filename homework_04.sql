-- 1.Find the name and status of each supplier who supplies project J2
USE parts;

SELECT s.sname, s.status
FROM supplier s
WHERE S_ID IN (
	SELECT S_ID FROM supply
        WHERE J_ID = 'J2');
        
USE parts;        
-- 2.Find the name and city of each project supplied by 
-- a London-based supplier
SELECT proj.jname, proj.city FROM project proj
WHERE CITY IN (
	SELECT sup.CITY FROM supplier sup
        WHERE sup.city = 'London') ;


    
    
-- Find the name and city of each project not supplied by 
-- a London-based supplier

SELECT proj.jname, proj.city FROM project proj
WHERE CITY IN (
	SELECT sup.CITY FROM supplier sup
        WHERE sup.city != 'London') ;

-- Find the supplier name,part name and project name 
-- for each case where a supplier supplies a project with a part ,but also the supplier city, 
-- project city and part city are the same.

USE parts;

SELECT sname AS supplier, jname AS project, pname AS part 
	FROM (SELECT s.sname, s.CITY AS scity, j.jname, j.CITY AS jcity, p.pname, p.city AS pcity
			FROM supplier AS s
			INNER JOIN project AS j
				ON s.CITY = j.CITY
            INNER JOIN part as p
                ON s.CITY = p.CITY) as new;
            

    


