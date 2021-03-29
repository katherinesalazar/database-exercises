use employees;

show tables from employees;

#2

/*
Write a query to to find all employees whose last name starts and ends with 'E'. 
Use concat() to combine their first and last name together as a single column named full_name.
--Returns 899 records
*/

SELECT *, CONCAT(
first_name, ' ', last_name)
AS full_name
FROM employees
WHERE last_name LIKE 'e%e';


#3

/*
Convert the names produced in your last query to all uppercase.
--Returns 899 records
*/

SELECT UPPER(
CONCAT(
first_name, ' ', last_name))
AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

#4 

/*
Find all employees hired in the 90s and born on Christmas.
Use datediff() function to find how many days they have been working at the company 
(Hint: You will also need to use NOW() or CURDATE()),
--Returns 362 rows
*/

SELECT *, datediff(CURDATE(), hire_date) 
FROM employees WHERE hire_date Like '199%' 
AND birth_Date like '%12-25';


#5

/*
Find the smallest and largest current salary from the salaries table.

--smallest: 38623
--largest: 158220
*/

select * 
from salaries;

select min(salary)
from salaries
where to_date like '9999%';

select max(salary)
from salaries
where to_date like '9999%';

/* #6

Use your knowledge of built in SQL functions to generate a username for all of the employees. 

A username should be all lowercase, 
and consist of the first character of the employees first name, 
the first 4 characters of the employees last name, 
an underscore, 
the month the employee was born, 
and the last two digits of the year that they were born. 
---know that we will use:
    -LOWER()
    -CONCAT()
    -SUBSTR()

--Returns 300024 records

*/

SELECT LOWER(
CONCAT(
SUBSTR(first_name, 1,1),
SUBSTR(last_name, 1,4),
'-',
SUBSTR(birth_date,6,2),
SUBSTR(birth_date,3,2)))
AS username
FROM employees;

