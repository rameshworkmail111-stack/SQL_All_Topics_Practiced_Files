create database subqueries_data;

-- Creating tables

CREATE TABLE Employees (
   EmployeeID INT PRIMARY KEY,
   Name VARCHAR(50),
   Age INT,
   DepartmentID INT,
   Salary DECIMAL,
   ManagerID INT,
   FOREIGN KEY(DepartmentID) REFERENCES Departments(DepartmentID),
   FOREIGN KEY(ManagerID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Employees (EmployeeID, Name, Age, DepartmentID, Salary, ManagerID) VALUES
(1, 'Alice', 30, 1, 60000, NULL),
(2, 'Bob', 45, 1, 80000, 1),
(3, 'Charlie', 28, 2, 40000, 1),
(4, 'David', 35, 2, 50000, 2),
(5, 'Eve', 40, 3, 90000, NULL),
(6, 'Frank', 25, 3, 45000, 5);
 
CREATE TABLE Departments (
   DepartmentID INT PRIMARY KEY,
   DepartmentName VARCHAR(50)
);
 
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Sales'),
(2, 'Engineering'),
(3, 'HR');
 
CREATE TABLE Projects (
   ProjectID INT PRIMARY KEY,
   ProjectName VARCHAR(50),
   DepartmentID INT, 
   FOREIGN KEY(DEPARTMENTID) REFERENCES Departments (DepartmentID)
);
 
INSERT INTO Projects (ProjectID, ProjectName, DepartmentID) VALUES
(1, 'Project A', 1),
(2, 'Project B', 2),
(3, 'Project C', 3);
INSERT INTO Projects (ProjectID, ProjectName, DepartmentID) VALUES (4,Null,Null);
 
CREATE TABLE ProjectAssignments (
   ProjectID INT,
   EmployeeID INT,
   PRIMARY KEY (ProjectID, EmployeeID),
   FOREIGN KEY (PROJECTID) REFERENCES Projects (ProjectID),
   FOREIGN KEY (EmployeeID) REFERENCES Employees ( EmployeeID )
);
 
INSERT INTO ProjectAssignments (ProjectID, EmployeeID) VALUES
(1, 1),
(2, 3),
(2, 4),
(3, 5),
(3, 6);


CREATE TABLE Customers (
   CustomerID INT PRIMARY KEY,
   CustomerName VARCHAR(50),
   City VARCHAR(50)
);
 
INSERT INTO Customers (CustomerID, CustomerName, City) VALUES
(1, 'Customer A', 'New York'),
(2, 'Customer B', 'Los Angeles'),
(3, 'Customer C', 'Chicago');
 
CREATE TABLE Orders (
   OrderID INT PRIMARY KEY,
   CustomerID INT,
   OrderDate DATE,
   TotalAmount DECIMAL,
   FOREIGN KEY (CUSTOMERID) REFEReNCES Customers (CustomerID)
);
 
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 1, '2023-01-10', 500),
(2, 1, '2023-02-15', 1200),
(3, 2, '2023-03-05', 700),
(4, 3, '2023-04-20', 1500);
 
CREATE TABLE OrderDetails (
   OrderDetailID INT PRIMARY KEY,
   OrderID INT,
   ProductID INT,
   Quantity INT,
   UnitPrice DECIMAL,
   FOREIGN KEY (ORDERID) REFERENCES Orders (OrderID),
   FOREIGN KEY (PRODUCTID) REFERENCES Products ( ProductID )
);
 
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 2, 250),
(2, 2, 2, 3, 400),
(3, 3, 1, 1, 700),
(4, 4, 3, 5, 300);
 
CREATE TABLE Products (
   ProductID INT PRIMARY KEY,
   ProductName VARCHAR(50),
   Price DECIMAL
);
 
INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Product X', 250),
(2, 'Product Y', 400),
(3, 'Product Z', 300);
 
-- checking the tables
 
select * from Employees;
select * from Departments;
select * from Customers;
select *  from OrderDetails;
select * from Orders;
select * from Projects;
select * from ProjectAssignments;
select * from Products;

-- Find the employees working in the 'Sales' department 

select * from employees where DEPARTMENTID IN 
(SELECT DEPARTMENTID FROM DEPARTMENTS WHERE DEPARTMENTNAME = "SALES" ) ;

-- Find the departments with the highest average salary

SELECT DepartmentID, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentID
HAVING AVG(Salary) = (
   SELECT Max(AvgSalary)
   FROM (SELECT AVG(Salary) AS AvgSalary FROM Employees GROUP BY DepartmentID) AS DeptavgSalaries
);

-- List the projects that have no employees assigned 
select * from ProjectAssignments;

SELECT * FROM PROJECTS WHERE PROJECTID NOT IN ( 
SELECT PROJECTID FROM PROJECTASSIGNMENTS);

-- CUSTOMERS WHO HAVE PLACES ORDERS WORTH MORE THAN 1000 

select * from Customers;
select *  from OrderDetails;
select * from Orders;

select * FROM CUSTOMERS WHERE CUSTOMERID IN (
SELECT CUSTOMERID FROM ORDERS WHERE TOTALAMOUNT > 1000);

-- List employees who work on more than one project
select * from Employees;
select * from Projects;
select * from ProjectAssignments;

select EmployeeID, count(EmployeeID) from ProjectAssignments group by EmployeeID HAVING count(EmployeeID) > 1;

-- Find the average salary of employees who are older than the average age 

SELECT AVG(SALARY) AS AVERAGE_SALARY FROM 
(SELECT SALARY FROM EMPLOYEES WHERE Age > (
    SELECT AVG(Age) AS AVERAGE_AGE FROM Employees ))AS E;