-- Create CompanyDB database (optional)
CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;

-- 1. & 2. Create Departments table (Parent)
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(55) NOT NULL
);

-- 3. & 4. & 7. Create Employees table (Child) with Foreign Key and ON DELETE CASCADE
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(55) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
    ON DELETE CASCADE
);

-- 5. Insert valid records
INSERT INTO departments (department_id, department_name) VALUES (1, 'HR');
INSERT INTO departments (department_id, department_name) VALUES (2, 'Engineering');
INSERT INTO employees (employee_id, employee_name, department_id) VALUES (101, 'Alice', 1);
INSERT INTO employees (employee_id, employee_name, department_id) VALUES (102, 'Bob', 2);

-- 6. Attempt invalid insert (Error: Cannot add child row)
-- INSERT INTO employees (employee_id, employee_name, department_id) VALUES (103, 'Charlie', 99);

-- 7. Test ON DELETE CASCADE
-- Deleting department 1 (HR) will automatically delete employee 101 (Alice)
DELETE FROM departments WHERE department_id = 1;

-- Verification
SELECT * FROM departments; -- Shows only Engineering
SELECT * FROM employees;   -- Shows only Bob (102)

