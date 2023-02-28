-- https://www.w3resource.com/postgresql-exercises/create-table/
-- PostgreSQL Create Table [19 exercises with solution]

-- 3. Write a sql statement to create the structure of a table table_2 similar to table_1.

CREATE TABLE IF NOT EXISTS table_1
(
    field1 VARCHAR(50),
    field2 VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS table_2
AS (
    SELECT * FROM table_1
)
WITH NO DATA;

-- 6. Write a SQL statement to create a table named jobs, including job_id, job_title, min_salary,
-- max_salary and check whether the max_salary amount exceeding the upper limit 25000.

CREATE TABLE IF NOT EXISTS jobs
(
    job_id INTEGER NOT NULL,
    job_tittle VARCHAR(25) NOT NULL,
    min_salary DECIMAL NOT NULL,
    max_salary DECIMAL NOT NULL,
    CHECK ( max_salary <= 25000 )
);

-- 7. Write a SQL statement to create a table named countries including columns country_id, country_name and
-- region_id and make sure that no countries except Italy, India and China will be entered in the table.

CREATE TABLE IF NOT EXISTS countries
(
    country_id INTEGER NOT NULL,
    country_name VARCHAR(50) NOT NULL,
    region_id INTEGER
    CONSTRAINT country_name_constr
    CHECK (country_name IN ('Italy', 'India', 'China'))
);

-- 8. Write a SQL statement to create a table named countries including columns country_id,country_name and
-- region_id and make sure that no duplicate data against column country_id will be allowed at the time of insertion.

DROP TABLE countries;
CREATE TABLE countries
(
    country_id INTEGER,
    country_name VARCHAR(50),
    region_id INTEGER,
    CONSTRAINT taras_2
    UNIQUE (country_id)
);

DROP TABLE countries;
CREATE TABLE countries
(
    country_id INTEGER UNIQUE,
    country_name VARCHAR(50),
    region_id INTEGER
);

-- 9. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and
-- max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and
-- max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the
-- specified columns.

DROP TABLE jobs;
CREATE TABLE jobs
(
    job_id INTEGER,
    job_tittle VARCHAR(50) DEFAULT '',
    min_salary DECIMAL DEFAULT 8000,
    max_salary DECIMAL DEFAULT NULL
);
INSERT INTO jobs
(job_id)
VALUES (1);

-- 10. Write a SQL statement to create a table named countries including columns country_id, country_name and
-- region_id and make sure that the country_id column will be a key field which will not contain any duplicate
-- data at the time of insertion.

DROP TABLE countries;
CREATE TABLE countries
(
    country_id VARCHAR(3),
    country_name VARCHAR(15),
    region_id VARCHAR(3),
    CONSTRAINT countries_table_pk
    PRIMARY KEY (country_id)
);

-- 11. Write a SQL statement to create a table countries including columns country_id, country_name and region_id
-- and make sure that the column country_id will be unique and store an auto-incremented value.

DROP TABLE countries;
CREATE TABLE countries
(
    country_id SERIAL UNIQUE,
    country_name VARCHAR(15),
    region_id VARCHAR(3)
);

-- 12. Write a SQL statement to create a table countries including columns country_id, country_name and region_id and make
-- sure that the combination of columns country_id and region_id will be unique.

DROP TABLE countries;
CREATE TABLE countries
(
    country_id VARCHAR(3),
    country_name VARCHAR(50),
    region_id VARCHAR(3),
    CONSTRAINT countries_id_region_key_1
    UNIQUE (country_id, region_id)
);

INSERT INTO countries
VALUES ('UKR', 'Ukraine', 'EU');
INSERT INTO countries
VALUES ('UKR', 'UKRAINE', 'EU1');
INSERT INTO countries
VALUES ('UR', 'Ukraine', 'EU');

-- 13. Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and
-- department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and
-- the foreign key column job_id contain only those values which exist in the jobs table.
-- Here is the structure of the table jobs;

DROP TABLE jobs;
CREATE TABLE jobs
(
    job_id VARCHAR(10) NOT NULL DEFAULT '',
    job_tittle VARCHAR(35) NOT NULL,
    min_salary DECIMAL DEFAULT NULL,
    max_salary DECIMAL DEFAULT NULL,
    CONSTRAINT jobs_pkey
    PRIMARY KEY (job_id)
);

CREATE TABLE job_history
(
    employee_id VARCHAR(10) PRIMARY KEY,
    start_date DATE,
    end_date DATE,
    job_id VARCHAR(10),
    department_id VARCHAR(10),
    CONSTRAINT jobs_job_id_fk
    FOREIGN KEY (job_id)
    REFERENCES jobs (job_id)
);

CREATE TABLE job_history_1
(
    employee_id VARCHAR(10) PRIMARY KEY,
    start_date DATE,
    end_date DATE,
    job_id VARCHAR(10)
    REFERENCES jobs (job_id),
    department_id VARCHAR(10)
);

-- 14. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number
-- hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain
-- any duplicate value at the time of insertion and the foreign key columns combined by department_id and manager_id columns contain
-- only those unique combination values, which combinations exist in the departments table.
-- Assume the structure of departments table below.

CREATE TABLE departments
(
    department_id NUMERIC(4,0) NOT NULL,
    department_name VARCHAR(30) NOT NULL,
    manager_id NUMERIC(6,0),
    location_id NUMERIC(4,0) DEFAULT NULL,
    PRIMARY KEY (department_id, manager_id)
);

CREATE TABLE employees
(
    employee_id VARCHAR(5) PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    email VARCHAR(20),
    phone_number VARCHAR(20),
    hire_date DATE,
    job_id VARCHAR(20),
    salary INTEGER,
    commission INTEGER,
    manager_id NUMERIC(6,0),
    department_id NUMERIC(4,0) NOT NULL,
    FOREIGN KEY (department_id, manager_id)
    REFERENCES departments (department_id, manager_id)
);

-- 15. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email,
-- phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column
-- does not contain any duplicate value at the time of insertion, and the foreign key column department_id, reference by the
-- column department_id of departments table, can contain only those values which are exist in the departments table and another
-- foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which exist in the jobs
-- table.
-- Assume that the structure of two tables departments and jobs.

CREATE TABLE departments
(
    department_id NUMERIC(4,0) PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL,
    manage_id NUMERIC(6,0) DEFAULT NULL,
    location_id NUMERIC(4,0) DEFAULT NULL
);

CREATE TABLE jobs
(
    job_id VARCHAR(20) PRIMARY KEY DEFAULT '',
    job_tittle VARCHAR(35) NOT NULL,
    min_salary NUMERIC(6,0) DEFAULT NULL,
    max_salary NUMERIC(6,0) DEFAULT NULL
);

CREATE TABLE employees
(
    employee_id VARCHAR(3) PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    email VARCHAR(20),
    phone_number VARCHAR(20),
    hire_date DATE,
    job_id VARCHAR(20),
    FOREIGN KEY (job_id)
    REFERENCES jobs (job_id),
    salary NUMERIC,
    commission NUMERIC,
    manager_id NUMERIC(6,0),
    department_id NUMERIC(4,0),
    FOREIGN KEY (department_id)
    REFERENCES departments (department_id)
);

-- 16. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and
-- make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key
-- column job_id, referenced by the column job_id of jobs table, can contain only those values which exist in the jobs table.
-- The specialty of the statement is that the ON UPDATE CASCADE action allows you to perform the cross-table update and
-- ON DELETE RESTRICT action rejects the deletion. The default action is ON DELETE RESTRICT.
-- Assume that the following is the structure of the table jobs.

DROP employees1, jobs1;

CREATE TABLE employees1
    (employee_id INTEGER,
     first_name VARCHAR,
     last_name VARCHAR,
     job_id INTEGER,
     salary INTEGER,
     CONSTRAINT taras_constrain_pk
     PRIMARY KEY (employee_id),
     CONSTRAINT taras_constrain_fk
     FOREIGN KEY (job_id) REFERENCES jobs1 (job_id)
     ON UPDATE CASCADE
    );

CREATE TABLE jobs1
    (job_id INTEGER PRIMARY KEY,
     job_tittle VARCHAR
    );