-- Step 1: Create the tables

-- Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Step 2: Insert data into the tables

-- Insert data into departments table
INSERT INTO departments (department_id, department_name)
VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing');

-- Insert data into employees table
INSERT INTO employees (employee_id, first_name, last_name, age, salary, department_id)
VALUES
(1, 'John', 'Doe', 28, 50000, 1),
(2, 'Jane', 'Smith', 35, 75000, 2),
(3, 'Jim', 'Brown', 30, 62000, 2),
(4, 'Anna', 'Davis', 22, 45000, 3),
(5, 'Mike', 'Wilson', 40, 85000, 2),
(6, 'Sara', 'Moore', 25, 48000, 3);

-- Step 3: Select data with WHERE and ORDER BY

-- Select employees who are older than 30 and order them by salary descending
SELECT first_name, last_name, age, salary 
FROM employees
WHERE age > 30
ORDER BY salary DESC;

-- Step 4: Update data

-- Update the salary of employee 'John Doe' to 55000
UPDATE employees
SET salary = 55000
WHERE first_name = 'John' AND last_name = 'Doe';

-- Step 5: Delete data

-- Delete employee 'Anna Davis' from the employees table
DELETE FROM employees
WHERE first_name = 'Anna' AND last_name = 'Davis';

-- Step 6: Using Aggregate Functions (COUNT, AVG)

-- Find the average salary of employees in the Engineering department
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
WHERE department_id = 2
GROUP BY department_id;

-- Count the number of employees in each department
SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;

-- Step 7: INNER JOIN to combine data from multiple tables

-- Retrieve the first name, last name, and department name of employees
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

-- Step 8: Using a Subquery

-- Find employees whose salary is above the average salary of their department
SELECT first_name, last_name, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);

-- Step 9: Using DISTINCT to remove duplicates

-- Find unique department IDs from the employees table
SELECT DISTINCT department_id
FROM employees;

-- Step 10: Using INNER JOIN, WHERE, and GROUP BY together

-- Find the department name and total salary expenditure in each department
SELECT d.department_name, SUM(e.salary) AS total_salary
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;

-- Step 11: Drop Tables (optional, to clean up)

-- Drop employees table
DROP TABLE employees;

-- Drop departments table
DROP TABLE departments;


