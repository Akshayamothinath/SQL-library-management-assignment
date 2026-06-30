CREATE DATABASE companydb;
use companydb;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT,
    Salary INT
);

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

INSERT INTO Employees (EmpID, EmpName, DeptID, Salary)
VALUES
(1, 'Arun', 101, 45000),
(2, 'Bhavya', 102, 52000),
(3, 'Chitra', 101, 47000),
(4, 'Dinesh', 103, 39000),
(5, 'Esha', NULL, 41000),
(6, 'Farhan', 104, 55000);

INSERT INTO Departments (DeptID, DeptName)
VALUES
(101, 'Sales'),
(102, 'HR'),
(103, 'IT'),
(105, 'Marketing');

select * from employees;
select * from departments;

-- Q1. INNER JOIN
SELECT EmpName, DeptName, Salary
FROM Employees
INNER JOIN Departments
ON Employees.DeptID = Departments.DeptID;

-- Q2. LEFT JOIN
SELECT EmpName, DeptName
FROM Employees
LEFT JOIN Departments
ON Employees.DeptID = Departments.DeptID;

-- Q3. RIGHT JOIN
SELECT EmpName, DeptName
FROM Employees
RIGHT JOIN Departments
ON Employees.DeptID = Departments.DeptID;

-- Q4. FULL JOIN (MySQL)
SELECT EmpName, DeptName
FROM Employees
LEFT JOIN Departments
ON Employees.DeptID = Departments.DeptID

UNION

SELECT EmpName, DeptName
FROM Employees
RIGHT JOIN Departments
ON Employees.DeptID = Departments.DeptID;

-- Q5. LEFT ANTI JOIN
SELECT *
FROM Employees
LEFT JOIN Departments
ON Employees.DeptID = Departments.DeptID
WHERE Departments.DeptID IS NULL;

-- Q6. RIGHT ANTI JOIN
SELECT *
FROM Employees
RIGHT JOIN Departments
ON Employees.DeptID = Departments.DeptID
WHERE Employees.EmpID IS NULL;

-- Q7. INNER JOIN (WITHOUT JOIN KEYWORD)
SELECT EmpName, DeptName, Salary
FROM Employees, Departments
WHERE Employees.DeptID = Departments.DeptID;

-- Q8(a). LEFT JOIN WRITTEN AS RIGHT JOIN
SELECT EmpName, DeptName
FROM Departments
RIGHT JOIN Employees
ON Departments.DeptID = Employees.DeptID;

-- Q8(b). RIGHT JOIN WRITTEN AS LEFT JOIN
SELECT EmpName, DeptName
FROM Departments
LEFT JOIN Employees
ON Departments.DeptID = Employees.DeptID;

-- Q9. CROSS JOIN
SELECT EmpName, DeptName
FROM Employees
CROSS JOIN Departments;

-- Q10. SELF JOIN

ALTER TABLE Employees
ADD ManagerID INT;

UPDATE Employees SET ManagerID = 2 WHERE EmpID = 1;
UPDATE Employees SET ManagerID = 4 WHERE EmpID = 2;
UPDATE Employees SET ManagerID = 2 WHERE EmpID = 3;
UPDATE Employees SET ManagerID = NULL WHERE EmpID = 4;
UPDATE Employees SET ManagerID = 2 WHERE EmpID = 5;
UPDATE Employees SET ManagerID = 4 WHERE EmpID = 6;

SELECT
E.EmpName AS Employee,
M.EmpName AS Manager
FROM Employees E
LEFT JOIN Employees M
ON E.ManagerID = M.EmpID;

/*Difference:

LEFT JOIN:
Returns all rows from the left table.
Shows matching rows from the right table.
If there is no match, it shows NULL.

LEFT ANTI JOIN:
Returns only the rows from the left table that have no matching rows in the right table.
It does not return any matching rows.

Why is it called "LEFT JOIN − INNER JOIN"?
Because if you take the LEFT JOIN result and remove all the matching rows
(the INNER JOIN result), only the unmatched rows remain, which is the LEFT ANTI JOIN result.*/





