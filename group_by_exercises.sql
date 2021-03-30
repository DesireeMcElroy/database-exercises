-- GROUP BY exercises


USE employees;

DESCRIBE employees;


-- 2. In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file. 

DESCRIBE titles;

SELECT DISTINCT title
	FROM titles;
	

-- 3. Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY. 

SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;


-- how many of each?
SELECT last_name,
	count(*) AS number_of_employees
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;


-- 4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'. 

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY first_name, last_name;

-- OR 

SELECT DISTINCT first_name, last_name
FROM employees
WHERE last_name LIKE 'e%e';

-- If we want to know a unique combo of first and last with more than 1
SELECT first_name, last_name, count(*) AS number_of_employees
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY first_name, last_name
HAVING number_of_employees > 1;


-- 5. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code. 

SELECT last_name, first_name
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%'
GROUP BY last_name, first_name;
-- Chleq, Lingqvist, Qiwen



-- 6. Add a COUNT() to your results (the query above) and use ORDER BY to make it easier to find employees whose unusual name is shared with others.

SELECT last_name, first_name, count(*)
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%'
GROUP BY last_name, first_name
ORDER BY count(*);


-- 7. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names. 

SELECT first_name, gender, count(*) 
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender, first_name;


-- 8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there? 

 SELECT
 	LOWER(
 		CONCAT(
 			SUBSTR(first_name, 1, 1),
 			SUBSTR(last_name, 1, 4), 
 			'_', 
 			SUBSTR(birth_date, 6, 2), 
 			SUBSTR(birth_date, 3, 2)
 				) 
 			) AS username,
 		count(*) AS number_duplicates
FROM employees
GROUP BY username
-- The having clause allows me to filter my aggregate function columns
HAVING number_duplicates > 1
ORDER BY number_duplicates DESC;







