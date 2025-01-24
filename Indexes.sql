CREATE TABLE Employees2 (
    EmployeeID INT PRIMARY KEY,    --Here Clustered Index automatically created
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    Email VARCHAR(100) UNIQUE,     -- Unique Index
    Gender CHAR(1),                -- Bitmap Index
    HireDate DATE,
    ManagerID INT
);

-- Inserting rows into the Employees table for demonstration
INSERT INTO Employees2 (EmployeeID, FirstName, LastName, Department, Salary, Email, Gender, HireDate, ManagerID)
VALUES 
(1, 'John', 'Doe', 'IT', 75000, 'john.doe@example.com', 'M', '2020-01-10', NULL),
(2, 'Jane', 'Smith', 'HR', 65000, 'jane.smith@example.com', 'F', '2021-02-20', 1),
(3, 'Alice', 'Johnson', 'Finance', 90000, 'alice.johnson@example.com', 'F', '2020-03-15', 1),
(4, 'Bob', 'Brown', 'IT', 80000, 'bob.brown@example.com', 'M', '2021-04-22', 1),
(5, 'Charlie', 'Davis', 'Finance', 82000, 'charlie.davis@example.com', 'M', '2020-05-25', 3),
(6, 'Diana', 'Garcia', 'IT', 70000, 'diana.garcia@example.com', 'F', '2021-06-10', 4),
(7, 'Eve', 'Miller', 'HR', 68000, 'eve.miller@example.com', 'F', '2021-07-19', 2),
(8, 'Frank', 'Wilson', 'Finance', 95000, 'frank.wilson@example.com', 'M', '2020-08-29', 3),
(9, 'Grace', 'Moore', 'IT', 74000, 'grace.moore@example.com', 'F', '2021-09-30', 4),
(10, 'Hannah', 'Taylor', 'Finance', 88000, 'hannah.taylor@example.com', 'F', '2020-10-12', 3)

CREATE NONCLUSTERED INDEX idx_dept_salary 
ON Employees2 (Department, Salary);

CREATE INDEX idx_gender
ON Employees2 (Gender);

SELECT * 
FROM Employees2              --clustered index
WHERE EmployeeID >= 5;


SELECT * 
FROM Employees2                --non-clustered index
WHERE LastName = 'Smith';

--Find employees in IT department with salary greater than 70000
SELECT * 
FROM Employees2              --composite index
WHERE Department = 'IT' AND Salary > 70000;

-- Find employee by Email
SELECT * 
FROM Employees2              --Uniqueindex
WHERE Email = 'charlie.davis@example.com';



