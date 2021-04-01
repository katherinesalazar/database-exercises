/*
#1
Use the join_example_db. 
Select all the records from both the users and roles tables.

*/
use join_example_db;

select * from roles;
select * from users;

/* #2:
Use join, left join, and right join to combine results 
from the users and roles tables as we did in the lesson. 
Before you run each query, guess the expected number of results.
*/
-- use join
SELECT * from users
JOIN roles on users.role_id = roles.id;

-- use left join
SELECT *
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

-- use right join
SELECT *
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;


/*
3
Although not explicitly covered in the lesson, 
aggregate functions like count can be used with join queries. 
Use count and the appropriate join type 
to get a list of roles along with the number of users that has the role. 
Hint: You will also need to use group by in the query.

--Returns 4 records
*/

SELECT roles.name as role_name, count(users.id)
FROM users
RIGHT JOIN roles ON users.role_id = roles.id
GROUP BY role_name;

-- OR

select r.name, count(u.name)
from roles AS r
LEFT JOIN users AS u ON r.id = u.role_id
GROUP BY r.name;

## EMPLOYEES DATABASE EXERCISES ##


/*
#1 
Use the employees database
*/

use employees;

select * from employees;

/*
#2
Using the example in the Associative Table Joins section as a guide, 
write a query that shows each department along with the name of the current manager for that department.
-- Returns 9 records
*/
SELECT d.dept_name AS 'Department Name', 
       CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no 
    AND to_date > CURDATE()
JOIN departments AS d ON dm.dept_no = d.dept_no
ORDER BY d.dept_name;

-- OR 

select dept_name as "Department Name", concat(first_name, " ", last_name) as "Department Manager"
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no
join employees on employees.emp_no = dept_manager.emp_no
where dept_manager.to_date > curdate()
order by dept_name ASC;

-- OR 

/* 
#2
-- department name
-- current manager

JOINS 
-- dept_manager
-- departments
-- employees

TABLE REFERENCES
-- d = departments
-- dm = dept_manager


 */

select dept_name AS 'Department Name', 
CONCAT(first_name, ' ', last_name) as 'Department Manager'
from departments AS d
JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
	AND to_date = '9999-01-01'
JOIN employees as e on dm.emp_no = e.emp_no;

/*
#3 
Find the name of all departments currently managed by women.
-- returns 4 records

What we are looking for in the OUTPUT:
-department name
-manager name
*/
SELECT d.dept_name AS 'Department Name', 
       CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no 
    AND to_date > CURDATE()
JOIN departments AS d ON dm.dept_no = d.dept_no
WHERE e.gender = 'F'
ORDER BY d.dept_name;

-- OR 

select dept_name AS 'Department Name', 
CONCAT(first_name, ' ', last_name) as 'Department Manager'
from departments AS d
JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
	AND to_date = '9999-01-01'
JOIN employees as e on dm.emp_no = e.emp_no
WHERE e.gender = 'F'
ORDER BY dept_name;

/*
#4 
Find the current titles of employees currently working 
in the Customer Service department.

-- Returns 7 records
*/


SELECT t.title AS Title, 
       COUNT(t.title) AS Count
FROM titles AS t
JOIN dept_emp AS de ON de.emp_no = t.emp_no 
    AND de.to_date > CURDATE() 
    AND t.to_date > CURDATE()
JOIN departments AS d ON d.dept_no = de.dept_no 
    AND d.dept_name = 'Customer Service'
GROUP BY t.title;

-- OR 

Select title, Count(distinct e.emp_no) AS 'Count'
FROM titles as t JOIN employees as e ON t.emp_no = e.emp_no  
JOIN dept_emp as de ON de.emp_no = e.emp_no
JOIN departments as d ON d.dept_no = de.dept_no
WHERE   
		de.to_date > CURDATE() 
    	AND t.to_date > CURDATE()
AND dept_name = 'Customer Service'
GROUP BY title
ORDER BY title;


/*
#5 
Find the current salary of all current managers.
*/


