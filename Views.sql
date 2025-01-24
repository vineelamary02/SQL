CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees1 (EmployeeID, FirstName, LastName, Department, Salary)
VALUES
(1, 'John', 'Doe', 'IT', 70000),
(2, 'Jane', 'Smith', 'Finance', 80000),
(3, 'Alice', 'Johnson', 'IT', 75000),
(4, 'Bob', 'Brown', 'HR', 60000);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees1(EmployeeID)
);


INSERT INTO Projects (ProjectID, ProjectName, EmployeeID)
VALUES
(101, 'Website Redesign', 1),
(102, 'Budget Analysis', 2),
(103, 'Cloud Migration', 3),
(104, 'Recruitment Drive', 4);

--Create Views Based on the Tables

CREATE VIEW IT_Employees1 AS
SELECT EmployeeID, FirstName, LastName, Salary
FROM Employees1
WHERE Department = 'IT';

SELECT * FROM IT_Employees1;

--. View with Joins: Employees and Their Projects

CREATE VIEW Employees1_Projects AS
SELECT 
    e.EmployeeID, 
    e.FirstName, 
    e.LastName, 
    p.ProjectName
FROM Employees1 e
JOIN Projects p ON e.EmployeeID = p.EmployeeID;

SELECT * FROM Employees1_Projects;


-- Updatable View: Basic Employee Information
CREATE VIEW Basic_Employees1_Info AS
SELECT EmployeeID, FirstName, LastName, Salary
FROM Employees1;

SELECT * FROM Employees1

--Update Through the View:
UPDATE Basic_Employees1_Info
SET Salary = Salary + 5000
WHERE EmployeeID = 1;

SELECT * FROM Employees1;


