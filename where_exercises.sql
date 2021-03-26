#1 Create a file named where_exercises.sql. Make sure to use the employees database.

use employees;

/* 
#2 Find all current or previous employees with first names 
    'Irena', 'Vidya', or 'Maya' using IN. 
    
    Enter a comment with the number of records returned.
    #2 answer: Records returned: 709.
*/

# 2 code: 
use employees;
select * from employees
where first_name in ('Irena', 'Vidya', 'Maya');

/*
#3 Find all current or previous employees with first names 
'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. 
    
    Enter a comment with the number of records returned. 
    #2 answer: Records returned: 709.

    Does it match number of rows from Q2?
    The number of records returned in question 2 is 709 rows
    and the number returned in question 3 is 709, thus they do match.
*/

# 3 code: 
select *
from employees 
where first_name = 'Irena' 
or first_name = 'Vidya' 
or first_name = 'Maya';

/* 
#4 Find all current or previous employees with first names
'Irena', 'Vidya', or 'Maya', using OR, and who is male. 

    Enter a comment with the number of records returned.
    #4 Answer: Number of records returned is 441. 

*/

#4 code: 
select *
from employees 
where first_name = 'Irena' 
	and gender = 'M'
or first_name = 'Vidya' 
	and gender = 'M'
or first_name = 'Maya'
	and gender = 'M';

/*
#5 Find all current or previous employees whose last name starts with 'E'. 
    
    Enter a comment with the number of employees whose last name starts with E.
    #5 Answer: The number of records returned is 7,330 of current or previous 
    employees whose last name starts with an E.
*/

#5 code:
select *
from employees
where last_name like 'e%';

/* 
#6a Find all current or previous employees whose last name starts or ends with 'E'.  
    
    Enter a comment with the number of employees whose last name starts or ends with E. 
    Answer: The number of employees whose last name starts or ends with E is 30,723 
*/

#6a code: 
select *
from employees
where last_name like 'e%'
or last_name like '%e';


/*
#6b:How many employees have a last name that ends with E, but does not start with E?
    Answer: Returns 23,393 records
*/

#6b Code: 
SELECT *
FROM employees
WHERE last_name LIKE "%e" AND last_name NOT LIKE "e%";

/* #7 Find all current or previous employees employees whose 
    last name starts and ends with 'E'. 

    #7a: Enter a comment with the number of employees whose
     last name starts and ends with E. 
        #7a Answer: Returns 899 records

    #7b: How many employees last names end with E, 
    regardless of whether they start with E?
        #7b Answer: 
*/

#7a code: 
select *
from employees
where last_name like '%e'
and last_name like 'e%';

#7b code:
select *
from employees
where last_name like '%e';


/* 
#8 Find all current or previous employees hired in the 90s. 

    #8 Enter a comment with the number of employees returned.
    #8 Answer: Returns 135,214 records
*/
#8 code: 
use employees;
select * 
from employees
where hire_date like '199%';

/* #9 Find all current or previous employees born on Christmas. 
    #9 Enter a comment with the number of employees returned.
    #9 Answer: 842 records returned
*/
#9 code: 
select * 
from employees
where birth_date like '%12-25';

/* #10 Find all current or previous employees hired in the 90s and born on Christmas. 

    #10 Enter a comment with the number of employees returned.
    #10 Answer: 362 employees returned
*/

#code 10: 
select *
from employees
where hire_date like'199%'
	and birth_date like '%-12-25';

/*
#11 Find all current or previous employees with a 'q' in their last name. 
    #11 Enter a comment with the number of records returned.
    #11 Answer: 1,873 records returned
*/
#11 code: 
select last_name
from employees
where last_name like'%q%';


/* #12 Find all current or previous employees with a 'q' in their last name but not 'qu'.
    #12 How many employees are found?
    #12 Answer: 547 records records returned
*/
#12 code: 
select last_name
from employees
where last_name like '%q%' and last_name not like '%qu%';

