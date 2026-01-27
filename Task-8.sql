-- 1. Setup Sample Data
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT
);

INSERT INTO departments VALUES (1, 'HR'), (2, 'IT'), (3, 'Sales'), (4, 'Marketing');
INSERT INTO employees VALUES (101, 'Alice', 1), (102, 'Bob', 2), (103, 'Charlie', NULL), (104, 'David', 5);

-- 2. INNER JOIN: Fetch employees with their department names (only matched) [1, 8]
SELECT e.emp_name, d.dept_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id;

-- 3. LEFT JOIN: Identify employees without departments (all employees + matches) [5, 10]
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;

-- 4. RIGHT JOIN: List all departments including empty ones (all departments + matches) [5]
SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;

-- 5. Simulate FULL JOIN using UNION (MySQL does not support it directly) [11]
-- Combines LEFT JOIN and RIGHT JOIN
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
UNION
SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;
