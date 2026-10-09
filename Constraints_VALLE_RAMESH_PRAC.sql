use calibo_practice_1; 
show tables; 

CREATE TABLE EMPLOYEE 
( EMPLOYEE_ID INT AUTO_INCREMENT PRIMARY KEY,  
EMPLOYEE_NAME VARCHAR(50) NOT NULL,
EMPLOYEE_SALARY DECIMAL(10,2) CHECK (EMPLOYEE_SALARY > 10000),
DEPARTMENT_ID INT,
FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT(DEPARTMENT_ID)); 

ALTER TABLE EMPLOYEE 
MODIFY EMPLOYEE_NAME VARCHAR(50);

ALTER TABLE EMPLOYEE 
MODIFY EMPLOYEE_SALARY DECIMAL(10,2) CHECK(EMPLOYEE_SALARY > 10000);

ALTER TABLE EMPLOYEE 
MODIFY EMPLOYEE_SALARY DECIMAL(10,2);

SELECT CONSTRAINT_NAME,
       CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'calibo_practice_1'
AND TABLE_NAME = 'employee';

SELECT CONSTRAINT_NAME,
       CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'calibo_practice_1'
AND TABLE_NAME = 'department';

-- Adding constraint 

ALTER TABLE EMPLOYEE 
ADD CONSTRAINT EMPLOYEE_EMPLOYEE_CHK CHECK(EMPLOYEE_SALARY > 10000);

SELECT cc.CONSTRAINT_NAME, cc.CHECK_CLAUSE
FROM INFORMATION_SCHEMA.CHECK_CONSTRAINTS cc;

SELECT * FROM EMPLOYEE;

DESCRIBE EMPLOYEE;

CREATE TABLE DEPARTMENT (
	DEPARTMENT_ID INT PRIMARY KEY,
    DEPARTMENT_NAME VARCHAR(50), 
    DEPARTMENT_MANAGER VARCHAR(50));
    
INSERT INTO DEPARTMENT (DEPARTMENT_ID,DEPARTMENT_NAME,DEPARTMENT_MANAGER) 
VALUES (101,"IT","JOHN"),
		(102,"CSE","RAM"),
        (103,"FINANCE","KIRAN");
        
-- ------------------------------------------------------------------------------------- 
-- Constraints 

-- 1.How do you create a table with a PRIMARY KEY constraint on a single column?

CREATE TABLE EMPLOYEE_1( ID INT PRIMARY KEY);
DROP TABLE EMPLOYEE_1;

-- 2.Write a SQL query to add a PRIMARY KEY constraint to an existing table.

CREATE TABLE EMPLOYEE_1( ID INT); 

ALTER TABLE EMPLOYEE_1
ADD CONSTRAINT EMPLOYEE_1_ID_PK PRIMARY KEY(ID); 

-- 3.How do you create a composite PRIMARY KEY constraint on multiple columns?
DROP TABLE EMPLOYEE_1;

CREATE TABLE EMPLOYEE_1( ID INT, NAME VARCHAR(50), PRIMARY KEY(ID,NAME) );

-- 4.Write a SQL query to add a FOREIGN KEY constraint to an existing table.

ALTER TABLE EMPLOYEE_1 
ADD COLUMN DEPARTMENT_ID int;

ALTER TABLE EMPLOYEE_1
ADD CONSTRAINT EMPLOYEE_1_DEPARTMENT_ID_FK FOREIGN KEY(DEPARTMENT_ID) REFERENCES DEPARTMENT(DEPARTMENT_ID); 

-- 5  5.Write a SQL query to drop a PRIMARY KEY constraint from a table.
ALTER TABLE EMPLOYEE_1
DROP PRIMARY KEY;

-- 6.How do you create a UNIQUE constraint on a column in a table?
ALTER TABLE EMPLOYEE_1
ADD CONSTRAINT EMPLOYEE_1_Name_UQ UNIQUE(Name);

-- 7.Write a SQL query to drop a UNIQUE constraint from a table.

ALTER TABLE EMPLOYEE_1
DROP INDEX EMPLOYEE_1_Name_UQ; 

-- 8.How do you enforce the NOT NULL constraint on a column?

CREATE TABLE students (
    FIRSTNAME VARCHAR(50) NOT NULL
);

-- 9.Write a SQL query to modify an existing column to enforce the NOT NULL constraint.

ALTER TABLE EMPLOYEE_1
MODIFY NAME VARCHAR(50) NOT NULL;

-- 10.How do you define a DEFAULT constraint for a column?

CREATE TABLE Q1(
 NAME VARCHAR(50) DEFAULT "RAMESH"
 );
DROP TABLE Q1;

-- 11.Write a SQL query to alter an existing column to add a DEFAULT constraint.

ALTER TABLE EMPLOYEE_1
MODIFY COLUMN NAME VARCHAR(50) DEFAULT "RAMESH";

-- 12.How do you add a CHECK constraint to a table to ensure values fall within a specific range?
CREATE TABLE Q1(
 NAME VARCHAR(50) DEFAULT "RAMESH",
 AGE INT CHECK (AGE < 18)
 ); 
 
 -- 13.Write a SQL query to drop a CHECK constraint from a table.
 ALTER TABLE Q1 
 DROP CONSTRAINT chk_AGE;
 
 ALTER TABLE Q1 
 MODIFY AGE INT; 
 
-- 14.How do you disable all constraints on a table temporarily?

-- ALTER TABLE students2 DISABLE CONSTRAINTS pk_students;

-- 15.Write a SQL query to re-enable all previously disabled constraints on a table.

-- ALTER TABLE students ENABLE CONSTRAINT pk_students; 

-- 16.Write a SQL query to rename an existing constraint. 

ALTER TABLE Q1
MODIFY AGE INT DEFAULT 18; -- MODIFY COLUMN_NAME NEW_DATATYPE NEW_CONSTRAINT.

-- 17.How do you enforce a constraint to ensure that a column's value matches a predefined list of values?
ALTER TABLE Q1
ADD COLUMN GENDER CHAR(6);

ALTER TABLE Q1
ADD CONSTRAINT chk_gender
CHECK (gender IN ('Male', 'Female'));

-- 18.Write a SQL query to add a constraint that ensures a column's value is always greater than a certain threshold.

ALTER TABLE Q1
ADD CONSTRAINT Q1_AGE_CHK CHECK(AGE > 25);

-- 19.How do you ensure that a column's value is based on a calculation involving other columns in the same row?

ALTER TABLE Q1
ADD COLUMN basic_salary DECIMAL(10,2);

ALTER TABLE Q1
ADD COLUMN bonus DECIMAL(10,2);

ALTER TABLE Q1
ADD COLUMN TOTAL_SALARY DECIMAL(10,2);

ALTER TABLE Q1
ADD CONSTRAINT chk_salary
CHECK (total_salary = basic_salary + bonus);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 