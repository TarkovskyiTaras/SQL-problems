-- PostgreSQL SELECT [19 exercises with solution]

CREATE TABLE employees
(
    first_name VARCHAR,
    last_name VARCHAR,
    department_id NUMERIC,
    salary NUMERIC
);

INSERT INTO employees
VALUES ('person1_fn', 'person1_ln', 1, 500), ('person2_fn', 'person2_ln', 2, 1000), ('person3_fn', 'person3_ln',3 ,1500), ('person4_fn', 'person4_ln', 3, 2000);

-- 1. Write a query to display the names (first_name, last_name) using an alias name “First Name", "Last Name".

SELECT first_name AS "First Name", last_name AS "Last Name" FROM employees;

-- 2. Write a query to get a unique department ID from employee table.

UPDATE employees
SET department_id = CASE
    WHEN first_name LIKE '%1%' THEN 1
    WHEN first_name LIKE '%2%' THEN 2
    WHEN first_name LIKE '%3%' THEN 3
    WHEN first_name LIKE '%4%' THEN 3
    ELSE 15
    END;

SELECT department_id FROM employees
GROUP BY department_id;
--***VS+**
SELECT DISTINCT department_id FROM employees;

-- 3. Write a query to get the details of all employees from the employee table in descending order by their first name.

SELECT * FROM employees
ORDER BY first_name DESC;

-- 4. Write a query to get the names (first_name, last_name), salary and 15% of salary as PF for all the employees.

SELECT first_name, last_name, salary, salary*0.15 AS PF FROM employees;

-- 5. Write a query to get the employee ID, names (first_name, last_name) and salary in ascending order according to
-- their salary.

SELECT first_name, last_name, salary
FROM employees
ORDER BY salary;

-- 6. Write a query to get the total salaries payable to employees.

SELECT SUM(salary) FROM employees;

-- 7*. Write a query to get the maximum and minimum salary paid to the employees.

SELECT * FROM employees WHERE salary = (SELECT MAX(salary) FROM employees);
VS
SELECT * FROM employees WHERE salary = MAX(salary) -- not correct;

SELECT * FROM employees WHERE salary = (SELECT MAX(salary) FROM employees) OR salary = (SELECT MIN(salary) FROM employees) ORDER BY salary DESC;

-- 8. Write a query to get the average salary and number of employees are working.

SELECT AVG(salary), COUNT(DISTINCT(last_name)) FROM employees;

INSERT INTO employees VALUES ('person1_fn', 'person1_ln', 1, 500);
SELECT AVG(salary), COUNT(*) FROM employees;