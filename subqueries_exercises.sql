-- SUBQUERIES exercises


USE employees;

SELECT *
FROM employees;

DESCRIBE employees;

-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
-- We want the employees table for hire date, 

SELECT first_name,	last_name,	hire_date
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
WHERE hire_date = (
	SELECT hire_date
	FROM employees
  WHERE emp_no = 101010
  )
 AND to_date > curdate();


-- 2. Find all the titles ever held by all current employees with the first name Aamod. 
-- Want to display the title from the titles table with current date, with employee name Aamod. I got 168 rows
SELECT title
FROM titles
WHERE emp_no IN(
	SELECT emp_no
	FROM employees
	WHERE first_name LIKE 'Aamod'
	)
AND to_date > NOW();



-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code. 
-- I get 59,900.

SELECT count(*)
FROM employees
WHERE emp_no NOT IN(
	SELECT emp_no
	FROM dept_emp
	WHERE to_date > curdate() -- '9999%' doesn't work here because it includes employees that change titles that have end dates.
	);



-- 4. Find all the current department managers that are female. List their names in a comment in your code. 
-- we need dept_managers for to_date to be current, and employees table to display names and specify gender.

SELECT first_name, last_name
FROM employees
WHERE emp_no IN(
	SELECT emp_no
	FROM dept_manager
	WHERE to_date > NOW()
	)
AND gender LIKE 'f';


-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary. 
-- my subquery will be max historical salary, we will use salaries table

SELECT AVG(salary) AS average_salary
FROM salaries; -- gives me company's historical average

-- then 

SELECT *
FROM salaries
WHERE salary > (
	SELECT AVG(salary) AS average_salary
	FROM salaries
	)
AND to_date > curdate();

-- 154,543


-- 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?




 