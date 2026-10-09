USE CALIBO_PRACTICE_1;

-- ### Data Definition Language (DDL):
-- 1. Create a table named `Employees` with columns for `EmployeeID`, `FirstName`, `LastName`, `Department`, and `Salary`.

CREATE TABLE EMPLOYEES_C3(
	EMPLOYEE_ID INT PRIMARY KEY, 
    FIRSTNAME VARCHAR(30) NOT NULL,
    LASTNAME VARCHAR(30),
    DEPARTMENT VARCHAR(50),
    SALARY DECIMAL(10,2));


-- 2. Add a column named `HireDate` to the `Employees` table.

ALTER TABLE EMPLOYEES_C3
ADD COLUMN HIREDATE DATE DEFAULT (2026-01-01);

-- 3. Rename the column `Department` in the `Employees` table to `Dept`.

ALTER TABLE EMPLOYEES_C3
CHANGE COLUMN DEPARTMENT DEPT VARCHAR(50);

-- 4. Remove the column `Salary` from the `Employees` table.

ALTER TABLE EMPLOYEES_C3
DROP COLUMN SALARY;

-- 5. Create a new table named `Departments` with columns for `DeptID` and `DeptName`.

CREATE TABLE DEPARTMENT_C3(
	DEPARTMENT_ID INT, 
    DEPTNAME VARCHAR(30) NOT NULL);
    
-- 6. Add a primary key constraint to the `DeptID` column in the `Departments` table.

ALTER TABLE DEPARTMENT_C3
MODIFY DEPARTMENT_ID INT PRIMARY KEY;

ALTER TABLE EMPLOYEES_C3
MODIFY DEPT INT;

-- 7. Create a foreign key constraint on the `Employees` table that references the `DeptID` column in the `Departments` table.

ALTER TABLE EMPLOYEES_C3
ADD CONSTRAINT DEPT_FK FOREIGN KEY(DEPT) REFERENCES DEPARTMENT_C3(DEPARTMENT_ID);

-- ----------------------------------------------------------------------------------------------

-- ### Data Manipulation Language (DML):
SELECT * FROM EMPLOYEES_C3;
ALTER TABLE EMPLOYEES_C3
ADD COLUMN SALARY DECIMAL(10,2);

CREATE TABLE EMPLOYEES_C31(
	EMPLOYEE_ID INT PRIMARY KEY, 
    FIRSTNAME VARCHAR(30) NOT NULL,
    LASTNAME VARCHAR(30),
    DEPARTMENT VARCHAR(50),
    SALARY DECIMAL(10,2),
    HIREDATE DATE);

-- 1. Insert a new employee into the `Employees` table with the following details: EmployeeID = 101, FirstName = "John", LastName = "Doe", Dept = "IT", Salary = 60000, HireDate = '2024-05-14'.

INSERT INTO EMPLOYEES_C31(EMPLOYEE_ID, FIRSTNAME, LASTNAME, DEPARTMENT, SALARY, HIREDATE) VALUES ( 101, "JOHN", "DOE", "IT", 6000, "2024-05-14");

-- 2. Update the salary of employee with `EmployeeID` 101 to 65000.

UPDATE EMPLOYEES_C31 SET SALARY = 65000 WHERE EMPLOYEE_ID = 101;

-- 3. Delete the employee with `EmployeeID` 101 from the `Employees` table.

DELETE FROM EMPLOYEES_C31 WHERE EMPLOYEE_ID = 101;
-- ----------------------------------------------------------------------------------------------
-- ### Constraints:
DROP TABLE EMPLOYEES_C31;


-- 1. Create a table named `Students` with columns for `StudentID`, `FirstName`, `LastName`, and `DateOfBirth`.

CREATE TABLE STUDENT_C31(
	STUDENT_ID INT PRIMARY KEY, 
    FIRSTNAME VARCHAR(30) NOT NULL,
    LASTNAME VARCHAR(30),
    DATEOFBIRTH DATE);
    
-- 2. Add a NOT NULL constraint to the `FirstName` column in the `Students` table.

ALTER TABLE STUDENT_C31
MODIFY LASTNAME VARCHAR(50) NOT NULL;

-- 3. Add a UNIQUE constraint to the `StudentID` column in the `Students` table.

ALTER TABLE STUDENT_C31
ADD CONSTRAINT STU_ID_UNQ UNIQUE(STUDENT_ID);

-- 4. Create a CHECK constraint on the `DateOfBirth` column in the `Students` table to ensure that dates are not in the future.

ALTER TABLE STUDENT_C31
ADD CONSTRAINT STU_DB_CK CHECK (DATEOFBIRTH < "2026-08-17");

-- 5. Add a DEFAULT constraint to the `LastName` column in the `Students` table, setting it to "Doe" by default.

ALTER TABLE STUDENT_C31
MODIFY LASTNAME VARCHAR(50) DEFAULT "DOE"; 
