
#1
/* Write a query that returns all employees (emp_no), 
their department number, 
their start date, 
their end date, 
and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. */
 -- Returns 300024

SELECT employees.emp_no, dept_no, hire_date, to_date,
CASE
WHEN to_date LIKE '9999-01-01' THEN '1'
ELSE '0'
END AS is_current_employee
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no;

-- or 
Select emp_no, group_concat(dept_no, ' ') as department_nums , min(from_date) as from_date , max(to_date) as to_date, max(if(to_date = '9999-01-01' true, false )) as current_employment
from dept_emp
group by emp_no;


/*
#2
 Write a query that returns all employee names (previous and current), 
 and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' 
 depending on the first letter of their last name. */


 SELECT first_name, last_name,
 CASE
 WHEN LEFT(last_name, 1) IN('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h') THEN 'A-H'
 WHEN LEFT(last_name, 1) IN('i', 'j', 'k', 'l', 'm', 'n', 'o', 'p') THEN 'I-Q'
 WHEN LEFT(last_name, 1) IN('r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z') THEN 'R-Z'
 END AS 'alpha_group'
 FROM employees;
 

/* 
#3
How many employees (current or previous) were born in each decade? */

 /* 
#3
How many employees (current or previous) were born in each decade? */
-- 50's: 182886
-- 60's: 117138

-- youngest person (1965)
SELECT *
FROM employees 
ORDER BY birth_date DESC;

--  oldest person (1952)
SELECT *
FROM employees 
ORDER BY birth_date;

SELECT 
CASE 
WHEN birth_date LIKE '195%' THEN 'The Fifties Decade'
WHEN birth_date LIKE '196%' THEN 'The Sixties Decade'
ELSE 'youngins'
END AS birth_decade,
count(*) AS employees_per_decade
FROM employees
GROUP BY birth_decade;
