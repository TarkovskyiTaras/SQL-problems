--https://www.w3resource.com/postgresql-exercises/update-table/
--PostgreSQL Update Table - Exercises, Practice, Solution

CREATE TABLE employees
(
    email VARCHAR,
    commission_pct DECIMAL,
    department_id DECIMAL PRIMARY KEY,
    salary NUMERIC,
    employee_id NUMERIC,
    job_id VARCHAR
);

CREATE TABLE departments
(
    department_id NUMERIC REFERENCES employees (department_id),
    department_name VARCHAR,
    manager_id NUMERIC,
    location_id NUMERIC
);

-- 1. Write a SQL statement to change the email column of the employees table with 'not available' for all employees.

UPDATE employees
SET email='not available';

-- 2. Write a SQL statement to change the email and commission_pct column of the employees table with 'not available' and 0.10 for
-- all employees.

UPDATE employees
SET email= 'not available', commission_pct = 0.10;

-- 3. Write a SQL statement to change the email and commission_pct column of the employees table with 'not available' and 0.10 for
-- those employees whose department_id is 110.

UPDATE employees
SET email='not available', commission_pct = 0.10
WHERE department_id = 110;

-- 4. Write a SQL statement to change the email column of employees table with 'not available' for those employees whose
-- department_id is 80 and gets a commission is less than.20%.

UPDATE employees
SET email = 'not available'
WHERE department_id = 80 AND commission_pct < 0.20;

-- 5*. Write a SQL statement to change the email column of the employees table with 'not available' for those employees who
-- belong to the 'Accounting' department.

UPDATE employees
SET email = 'not available'
WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'accounting');

-- 6. Write a SQL statement to change the salary of an employee to 8000 whose ID is 105, if the existing salary is less than 5000.

UPDATE employees
SET salary = 8000
WHERE employee_id = 105 AND salary < 5000;

-- 7. Write a SQL statement to change the job ID of the employee which ID is 118 to SH_CLERK if the employee belongs to a department
-- which ID is 30 and the existing job ID does not start with SH.

UPDATE employees
SET job_id = 'SH_CLERK'
WHERE employee_id = '118' AND department_id = 30 AND NOT job_id LIKE 'SH%';
