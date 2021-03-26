
## 1 Create a new SQL script named limit_exercises.sql
-- within this document

/*
#2 List the first 10 distinct last name sorted in descending order.
*/

## 2 code:
SELECT DISTINCT last_name from employees
order by last_name desc
LIMIT 10;

/* #2 Answer:
Zykh
Zyda
Zwicker
Zweizig
Zumaque
Zultner
Zucker
Zuberek
Zschoche
Zongker
*/

/* #3
Find all previous or current employees hired in the 90s and born on Christmas. 
Find the first 5 employees hired in the 90's by sorting by hire date and limiting your 
results to the first 5 records. 
Write a comment in your code that lists the five names of the employees returned.
*/

## 3 code:
select * from employees
where hire_date like '199%'
and birth_date like '%12-25'
order by hire_date
limit 5;

/* 3 export of the five name of the employees returned:
emp_no	birth_date	first_name	last_name	gender	hire_date
243297	1962-12-25	Alselm	Cappello	F	1990-01-01
34335	1960-12-25	Utz	Mandell	M	1990-01-03
400710	1963-12-25	Bouchung	Schreiter	M	1990-01-04
465730	1959-12-25	Baocai	Kushner	F	1990-01-05
490744	1959-12-25	Petter	Stroustrup	M	1990-01-10
*/


/* #4
Try to think of your results as batches, sets, or pages. 
The first five results are your first page. 
The five after that would be your second page, etc. 
Update the query to find the tenth page of results.
*/

#4 code:

select first_name, last_name, emp_no, hire_date
from employees
where birth_date like '%-12-25' and hire_date between '1990-01-01' and '1999-12-31'
order by hire_date
limit 5 offset 45;

/* 

#4 question:
Try to think of your results as batches, sets, or pages. 
The first five results are your first page. 
The five after that would be your second page, etc. 
Update the query to find the tenth page of results.

first_name	last_name	emp_no	hire_date
Pranay	Narwekar	463558	1990-07-18
Marjo	Farrow	444269	1990-07-18
Ennio	Karcich	291662	1990-08-05
Dines	Lubachevsky	413687	1990-08-06
Ipke	Fontan	416525	1990-08-06

#4 Answer
Offset is a sub funtion of limit that can not run on it's own, 
and when used it sets a different startpoint for the query to 
display based on the perameters the user chooses for limit and offset.
When the offset is '50' the start will be at row record 51 and will 
note the next limit of 5 rows of data. 

*/