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


-- got a step further

SELECT title, count(title) AS number_of_employees
FROM titles
WHERE emp_no IN(
	SELECT emp_no
	FROM employees
	WHERE first_name LIKE 'Aamod'
	)
AND to_date > NOW()
GROUP BY title
ORDER BY number_of_employees DESC;


-- Personal notes: Ray's version

SELECT
      t.title AS 'Titles Held by Aamods',
      COUNT(t.title) AS 'Total Aamods Who Held Title'
FROM titles AS t
WHERE
      t.emp_no IN
      (
            SELECT
                  e.emp_no
            FROM employees AS e
            JOIN salaries AS s
                  ON e.emp_no = s.emp_no
                        AND s.to_date > CURDATE()
            WHERE
                first_name LIKE 'Aamod'
      )
GROUP BY
      t.title
;




-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code. 
-- I get 59,900.

SELECT count(*)
FROM employees
WHERE emp_no NOT IN(
	SELECT emp_no
	FROM dept_emp
	WHERE to_date > '9999%'
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
-- First

SELECT
	MAX(salary) AS max_salary,
	MIN(salary) AS min_salary,
	STDDEV(salary) AS std_dev
FROM salaries
WHERE to_date > CURDATE();
-- gives me 158,220 max AND 38,623 min salary WITH std_dev 17309.96

SELECT
(SELECT
	COUNT(salary)
FROM salaries
WHERE to_date > CURDATE()
	AND salary >= (
					SELECT
					MAX(salary) - STDDEV(salary)
					FROM salaries
					WHERE to_date > CURDATE()
					))
/
(SELECT
	COUNT(salary)
FROM salaries
WHERE to_date > CURDATE()) * 100 AS percent_of_salaries;

 