 /* #1
Using the example from the lesson, re-create the employees_with_departments table.

Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
Update the table so that full name column contains the correct data
Remove the first_name and last_name columns from the table.
What is another way you could have ended up with this same table?
Create a temporary table based on the payment table from the sakila database. 

*/

-- 1a

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT 
employees.employees.emp_no,
employees.employees.first_name, 
employees.employees.last_name, 
employees.dept_emp.dept_no,
employees.departments.dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no);

select * 
from employees_with_departments
limit 5;

-- 1b 
-- Add a column named full_name to this table. 
-- It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns

ALTER TABLE employees_with_departments ADD full_name VARCHAR(100);

UPDATE employees_with_departments
SET full_name = concat(first_name, ' ', last_name);

select *
from employees_with_departments;

-- 1c Remove the first_name and last_name columns from the table.

ALTER TABLE employees_with_departments DROP COLUMN first_name;

ALTER TABLE employees_with_departments DROP COLUMN last_name;

select *
from employees_with_departments;

-- 1d What is another way you could have ended up with this same table?
-- Another way we could have ended up with the same table is by creating an empty temporary table with the correct columns by using VARCHAR 
-- and int then updating the empty columns by pulling the information from the employees database.
-- Using a select instead of a concat
 /*
 #2
 
 Create a temporary table based on the payment table from the sakila database.

Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199. 

*/

USE florence13;

CREATE TEMPORARY TABLE sakila_payment AS(
SELECT * FROM sakila.payment
);

SELECT * 
FROM sakila_payment;

ALTER TABLE sakila_payment
MODIFY amount DECIMAL(10,0);

UPDATE sakila_payment
SET amount = amount * 100;

UPDATE sakila_payment 
SET amount = amount -1;

select * 
FROM sakila_payment;




/* 
#3 

Find out how the current average pay in each department compares to the overall, historical average pay. 

In order to make the comparison easier, you should use the Z-score for salaries. 

In terms of salary, what is the best department right now to work for? 
-- Sales due to the 1.48 standard deviation upward salary projection

The worst?  
-- Human Resources due to the negative standard deviation z-score in salary

Notes: 

-- 63,819 historic average


-- what is a zscore?
-- zscore measures how many standard deviations a given observation is from the pop mean
-- (x - population_mean) / stdv(x)

*/

SELECT *
FROM employees_with_departments
JOIN employees.salaries ON employees_with_departments.emp_no = employees.salaries.emp_no
WHERE employees.salaries.to_date > curdate();

-- Current Averages of Salaries

SELECT dept_name, AVG(employees.salaries.salary) AS c_average_salary
FROM employees_with_departments
JOIN employees.salaries ON employees_with_departments.emp_no = employees.salaries.emp_no
WHERE employees.salaries.to_date > curdate()
GROUP BY dept_name;


-- Historical Averages of Salaries

SELECT AVG(employees.salaries.salary) AS h_average_salary
FROM employees_with_departments
JOIN employees.salaries ON employees_with_departments.emp_no = employees.salaries.emp_no;

-- Historical average salary = 63805.4005

SELECT *
FROM employees_with_departments;

-- New temp table for the z-table 

CREATE TEMPORARY TABLE salary_comparison AS(
SELECT dept_name, AVG(employees.salaries.salary) AS c_average_salary
FROM employees_with_departments
JOIN employees.salaries ON employees_with_departments.emp_no = employees.salaries.emp_no
WHERE employees.salaries.to_date > curdate()
GROUP BY dept_name
);

SELECT *
FROM salary_comparison;

ALTER TABLE salary_comparison ADD h_average_salary INT(255);

ALTER TABLE salary_comparison
MODIFY h_average_salary DECIMAL(10,4);

UPDATE salary_comparison 
SET h_average_salary = 63805.4005;

-- Calculating the Z-score below  

USE florence13;
SELECT *, (c_average_salary - h_average_salary)/ 16904.82828800014 AS z_score
FROM salary_comparison;

USE employees;
-- standard deviation of salaries from employees = 16904.82828800014
SELECT stddev(salary)
FROM salaries;

