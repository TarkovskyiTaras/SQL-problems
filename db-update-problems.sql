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

-- 8*. Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules
-- that, the salary will be increased by 25% of the department 40, 15% for department 90 and 10% of the department 110 and the rest
-- of the department will remain same.
--*****
UPDATE employees
SET salary = salary*1.25 WHERE department_id = 40;

UPDATE employees
SET salary = salary*1.15 WHERE department_id = 90;

UPDATE employees
SET salary = salary*1.10 WHERE department_id = 110;
--******
UPDATE employees
SET salary =
    CASE
        WHEN department_id = 40
            THEN salary*1.25
        WHEN department_id = 90
            THEN salary*1.15
        WHEN department_id = 110
            THEN salary*1.10
        ELSE salary*2
    END
WHERE department_id IN (40, 90, 110, 50);
--*******
CREATE TABLE employees
    (id NUMERIC,
     first_name VARCHAR,
     last_name VARCHAR,
     salary NUMERIC,
     department_id NUMERIC);

INSERT INTO employees
VALUES (
        1, 'person1', 'person1', '1000', '40'
       );

INSERT INTO employees
VALUES (
           2, 'person2', 'person2', '1000', '50'
       );

INSERT INTO employees
VALUES (
           3, 'person3', 'person3', '1000', '60'
       );

INSERT INTO employees
VALUES (
           4, 'person4', 'person4', '1000', '70'
       );

INSERT INTO employees
VALUES (
           5, 'person5', 'person5', '1000', '80'
       );

INSERT INTO employees
VALUES (
           6, 'person6', 'person6', '1000', '90'
       );

INSERT INTO employees
VALUES (
           7, 'person7', 'person7', '1000', '100'
       );

INSERT INTO employees
VALUES (
           8, 'person8', 'person8', '1000', '110'
       );