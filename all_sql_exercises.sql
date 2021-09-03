-- ALL SQL DATABASE EXERICSES FOR REVIEW



-- Exercises


-- DATABASE EXERCISES


-- 1. Connect TO the DATABASE SERVER
USE employees;
    
    
 -- 2. LIST ALL the DATABASES
SHOW DATABASES;


-- 3. Switch TO a DATABASE USING the USE statement
USE employees;


-- 4. SHOW the currently selected DATABASE
SELECT DATABASE();


-- 5. Switch TO a different DATABASE
USE chipotle;


-- 6. SHOW the currently selected DATABASE
SELECT DATABASE();







-- *************
-- TABLES EXERCISES

USE employees;

# Below will show the current database
SELECT DATABASE();

# List all the tables in the database
SHOW TABLES;

# 5. Explore the employees table. What different data types are present on this table?
DESCRIBE employees;

-- Types of DATA among the TABLES are numbers, strings, AND nulls including INT, VARCHAR(), NULL, AND date.


# 6. Which table(s) do you think contain a numeric type column?

-- I believe only salaries, employee AND titles will contain a NUMERIC TYPE COLUMN due TO salary AND employee id number.


# 7. Which table(s) do you think contain a string type column?

-- ALL of the TABLES including departments, dept_emp, dept_manager, employees, salaries, AND titles ALL contain a STRING TYPE

# 8. Which table(s) do you think contain a date type column?

-- The TABLES dept_emp, dept_manager, employees, salaries, AND titles ALL contain a DATE TYPE column.

# 9. What is the relationship between the employees and the departments tables?

-- Employees are departments USE the same DATA types such AS INT, VARCHAR() AND NOT null. 

--  10. SHOW the SQL that created the dept_manager table.

SHOW CREATE TABLE employees;




-- *******************

-- SELECT EXERCISES

USE albums_db;

SELECT DATABASE();

SHOW TABLES;


-- 3. Explore the structure of the albums table.
/* 
a. How many rows are in the albums table?

b. How many unique artist names are in the albums table?

c. What is the primary key for the albums table?

d. What is the oldest release date for any album in the albums table? What is the most recent release date?
*/

DESCRIBE albums;

SHOW albums;

SELECT *
	FROM albums;
-- There are 31 rows.

SELECT DISTINCT artist
FROM albums;
-- There are 23 rows of unique artists.

DESCRIBE albums;
-- The primary key is id.

SELECT *
	FROM albums
	ORDER BY release_date;
-- The oldest release date is 1967.
-- The most recent release date is 2011


-- 4.
/*
WRITE queries TO find the following information:

a. The NAME of ALL albums BY Pink Floyd

b. The YEAR Sgt. Pepper's Lonely Hearts Club Band was released

c. The genre for the album Nevermind

d. Which albums were released in the 1990s

e. Which albums had less than 20 million certified sales

f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
*/

SELECT *
	FROM albums
	WHERE artist = 'Pink Floyd';
-- The albums are named The Dark Side of the Moon and The Walls

SELECT *
	FROM albums
	WHERE NAME = "Sgt. Pepper's Lonely Hearts Club Band";
-- The year is 1967

SELECT *
	FROM albums
	WHERE NAME = "Nevermind";
-- The genre is grunge, alternative rock

SELECT `name`,
			release_date
	FROM albums
	WHERE release_date BETWEEN 1990 AND 1999;
/*	
The Bodyguard	1992
Jagged Little Pill	1995
Come On Over	1997
Falling into You	1996
Let's Talk About Love	1997
Dangerous	1991
The Immaculate Collection	1990
Titanic: Music from the Motion Picture	1997
Metallica	1991
Nevermind	1991
Supernatural	1999
*/

SELECT *
	FROM albums
	WHERE sales < 20;


SELECT *
	FROM albums
	WHERE genre = 'Rock';
-- The 'Rock' variable is different specifically from 'Hard Rock' and 'Progressive rock'


-- ********************

-- WHERE EXERCISES

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
-- Returned 441 rows

SELECT *
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya')
AND gender = 'M';

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


-- Redoing exercises

