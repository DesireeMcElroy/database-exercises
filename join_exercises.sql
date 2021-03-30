-- Join exercises


-- 1. USE the join_example_db. SELECT ALL the records FROM BOTH the users AND roles tables.

USE join_example_db;

SELECT *
FROM roles;

SELECT *
FROM users;



-- 2. Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.

-- NOTE: table.column_name

SELECT *
FROM users AS A
JOIN roles AS B ON A.role_id = B.id;

SELECT *
FROM users AS A
LEFT JOIN roles AS B ON A.role_id = B.id;

SELECT *
FROM users AS A
RIGHT JOIN roles AS B ON A.role_id = B.id;


-- 3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.

SELECT count(*), ro.name AS role_name
FROM roles AS ro
left JOIN users AS u ON u.role_id = ro.id
GROUP BY role_name;


-- More more exercises

-- 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

-- the three tables we need is employees, dept_manager, and titles
-- there is no commonality betweem departments and employees, thus needing to join dept_manager between dept_name and employees.

USE employees;


SELECT dept_name AS "Department Name", concat(first_name, ' ', last_name) AS "Department Manager"
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
 -- ^^ because there is no relationship between employees and departments
 JOIN employees ON employees.emp_no = dept_manager.emp_no
 WHERE dept_manager.to_date > curdate()
 ORDER BY dept_name ASC;
 
-- NOTE: table.column_name



-- 3. Find the name of all departments currently managed by women.

SELECT gender, dept_name AS "Department Name", concat(first_name, ' ', last_name) AS "Department Manager"
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
 -- ^^ because there is no relationship between employees and departments
 JOIN employees ON employees.emp_no = dept_manager.emp_no
 WHERE gender = "F" AND dept_manager.to_date > curdate()
 ORDER BY dept_name ASC;


-- 4. Find the current titles of employees currently working in the Customer Service department.
-- We need the 
-- departments -- dept_emp
-- titles -- employees
SELECT title, count(*)
FROM departments
JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
JOIN titles ON titles.emp_no = dept_emp.emp_no
WHERE dept_name = 'Customer Service'
	AND dept_emp.to_date LIKE '9999%'
	AND titles.to_date LIKE '9999%'
GROUP BY title;


-- We want it to display the title of the current employee working in customer service.

-- 5. Find the current salary of all current managers.
-- We need salaries, 

SELECT dept_name AS "Department Name", concat(first_name, ' ', last_name) AS "Name", salary
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
 -- ^^ because there is no relationship between employees and departments
 JOIN employees ON employees.emp_no = dept_manager.emp_no
  JOIN salaries ON salaries.emp_no = employees.emp_no
 WHERE dept_manager.to_date > curdate()
 	AND salaries.to_date > curdate()
 ORDER BY dept_name ASC;


-- 6. Find the number of current employees in each department.

SELECT departments.dept_no, departments.dept_name, count(*)
FROM departments
JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
JOIN titles ON titles.emp_no = dept_emp.emp_no
WHERE dept_emp.to_date LIKE '9999%'
	AND titles.to_date LIKE '9999%'
GROUP BY departments.dept_no;

-- 7. Which department has the highest average salary? Hint: Use current not historic information.
-- Need salary and departments to connect, using dept_emp

SELECT dept_name, AVG(salary) AS average_salary
FROM salaries
JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE salaries.to_date LIKE "9999%"
	AND dept_emp.to_date LIKE "9999%"
GROUP BY dept_name
ORDER BY average_salary DESC 
LIMIT 1;

-- 8. Who is the highest paid employee in the Marketing department?

SELECT e.first_name, e.last_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
	AND de.to_date > NOW()
JOIN salaries AS s ON de.emp_no = s.emp_no
	AND s.to_date > NOW()
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Marketing'
ORDER BY s.salary DESC
LIMIT 1;


-- 9. Which current department manager has the highest salary?

SELECT e.first_name, e.last_name, s.salary, d.dept_name
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no
	AND dm.to_date > NOW()
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.to_date > NOW()
JOIN departments AS d ON d.dept_no = dm.dept_no
ORDER BY s.salary DESC
LIMIT 1;