select d.dept_name AS 'Department_Name', 
CONCAT(first_name, ' ', last_name) as 'Name',
s.salary as 'Salary'
FROM employees AS e
JOIN salaries AS s on e.emp_no = s.emp_no
JOIN dept_manager AS dm ON s.emp_no = dm.emp_no
JOIN departments AS d ON d.dept_no = dm.dept_no
WHERE dm.to_date > curdate() AND s.to_date >curdate()
ORDER BY dept_name;

/* 
#6 Find the number of current employees in each department. 
*/

SELECT d.dept_no, d.dept_name, COUNT(e.emp_no) AS num_employees
FROM departments AS d
JOIN current_dept_emp AS de ON d.dept_no = de.dept_no
JOIN employees AS e ON de.emp_no = e.emp_no
WHERE de.to_date > NOW()
GROUP BY d.dept_name
ORDER BY d.dept_no;

/* 
#7 Which department has the highest average salary? 
Hint: Use current not historic information. 

--RESULT RETURN OUTPUT: SALES - 88852.9695
*/

SELECT d.dept_name, AVG(s.salary) AS average_salary
FROM departments AS d
JOIN dept_emp as de on d.dept_no = de.dept_no
	AND de.to_date > NOW()
JOIN salaries AS s ON s.emp_no = de.emp_no
	AND s.to_date > NOW()
GROUP BY dept_name
ORDER BY average_salary DESC LIMIT 1;


/* 
#8 Who is the highest paid employee in the Marketing department?
*/

SELECT e.first_name, e.last_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
	AND de.to_date > NOW()
JOIN salaries AS s ON de.emp_no = s.emp_no
	AND s.to_date > NOW()
JOIN departments AS d on de.dept_no = d.dept_no
WHERE d.dept_name = 'Marketing'
ORDER BY s.salary DESC
LIMIT 1;

/*
#9 Which current department manager has the highest salary?
*/

Select e.first_name,
e.last_name,
s.salary,
d.dept_name
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
	AND dm.to_date > NOW()
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.to_date > NOW()
JOIN departments AS d ON d.dept_no = dm.dept_no
ORDER BY s.salary DESC 
LIMIT 1;

/*
#10 
Bonus Find the names of 
-- all current employees, 
-- their department name,
-- and their current manager's name.
*/

/*
#10 
Bonus Find the names of 
-- all current employees, 
-- their department name,
-- and their current manager's name.

-- Tables we will JOIN
	employees
	dep_emp
	dept_manager
	department
	
	TABLE REFERENCES
-- d = departments
-- dm = dept_manager
-- de = dep_emp
*/;

-- 10. (BONUS) Find the names of all current employees, their department name, and their current manager's name.

-- Self Join on employees back around to employees
SELECT CONCAT(e.first_name, ' ', e.last_name) 
AS employee_name, 
d.dept_name, 
CONCAT(m.first_name, ' ', m.last_name) 
AS manager_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
JOIN dept_manager as dm ON d.dept_no = dm.dept_no
JOIN employees as m on dm.emp_no = m.emp_no
WHERE de.to_date > NOW() and dm.to_date > NOW();


-- 11. (BONUS)  Who is the highest paid employee within each department?

SELECT CONCAT(e.first_name, ' ', e.last_name), 
smax.sal, -- smax is the alias we use on the joined query.  we want salaries from there, not the raw salaries tables
d.dept_name
FROM salaries s
JOIN employees e ON s.emp_no = e.emp_no
	AND s.to_date > NOW()
JOIN current_dept_emp de ON e.emp_no = de.emp_no
	AND de.to_date > NOW()
JOIN departments d ON de.dept_no = d.dept_no
JOIN(
-- This join contains an entire query that gives us the maximum salary from each department name
-- We use this, aliased as smax in order to join back to our initial query with two key-pairings between dept_name and salary, eliminating the duplicate case if we were to use a subquery for salaries.
SELECT MAX(s.salary) AS sal, d.dept_name
FROM departments AS d
    JOIN current_dept_emp AS de ON de.dept_no = d.dept_no
JOIN salaries AS s ON de.emp_no = s.emp_no
	WHERE s.to_date > NOW() AND de.to_date > NOW()
GROUP BY de.dept_no
) 
AS smax 
ON (smax.dept_name=d.dept_name AND smax.sal = s.salary)
	WHERE s.to_date > NOW() AND de.to_date > NOW();