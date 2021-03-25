USE employees;

DESCRIBE employees;
/*
emp_no	int(11)	NO	PRI	NULL	
birth_date	date	NO		NULL	
first_name	varchar(14)	NO		NULL	
last_name	varchar(16)	NO		NULL	
gender	enum('M','F')	NO		NULL	
hire_date	date	NO		NULL	
*/

SELECT *
FROM employees;


-- 2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned. 
-- Return 709 rows

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya'); 


-- 3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2? 
-- Returns 709 rows

SELECT *
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';


-- 4. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned. 
-- Returned 180,241 rows

SELECT *
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya'
OR gender = 'M';

-- 5. Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E. 

-- Returned 7330 rows
SELECT *
FROM employees
WHERE last_name LIKE 'E%';


-- 6. Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E? 

-- Returned 30,723 rows
SELECT *
FROM employees
WHERE last_name LIKE 'E%' 
OR last_name LIKE '%E';

-- Returned 23,393 rows
SELECT *
FROM employees
WHERE last_name NOT LIKE 'E%' 
AND last_name LIKE '%E';


-- 7. Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E? 

-- Returned 899 rows of employees who's last name starts and ends with e
SELECT *
FROM employees
WHERE last_name LIKE 'E%' 
AND last_name LIKE '%E';

-- Returned 24,292 rows who employee' last name ends with e
SELECT *
FROM employees
WHERE last_name LIKE '%E';

-- 8. Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned. 

-- Returned 135,214 rows with employees hired in the 90's
SELECT *
FROM employees
WHERE hire_date LIKE '199%';


-- 9. Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned. 
-- Returned 842 rows with employees born on Christmas.
SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25';

-- 10. Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned. 

-- Returns 362 rows.
SELECT *
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25';

-- 11. Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned. 

-- Returns 1873 rows
SELECT *
FROM employees
WHERE last_name LIKE '%q%';


-- 12. Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found? 

-- Returns 547 rows.
SELECT *
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';