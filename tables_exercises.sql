<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>ContentFilters</key>
	<dict/>
	<key>auto_connect</key>
	<true/>
	<key>data</key>
	<dict>
		<key>connection</key>
		<dict>
			<key>database</key>
			<string>employees</string>
			<key>host</key>
			<string>157.230.209.171</string>
			<key>kcid</key>
			<string>8044045644373314168</string>
			<key>name</key>
			<string>Codeup DB Server</string>
			<key>rdbms_type</key>
			<string>mysql</string>
			<key>sslCACertFileLocation</key>
			<string></string>
			<key>sslCACertFileLocationEnabled</key>
			<integer>0</integer>
			<key>sslCertificateFileLocation</key>
			<string></string>
			<key>sslCertificateFileLocationEnabled</key>
			<integer>0</integer>
			<key>sslKeyFileLocation</key>
			<string></string>
			<key>sslKeyFileLocationEnabled</key>
			<integer>0</integer>
			<key>type</key>
			<string>SPTCPIPConnection</string>
			<key>useSSL</key>
			<integer>0</integer>
			<key>user</key>
			<string>florence13</string>
		</dict>
		<key>session</key>
		<dict>
			<key>connectionEncoding</key>
			<string>latin1</string>
			<key>contentPageNumber</key>
			<integer>1</integer>
			<key>contentSelection</key>
			<data>
			YnBsaXN0MDDUAQIDBAUGBwpYJHZlcnNpb25ZJGFyY2hpdmVyVCR0
			b3BYJG9iamVjdHMSAAGGoF8QD05TS2V5ZWRBcmNoaXZlctEICVRk
			YXRhgAGuCwwZGhscHSEoLTE2OT5VJG51bGzTDQ4PEBQYV05TLmtl
			eXNaTlMub2JqZWN0c1YkY2xhc3OjERITgAKAA4AEoxUWF4AFgAaA
			CIANVHR5cGVUcm93c1RrZXlzXxAmU2VsZWN0aW9uRGV0YWlsVHlw
			ZVByaW1hcnlLZXllZERldGFpbHPTDQ4PHh8goKCAB9IiIyQlWiRj
			bGFzc25hbWVYJGNsYXNzZXNfEBNOU011dGFibGVEaWN0aW9uYXJ5
			oyQmJ1xOU0RpY3Rpb25hcnlYTlNPYmplY3TSDg8pLKIqK4AJgAuA
			DNIPLi8wWU5TLnN0cmluZ4AKVmVtcF9ub9IiIzIzXxAPTlNNdXRh
			YmxlU3RyaW5nozI0NVhOU1N0cmluZ1hOU09iamVjdNIPLi84gApX
			ZGVwdF9ub9IiIzo7Xk5TTXV0YWJsZUFycmF5ozo8PVdOU0FycmF5
			WE5TT2JqZWN00iIjJj+iJkBYTlNPYmplY3QACAARABoAJAApADIA
			NwBJAEwAUQBTAGIAaABvAHcAggCJAI0AjwCRAJMAlwCZAJsAnQCf
			AKQAqQCuANcA3gDfAOAA4gDnAPIA+wERARUBIgErATABMwE1ATcB
			OQE+AUgBSgFRAVYBaAFsAXUBfgGDAYUBjQGSAaEBpQGtAbYBuwG+
			AAAAAAAAAgEAAAAAAAAAQQAAAAAAAAAAAAAAAAAAAcc=
			</data>
			<key>contentSortColIsAsc</key>
			<true/>
			<key>contentViewport</key>
			<string>{{0, 0}, {694, 444}}</string>
			<key>isToolbarVisible</key>
			<true/>
			<key>queries</key>
			<string>## 1. Open Sequel Pro and login to the database server
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
#CREATE TABLE `dept_manager` (
#  `emp_no` int(11) NOT NULL,
#  `dept_no` char(4) NOT NULL,
#  `from_date` date NOT NULL,
#  `to_date` date NOT NULL,
#  PRIMARY KEY (`emp_no`,`dept_no`),
#  KEY `dept_no` (`dept_no`),
#  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
#  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE
#) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#Question : What is a ENUM type (gender)?





</string>
			<key>table</key>
			<string>dept_manager</string>
			<key>view</key>
			<string>SP_VIEW_CUSTOMQUERY</string>
			<key>windowVerticalDividerPosition</key>
			<real>227</real>
		</dict>
	</dict>
	<key>encrypted</key>
	<false/>
	<key>format</key>
	<string>connection</string>
	<key>queryFavorites</key>
	<array/>
	<key>queryHistory</key>
	<array>
		<string>select * from employees</string>
		<string>Show create</string>
		<string>dept_manager</string>
		<string>## 1.Open Sequel Pro and login to the database server
