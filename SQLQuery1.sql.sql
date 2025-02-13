-- Create Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Age INT,
    Position NVARCHAR(50),
    Salary DECIMAL(10, 2),
    DepartmentID INT
);

-- Insert Data into Employees
INSERT INTO Employees (EmployeeID, Name, Age, Position, Salary, DepartmentID)
VALUES 
    (1, 'Alice', 30, 'Manager', 80000, 101),
    (2, 'Bob', 25, 'Developer', 60000, 102),
    (3, 'Charlie', 35, 'Analyst', 70000, 103),
    (4, 'Diana', 28, 'Assistant', 50000, NULL),
    (5, 'Emma', 32, 'Team Lead', 85000, 101),
    (6, 'Frank', 40, 'Developer', 62000, 102);

-- Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50),
    Location NVARCHAR(50)
);

-- Insert Data into Departments
INSERT INTO Departments (DepartmentID, DepartmentName, Location)
VALUES 
    (101, 'HR', 'New York'),
    (102, 'IT', 'San Francisco'),
    (103, 'Finance', 'Chicago'),
    (104, 'Marketing', 'Boston'),
    (105, 'Sales', 'Seattle');


select * from Employees
select * from Departments

SELECT 
    Employees.Name AS EmployeeName,
    Employees.Age,
    Employees.Position,
    Employees.Salary,
    Departments.DepartmentName,
    Departments.Location
FROM 
    Employees
INNER JOIN 
    Departments
ON 
    Employees.DepartmentID = Departments.DepartmentID;



	SELECT 
    Employees.Name AS EmployeeName,
    Departments.DepartmentName,
    Departments.Location
FROM 
    Employees
LEFT JOIN 
    Departments
ON 
    Employees.DepartmentID = Departments.DepartmentID;


	SELECT 
    Employees.Name AS EmployeeName,
    Departments.DepartmentName,
    Departments.Location
FROM 
    Employees
RIGHT JOIN 
    Departments
ON 
    Employees.DepartmentID = Departments.DepartmentID;


	SELECT 
    Employees.Name AS EmployeeName,
    Departments.DepartmentName,
    Departments.Location
FROM 
    Employees
FULL OUTER JOIN 
    Departments
ON 
    Employees.DepartmentID = Departments.DepartmentID;


	SELECT 
    Employees.Name AS EmployeeName,
    Departments.DepartmentName,
    Departments.Location
FROM 
    Employees
CROSS JOIN 
    Departments;


--Count Employees in Each Department
	SELECT 
    Departments.DepartmentName,
    COUNT(Employees.EmployeeID) AS EmployeeCount
FROM 
    Departments
LEFT JOIN 
    Employees
ON 
    Departments.DepartmentID = Employees.DepartmentID
GROUP BY 
    Departments.DepartmentName;

--Find Employees with Salary Greater than $70,000
SELECT 
    Name,
    Position,
    Salary
FROM 
    Employees
WHERE 
    Salary > 70000;

--Calculate Average Salary per Department

SELECT 
    Departments.DepartmentName,
    AVG(Employees.Salary) AS AverageSalary
FROM 
    Employees
INNER JOIN 
    Departments
ON 
    Employees.DepartmentID = Departments.DepartmentID
GROUP BY 
    Departments.DepartmentName;

--Find Departments with No Employees

SELECT 
    DepartmentName,
    Location
FROM 
    Departments
WHERE 
    DepartmentID NOT IN (SELECT DISTINCT DepartmentID FROM Employees);

--Find the Highest Paid Employee in Each Department

SELECT 
    Departments.DepartmentName,
    Employees.Name AS EmployeeName,
    MAX(Employees.Salary) AS MaxSalary
FROM 
    Employees
INNER JOIN 
    Departments
ON 
    Employees.DepartmentID = Departments.DepartmentID
GROUP BY 
    Departments.DepartmentName;

--Get Employees by Age Group

SELECT 
    Name,
    Age,
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        ELSE 'Above 40'
    END AS AgeGroup
FROM 
    Employees;

--Order Employees by Salary (Descending)

SELECT 
    Name,
    Position,
    Salary
FROM 
    Employees
ORDER BY 
    Salary DESC;










