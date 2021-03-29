USE employees;

SELECT DATABASE();

SELECT *
FROM employees;


SHOW TABLES;

DESCRIBE employees;

-- 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table? 

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;
-- 709 rows. First name is Irena Reutenauer and last name is Vidya Simmen


-- 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table? 

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;
-- Irena Acton is first person, Vidya Zweizig is last person


-- 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table? 

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;
-- First name is Irena Acton and last name Maya Zyda


-- 5. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name. 

SELECT *
FROM employees
WHERE last_name LIKE 'e%'
 AND last_name LIKE '%e'
ORDER BY emp_no;
-- Returns 899 employees, the first employee number is 10021 and the last employee number is 499648



-- 6. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee. 

SELECT *
FROM employees
WHERE last_name LIKE 'e%'
 AND last_name LIKE '%e'
 ORDER BY hire_date;
 -- Returns 899 rows and the newest employee is Teiji Eldridge and the oldest employee is Sergi Erde
 
 
 -- 7. Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first. 
 
 
SELECT *
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25'
ORDER BY birth_date, hire_date DESC;
-- Return 362 rows, the last Douadi Pettis and the first is Khun Bernini

-- 2 Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name. 

 
 SELECT concat
	(first_name, ' ', last_name)
	AS 'full_name'
FROM employees
WHERE last_name LIKE 'e%' 
	AND last_name LIKE '%e';
	

-- 3. Convert the names produced in your last query to all uppercase. 

SELECT upper(concat
	(first_name, ' ', last_name))
	AS 'full_name'
FROM employees;

-- 4. Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()), 


SELECT first_name, datediff(curdate(), hire_date)
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25';


-- 5. Find the smallest and largest current salary from the salaries table. 

SELECT max(salary)
FROM salaries;

SELECT min(salary)
FROM salaries;

 -- 6. Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born.
 
 SELECT
 	LOWER(
 		CONCAT(
 			SUBSTRING(first_name, 1, 1),
 			SUBSTRING(last_name, 1, 4), 
 			'_', 
 			SUBSTRING(birth_date, 6, 2), 
 			SUBSTRING(YEAR(birth_date), 3, 2)
 				) 
 			) AS 'username',
 			first_name,
 			last_name,
 			birth_date
 FROM employees
 LIMIT 20;

-- OR

 SELECT
 	LOWER(
 		CONCAT(
 			CAST(first_name AS CHAR(1)),
 			CAST(last_name AS CHAR(4)), 
 			'_', 
 			SUBSTRING(birth_date, 6, 2), 
 			SUBSTRING(YEAR(birth_date), 3, 2)
 				) 
 			) AS 'username',
 			first_name,
 			last_name,
 			birth_date
 FROM employees
 LIMIT 20;
