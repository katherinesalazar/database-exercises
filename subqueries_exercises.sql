/*
#1
Find all the current employees with the same hire date as employee 101010 using a sub-query.
-- Returns 37 Rows
*/

use employees;

select *
from employees 
where emp_no like 101010;

SELECT *
FROM dept_emp 
WHERE from_date 
IN(
SELECT hire_date 
FROM employees
WHERE emp_no = 101010)
AND to_date > curdate();


/*
#2
 Find all the titles ever held by all current employees with the first name Aamod 
 -- Returs 6 rows
 
*/

SELECT title
FROM titles
WHERE emp_no 
	IN 
	(
	SELECT emp_no
	FROM employees
	WHERE first_name = 'Aamod'
	)
AND to_date >curdate()
GROUP BY title;

/*
#3
How many people in the employees table are no longer working for the company? 
Give the answer in a comment in your code.
--Returns 91479
*/

SELECT *
FROM dept_emp WHERE to_date 
IN(
SELECT to_date FROM dept_emp
WHERE to_date < curdate());

/*
#4
Find all the current department managers that are female. 
List their names in a comment in your code.
-- Isamu Legleitner
-- Karsten Sigstam
-- Leon DassSarma
-- Hilary Kambil

*/

SELECT first_name, last_name
FROM employees WHERE emp_no IN(
	SELECT emp_no
	FROM dept_manager
	WHERE to_date > curdate())
AND gender = 'F';

/*
#5
Find all the employees who currently have a higher salary 
than the companies overall, historical average salary 
-- Returns 154543 rows
*/


SELECT AVG(salary)
FROM salaries;

Select * FROM employees
WHERE emp_no 
	IN(
	SELECT emp_no FROM salaries
	WHERE salary > 63810.7448 
	AND to_date > curdate()
		);

/*
#6
 How many current salaries are within 1 standard deviation of the current highest salary? 
 (Hint: you can use a built in function to calculate the standard deviation.) 
 What percentage of all salaries is this? 
 -- 0.0346
 
 */
 
SELECT (SELECT count(salary)
FROM salaries
WHERE salary > (
SELECT max(salary) - STDDEV(salary)
FROM salaries
WHERE to_date > curdate())
AND to_date > curdate())
/
(SELECT count(salary)
FROM salaries
WHERE to_date > curdate()) *100;

/* BONUS

Find all the department names that currently have female managers.

Find the first and last name of the employee with the highest salary.

Find the department name that the employee with the highest salary works in. */