-- Temporary tables exercises

-- Using the example from the lesson, re-create the employees_with_departments table.

USE florence08;

USE employees.employees;

CREATE TEMPORARY TABLE employees_with_departments
(SELECT employees.employees.emp_no, 
			employees.employees.first_name, 
			employees.employees.last_name, 
			employees.departments.dept_no, 
			employees.departments.dept_name	
FROM employees.employees
JOIN employees.dept_emp ON employees.employees.emp_no = employees.dept_emp.emp_no
JOIN employees.departments ON employees.dept_emp.dept_no = employees.departments.dept_no);	
			
			
			
			
			
-- So we can see.
SELECT *
FROM employees_with_departments;



-- 1a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns

-- look at data types of names, first name and last name together length is 30.
DESCRIBE employees_with_departments;

ALTER TABLE employees_with_departments ADD full_name VARCHAR(31);

DESCRIBE employees_with_departments;

-- 1b. Update the table so that full name column contains the correct data

UPDATE employees_with_departments
SET full_name = concat(first_name, last_name);

 
-- 1c. Remove the first_name and last_name columns from the table.

ALTER TABLE employees_with_departments DROP COLUMN first_name, DROP COLUMN last_name;

SELECT *
FROM employees_with_departments;

-- 1d. What is another way you could have ended up with this same table?

DROP TEMPORARY TABLE employees_with_departments;

CREATE TEMPORARY TABLE employees_with_departments
(SELECT employees.employees.emp_no, 
			concat(employees.employees.first_name, employees.employees.last_name) AS full_name,
			employees.departments.dept_no, 
			employees.departments.dept_name	
FROM employees.employees
JOIN employees.dept_emp ON employees.employees.emp_no = employees.dept_emp.emp_no
JOIN employees.departments ON employees.dept_emp.dept_no = employees.departments.dept_no);

SELECT *
FROM employees_with_departments;


-- 2. Create a temporary table based on the payment table from the sakila database.

USE florence08;

CREATE TEMPORARY TABLE payment_from_sakila
SELECT *
FROM sakila.payment;


-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
-- we need amount column from payment_from_sakila

SELECT *
FROM payment_from_sakila;

UPDATE sakila.payment
SET payment = (amount * 100);

-- no access so another way is to create a table

DROP TEMPORARY TABLE transform_pennies;

CREATE TEMPORARY TABLE transform_pennies
SELECT (amount * 100) AS amount
FROM sakila.payment;

SELECT *
FROM transform_pennies;

ALTER TABLE transform_pennies
MODIFY COLUMN amount INT;


-- 3. Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst? 

-- current average pay in each department
USE employees;

CREATE TEMPORARY TABLE average_dept_salary AS
(SELECT dept_no, AVG(salary)
FROM employees.salaries
JOIN employees.dept_emp ON employees.dept_emp.emp_no = employees.salaries.emp_no
WHERE employees.salaries.to_date > curdate()
GROUP BY dept_no);

-- Now create query for overall average salary
CREATE TEMPORARY TABLE average_overall_salary AS
(SELECT AVG(salary)
FROM employees.salaries);
-- 63,810

SELECT *
FROM average_dept_salary;

SELECT *
FROM average_overall_salary;

-- now create a z score query


-- z score (x - AVG()) / STDDEV() 





/*

;
*/

