

/* Previous lesson where_exercises.sql copied in as noted in #1

# 2 code: 
use employees;
select * from employees
where first_name in ('Irena', 'Vidya', 'Maya');

# 3 code: 
select *
from employees 
where first_name = 'Irena' 
or first_name = 'Vidya' 
or first_name = 'Maya';

#4 code: 
select *
from employees 
where first_name = 'Irena' 
	and gender = 'M'
or first_name = 'Vidya' 
	and gender = 'M'
or first_name = 'Maya'
	and gender = 'M';

#5 code:
select *
from employees
where last_name like 'e%';

#6a code: 
select *
from employees
where last_name like 'e%'
or last_name like '%e';

#6b Code: 
SELECT *
FROM employees
WHERE last_name LIKE "%e" AND last_name NOT LIKE "e%";

#7a code: 
select *
from employees
where last_name like '%e'
and last_name like 'e%';

#7b code:
select *
from employees
where last_name like '%e';

#8 code: 
use employees;
select * 
from employees
where hire_date like '199%';

#9 code: 
select * 
from employees
where birth_date like '%12-25';

#code 10: 
select *
from employees
where hire_date like'199%'
	and birth_date like '%-12-25';

#11 code: 
select last_name
from employees
where last_name like'%q%';

#12 code: 
select last_name
from employees
where last_name like '%q%' and last_name not like '%qu%';
/*


### Start of order_by_exercises.sql ###



/*
#2 Find all employees with first names 'Irena', 'Vidya', or 'Maya', 
    and order your results returned by first name.
    --returns 709 rows
    #2 In your comments, answer: What was the first and last name 
        in the first row of the results? 
        -- First/last name in first row of results: Irena Reutenauer

    #2 Answer: What was the first and last name of the last person 
        in the table? 
        -- First/last name in last row of results: Vidya Simmen
*/

use employees;

#2 code
select *
from employees
where first_name like 'irena'
or first_name like 'vidya'
or first_name like 'maya'
order by first_name;

#3: 

/* #3
Find all employees with first names 'Irena', 'Vidya', or 'Maya', 
and order your results returned by first name and then last name.
    --709 records returned

    In your comments, answer: 
    What was the first and last name in the first row of the results? 
    -- Irena Acton
    What was the first and last name of the last person in the table?
    -- Vidya Zweizig
*/

#3 code: 
select *
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by first_name, last_name;

#4
/* #4
Find all employees with first names 'Irena', 'Vidya', or 'Maya', 
and order your results returned by last name and then first name.
--returns 709 records

    In your comments, answer: 
    What was the first and last name in the first row of the results? 
    --Irena Acton
    What was the first and last name of the last person in the table?
    --Maya Zyda
*/

#4 code: 
select first_name, last_name
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by last_name, first_name;

/*
#5 Write a query to to find all employees whose last name starts and ends with 'E'.
Sort the results by their employee number. 
    Enter a comment with the number of employees returned, 
    the first employee number and their first and last name, 
    and the last employee number with their first and last name.
    --Number of employees returned: 899
    --First: 10021 Ramzi Erde
    --Last: 499648 Tadahiro Erde
*/

#5 code: 
select *
from employees
where last_name like 'e%' and last_name like '%e'
order by emp_no;

/*
 #6 Write a query to find all employees whose last name starts and ends with 'E'. 
Sort the results by their hire date, so that the newest employees are listed first. 

    Enter a comment with the number of employees returned, 
    the name of the newest employee, and the name of the oldest employee.
    --number of employees returned: 899
    --name of newest employee tenure: Teiji Eldridge 11/27/1999
    --name of the oldest employee tenure: Sergi Erde 02/02/1985 
*/

#6 code:
select emp_no, last_name, first_name, hire_date
from employees
where last_name like 'e%e'
order by hire_date;

/* #7

Find all employees hired in the 90s and born on Christmas. 
Sort the results so that the oldest employee who was hired last is the first result. 

    Enter a comment with the number of employees returned, 
    -- 362 employee records returned
    the name of the oldest employee who was hired last, 
    --Khun Bernini
    and the name of the youngest emmployee who was hired first.
    --Douadi Pettis

*/ 

#7 code: 
select *
from employees
where birth_date like '%12-25'
and hire_date between '1990-01-01' and '1999-12-31'
order by birth_date, hire_date desc;


