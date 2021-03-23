## 1. Open Sequel Pro and login to the database server
## 2. Save your work in a file named tables_exercises.sql
## 3. Use the employees database
## 4. List all the tables in the database

Use employees;
select * from employees;

## 5. Explore the employees table. What different data types are present on this table?
## emp_no = INT(11) = Numeric Type
## birth_date = DATE(10) = Date Type
## first_name = VARCHAR(14) = String Type
## last_name = VARCHAR(16) = String Type
## gender = ENUM(1) = Numeric Type?
## hire_date = DATE(10) = Date Type

# 6. Which table(s) do you think contain a numeric type column?
#	A: emp_no and gender ?

# 7. Which table(s) do you think contain a string type column?
#	A: first_name, last_name

# 8. Which table(s) do you think contain a date type column?
# 	A: birth_date and hire_date

# 9. What is the relationship between the employees and the departments tables?
# 	A: employees has the primary key (emp_no) and the departments table is a foreign table?

#CREATE TABLE `employees` (
#  `emp_no` int(11) NOT NULL,
#  `birth_date` date NOT NULL,
#  `first_name` varchar(14) NOT NULL,
#  `last_name` varchar(16) NOT NULL,
#  `gender` enum('M','F') NOT NULL,
#  `hire_date` date NOT NULL,
#  PRIMARY KEY (`emp_no`)
# ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#CREATE TABLE `departments` (
#  `dept_no` char(4) NOT NULL,
#  `dept_name` varchar(40) NOT NULL,
#  PRIMARY KEY (`dept_no`),
#  UNIQUE KEY `dept_name` (`dept_name`)
#) ENGINE=InnoDB DEFAULT CHARSET=latin1;




# 10. Show the SQL that created the dept_manager table.
# 	A: created on 2/2/21 (go to dept_manger table, then go to table infor to see that SQL created the dept_manager table

#Question : What is a ENUM type (gender)?





