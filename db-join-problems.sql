-- JOIN statements https://www.w3resource.com/postgresql-exercises/join/

--1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.

SELECT locations.location_id, locations.street_address, locations.city, countries.country_name
FROM locations
INNER JOIN countries
ON locations.country_id = countries.country_id;

SELECT locations.location_id, locations.street_address, locations.city, countries.country_name
FROM locations
NATURAL JOIN countries;

SELECT locations.location_id, locations.street_address, locations.city, countries.country_name
FROM locations, countries
WHERE locations.country_id = countries.country_id;

--2. Write a query to make a join with employees and departments table to find the name of the employee,
--including first_name and last name, department ID and name of departments.

SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID;

SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees AS e, departments AS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID;

--3. Write a SQL query to make a join with three tables employees, departments and locations to find the name,
--including first_name and last_name, jobs, department name and ID, of the employees working in London.

SELECT e.first_name, e.last_name, e.job_id, d.department_id, d.department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
INNER JOIN locations AS l
ON l.location_id = d.location_id
--WHERE d.location_id = (SELECT location_id FROM locations WHERE city = 'London');
WHERE l.city = 'London';

SELECT e.first_name, e.last_name, e.job_id, d.department_id, d.department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
INNER JOIN locations AS l
ON l.location_id = d.location_id
WHERE l.city = 'London';

SELECT e.first_name, e.last_name, e.job_id, d.department_id, d.department_name
FROM employees AS e, departments AS d, locations AS l
WHERE e.department_id = d.department_id AND d.location_id = l.location_id AND l.city = 'London';

--4. Write a query to make a join with two tables employees and itself to find the employee id, last_name as Employee
--along with their manager_id and last name as Manager.

SELECT e1.employee_id, e1.last_name AS employee, e1.manager_id, e2.last_name AS manager
FROM employees AS e1
INNER JOIN employees AS e2
ON e1.manager_id = e2.employee_id;

SELECT e1.employee_id, e1.last_name AS employee, e1.manager_id, e2.last_name AS manager
FROM employees AS e1, employees AS e2
WHERE e1.manager_id = e2.employee_id;

--5. Write a query to make a join with a table employees and itself to find the name, including first_name and last_name
--and hire date for those employees who were hired after the employee Jones.

SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date > (SELECT hire_date FROM employees WHERE last_name = 'Jones');

SELECT * FROM employees AS e2 WHERE e2.last_name = 'Jones';


--6*. Write a query to make a join with two tables employees and departments to get the department name and number of employees
--working in each department.

SELECT department_name, COUNT(employee_id) FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
GROUP BY department_name ORDER BY department_name;

--7. Write a query to make a join to find the employee ID, job title and number of days an employee worked, for all the
--employees who worked in a department which ID is 90.

