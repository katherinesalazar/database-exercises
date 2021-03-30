use employees;

select *
from titles;

/* 
#2
In your script, use DISTINCT to find the unique titles in the titles table. 
How many unique titles have there ever been? 
Answer that in a comment in your SQL file.
-- 7 unique titles
*/

select distinct title
from titles;

-- OR

select 
	count(distinct title) as number_of_unique_titles
from titles;


/* 
#3
Write a query to to find a list of 
all unique last names of all employees that start and end with 'E' using GROUP BY.
-- Returns 5 rows
*/

select distinct last_name
from employees
where last_name like 'e%e'
group by last_name;

/* 
#4
Write a query to to find all unique combinations 
of first and last names of all employees whose last names start and end with 'E'.
--returns 846 rows
*/

select distinct first_name, last_name
from employees
where last_name like 'e%e'
group by first_name, last_name;

/* 
#5 
Write a query to find the unique last names with a 'q' but not 'qu'. 
Include those names in a comment in your sql code. 

-- 3 rows output 
--NAMES: Chleq, Lindqvist, Qiwen     
*/

select last_name
from employees
where last_name like '%q%'
and last_name not like '%qu%'
group by last_name;

/*
#6
Add a COUNT() to your results (the query above) 
and use ORDER BY to make it easier to find employees whose unusual name is shared with others.

--Returns 3 records
Chleq: 189
Lindqvist: 190
Qiwen: 168

*/


select last_name, COUNT(first_name)
from employees
where last_name like '%q%'
and last_name not like '%qu%'
group by last_name
order by last_name;


/*
#7
Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. 
Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

-Returns 6 rows of records
*/

select first_name, gender, COUNT(*)
from employees
where first_name IN ('Irena', 'Vidya', 'Maya')
group by first_name, gender;


/*
#8
Using your query that
-generates a username 
--for all of the employees, 
--generate a count employees for each unique username. 
--Are there any duplicate usernames? 

-- Returns 285872

BONUS: How many duplicate usernames are there?
--

*/

SELECT 
	LOWER(
		CONCAT(
			SUBSTR(first_name, 1,1),
			SUBSTR(last_name, 1,4),
			'-',
			SUBSTR(birth_date,6,2),
			SUBSTR(birth_date,3,2)
			)
		) AS username,
	count(*) AS number_of_duplicates
FROM employees
GROUP BY username
ORDER BY count(username) DESC;


-- Bonus:

-- 13251 rows returned 

SELECT 
	LOWER(
		CONCAT(
			SUBSTR(first_name, 1,1),
			SUBSTR(last_name, 1,4),
			'-',
			SUBSTR(birth_date,6,2),
			SUBSTR(birth_date,3,2)
			)
		) AS username,
	count(*) AS number_of_duplicates
FROM employees
GROUP BY username
-- The HAVING clause allows me to filter my aggregate function columns 
HAVING number_of_duplicates > 1
ORDER BY number_of_duplicates DESC;