## 2. Save your work in a file named tables_exercises.sql
## 3. Use the employees database
## 4. List all the tables in the database

#Use employees;
#select * from employees;

## 5. Explore the employees table. What different data types are present on this table?
## emp_no = 
## birth_date = 
## first_name = 
## last_name =
## gender = 
## hire_date =

# 6. Which table(s) do you think contain a numeric type column?
#	A: emp_no, birth_date, and hire_date

# 7. Which table(s) do you think contain a string type column?
# 8. Which table(s) do you think contain a date type column?
# 9. What is the relationship between the employees and the departments tables?



# 10. Show the SQL that created the dept_manager table.
Show create dept_manager</string>
		<string>## 1.Open Sequel Pro and login to the database server
## 2. Save your work in a file named tables_exercises.sql
## 3. Use the employees database
## 4. List all the tables in the database

#Use employees;
#select * from employees;

## 5. Explore the employees table. What different data types are present on this table?
## emp_no = 
## birth_date = 
## first_name = 
## last_name =
## gender = 
## hire_date =

# 6. Which table(s) do you think contain a numeric type column?
#	A: emp_no, birth_date, and hire_date

# 7. Which table(s) do you think contain a string type column?
# 8. Which table(s) do you think contain a date type column?
# 9. What is the relationship between the employees and the departments tables?



# 10. Show the SQL that created the dept_manager table.
Show create</string>
		<string>describe dept_manager</string>
		<string>describe</string>
		<string>show create dept_manager</string>
		<string>describe debt_manager</string>
		<string>describe quotes</string>
		<string>show create</string>
		<string>## 1.Open Sequel Pro and login to the database server
## 2. Save your work in a file named tables_exercises.sql
## 3. Use the employees database
## 4. List all the tables in the database

#Use employees;
#select * from employees;

## 5. Explore the employees table. What different data types are present on this table?
## emp_no = 
## birth_date = 
## first_name = 
## last_name =
## gender = 
## hire_date =

# 6. Which table(s) do you think contain a numeric type column?
#	A: emp_no, birth_date, and hire_date

# 7. Which table(s) do you think contain a string type column?
# 8. Which table(s) do you think contain a date type column?
# 9. What is the relationship between the employees and the departments tables?
# 10. Show the SQL that created the dept_manager table.


Show tables</string>
		<string>## 1.Open Sequel Pro and login to the database server
## 2. Save your work in a file named tables_exercises.sql
## 3. Use the employees database
## 4. List all the tables in the database

#Use employees;
#select * from employees;

## 5. Explore the employees table. What different data types are present on this table?
## emp_no = 
## birth_date = 
## first_name = 
## last_name =
## gender = 
## hire_date =

# 6. Which table(s) do you think contain a numeric type column?
#	A: emp_no, birth_date, and hire_date

# 7. Which table(s) do you think contain a string type column?
# 8. Which table(s) do you think contain a date type column?
# 9. What is the relationship between the employees and the departments tables?
# 10. Show the SQL that created the dept_manager table.


SHOW CREATE from employees</string>
		<string>SHOW CREATE from employees</string>
		<string>SHOW CREATE</string>
		<string>## 5. Explore the employees table. What different data types are present on this table?
## emp_no = 
## birth_date = 
## first_name = 
## last_name =
## gender = 
## hire_date =

# 6. Which table(s) do you think contain a numeric type column?
#	A: emp_no, birth_date, and hire_date

# 7. Which table(s) do you think contain a string type column?
# 8. Which table(s) do you think contain a date type column?
# 9. What is the relationship between the employees and the departments tables?
# 10. Show the SQL that created the dept_manager table.

Use employees</string>
		<string>## 5. Explore the employees table. What different data types are present on this table?
## emp_no = 
## birth_date = 
## first_name = 
## last_name =
## gender = 
## hire_date =

# 6. Which table(s) do you think contain a numeric type column?
#	A: emp_no, birth_date, and hire_date

# 7. Which table(s) do you think contain a string type column?
# 8. Which table(s) do you think contain a date type column?
# 9. What is the relationship between the employees and the departments tables?
# 10. Show the SQL that created the dept_manager table.

SHOW CREATE</string>
		<string>select *</string>
		<string>Use employees</string>
		<string>select * food</string>
	</array>
	<key>rdbms_type</key>
	<string>mysql</string>
	<key>rdbms_version</key>
	<string>5.7.33-0ubuntu0.18.04.1-log</string>
	<key>version</key>
	<integer>1</integer>
</dict>
</plist>
