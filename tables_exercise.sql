# Will change to the employees database
use employees;

# Below will show the current database
SELECT database();

# Below will show tables within the current database
show tables;

# 4. Tables are current_dept_emp, departments, dept_emp, dept_emp_latest_date, dept_manager, employees, salaries, titles.

# 5. Types of data among the tables are numbers, strings, and nulls including int, varchar(), null, and date.

# 6. I believe only salaries, employee and titles will contain a numeric type column due to salary and employee id number.

# 7. All of the tables including departments, dept_emp, dept_manager, employees, salaries, and titles all contain a string type

# 8. The tables dept_emp, dept_manager, employees, salaries, and titles all contain a date type column.

# 9. Employees are departments use the same data types such as int, varchar() and not null. 

/* 10. Use show create dept_manager;

CREATE TABLE `dept_manager` (
  `emp_no` int(11) NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

*/
