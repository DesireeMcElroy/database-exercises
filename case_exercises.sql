-- CASE EXERCISES

-- 1. Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

USE employees;

SELECT *
FROM employees;
-- 300,024


select title
from titles
where (
SELECT count(distinct(title))
FROM titles);


USE florence08;
/* 
CREATE TEMPORARY TABLE disctinct_emp AS
(
SELECT DISTINCT(emp_no)
FROM employees.employees
); */

SELECT (employees.emp_no), dept_no, hire_date, to_date,
	IF(to_date > curdate(), TRUE, FALSE) AS is_current_employee
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
ORDER BY emp_no;
-- Returns 331,603 but should be 300,024


-- 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT first_name, last_name,
	CASE
		WHEN last_name BETWEEN 'A%' AND 'Hz%' THEN 'A-H'
		WHEN last_name BETWEEN 'I%' AND 'Qz%' THEN 'I-Q'
		WHEN last_name BETWEEN 'R%' AND 'Zz%' THEN 'R-Z'
		ELSE 'other'
		END AS alpha_group
FROM employees
ORDER BY alpha_group;


-- 3. How many employees (current or previous) were born in each decade?

-- See what the oldest birth date we have is
SELECT birth_date, first_name, last_name
FROM employees
ORDER BY birth_date DESC;

-- Next step

SELECT
	CASE
		WHEN birth_date LIKE '195%' THEN '50s baby'
		WHEN birth_date LIKE '196%' THEN '60s baby'
		ELSE 'other'
		END AS decade_baby,
		count(*)
FROM employees
GROUP BY decade_baby;


