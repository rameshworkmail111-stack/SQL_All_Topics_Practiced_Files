use CALIBO_PRACTICE_1;

-- Data Definition Language (DDL):

-- 1  Create a table named "Students" with columns: StudentID (int), FirstName (varchar), LastName (varchar), and Age (int).

CREATE TABLE STUDENTS2 (
	ID INT PRIMARY KEY, 
    FIRSTNAME VARCHAR(30) NOT NULL,
    LASTNAME VARCHAR(30) NOT NULL,
    AGE INT );
    
-- 2  Add a new column "Gender" of type varchar to the "Students" table.

ALTER TABLE Students2 ADD COLUMN Gender VARCHAR(20);

-- 3 Rename the "Age" column to "StudentAge" in the "Students" table.

ALTER TABLE Students2 RENAME COLUMN AGE TO StudentAge;

-- 4 Drop the "Gender" column from the "Students" table.

ALTER TABLE Students2 DROP COLUMN Gender;
-- -----------------------------------------------------------------------------------------
-- DML ( Data Manipulation Language (DML)):
-- 1  1.Insert a new student with StudentID 1, FirstName "John", LastName "Doe", Age 25 into the "Students" table.

INSERT INTO Students2 (ID, FirstName, LastName, StudentAge) VALUES (1, 'John', 'Doe', 25);

-- 2  Update the age of the student with StudentID 1 to 26.

UPDATE Students2 SET StudentAge = 26 WHERE ID = 1; 

-- 3 Delete the student with StudentID 1 from the "Students" table.

DELETE FROM Students2 WHERE ID = 1; 

-- 4 Insert multiple students into the "Students" table in a single query.

INSERT INTO Students2 (ID, FirstName, LastName, StudentAge) VALUES (1, 'John', 'Doe', 25), (2, 'Jane', 'Smith', 22), (3, 'Mike', 'Brown', 17);

-- 5.Update the LastName of all students whose FirstName is "John" to "Smith". 

SET SQL_SAFE_UPDATES = 0;
UPDATE Students2 SET LastName = 'Smith' WHERE FirstName = 'John'; 

-- 6.Delete all students whose age is less than 18.

DELETE FROM Students2 WHERE StudentAge < 18; 

-- 7.Insert a new course with CourseID 1, CourseName "Mathematics", and Instructor "Professor X" into the "Courses" table. 

CREATE TABLE Courses1 (CourseID INT PRIMARY KEY, CourseName VARCHAR(50), Instructor VARCHAR(50)); 

-- 8.Update the Instructor of the course with CourseID 1 to "Professor Y".

INSERT INTO Courses1 (CourseID, CourseName, Instructor) VALUES (1, 'Mathematics', 'Professor X'); 
UPDATE Courses1 SET Instructor = 'Professor Y' WHERE CourseID = 1; 

-- 9.Delete the course with CourseID 1 from the "Courses" table.

DELETE FROM Courses1 WHERE CourseID = 1; 

-- 10.Truncate the data in the "Students" table.

TRUNCATE TABLE Students2;

-- 11.Drop the "Courses" table. 
 
DROP TABLE Courses; 
-- ----------------------------------------------------------------------------------------------
-- Retrival 
DROP TABLE STUDENTS;
CREATE TABLE Students (ID INT PRIMARY KEY, FirstName VARCHAR(30), LastName VARCHAR(30), Age INT);

INSERT INTO Students (ID, FirstName, LastName, Age) VALUES (1, 'John', 'Doe', 25);
INSERT INTO Students (ID, FirstName, LastName, Age) VALUES (2, 'Jane', 'Smith', 22), (3, 'Mike', 'Brown', 17);

-- 1.Retrieve all columns from the "Students" table.
SELECT * FROM STUDENTS;

-- 2.Retrieve only the FirstName and LastName columns from the "Students" table.
SELECT FirstName, LastName FROM STUDENTS;

-- 3.Retrieve distinct values of the LastName column from the "Students" table. 

SELECT distinct LastName FROM STUDENTS;

-- 4.Retrieve all students aged 20 or above.

SELECT * FROM STUDENTS WHERE AGE > 20;

-- 5.Retrieve all students whose last name starts with 'S'.

select * from students where lastname like "s%" ;

-- 6.Retrieve all students whose first name contains the letter 'a'.
 
select * from students where lastname like "a%"; 

-- 7.Retrieve the oldest student from the "Students" table.
select max(age) from students;

-- 8.Retrieve the count of students in the "Students" table.
select count(id) from students;

-- 9.Retrieve the total number of students grouped by age.

select count(ID),Age from students GROUP BY age;

-- 10.Retrieve the average age of students.

SELECT AVG(AGE) FROM STUDENTS;

-- 11.Retrieve all students sorted by age in ascending order.

SELECT * FROM STUDENTS ORDER BY AGE ASC;

-- 12.Retrieve all students sorted by age in descending order. 

SELECT * FROM STUDENTS ORDER BY AGE DESC;

-- 13.Retrieve the top 5 oldest students. 

SELECT * FROM STUDENTS ORDER BY AGE DESC limit 5;

-- 14.Retrieve the 10 youngest students.

SELECT * FROM STUDENTS ORDER BY AGE ASC limit 10;

-- 15.Retrieve the students aged between 20 and 30.

 SELECT * FROM Students WHERE Age BETWEEN 20 AND 30;
 
 -- 16. Retrieve the count of students. 
 
 SELECT COUNT(id) AS StudentCount FROM Students;

-- 17.Retrieve the total number of courses.

SELECT COUNT(*) AS CourseCount FROM Courses1;

-- 18.Retrieve the average age of students.

SELECT AVG(Age) AS Average_Age FROM Students; 

-- 19.Retrieve the maximum age of students.

 SELECT MAX(Age) AS MaximumAge FROM Students; 
 
 -- 20.Retrieve the minimum age of students.
 
 SELECT MIN(Age) AS MinimumAge FROM Students; 
 
 -- 21.Retrieve the count of students grouped by age.

SELECT Age, COUNT(ID) AS StudentCount FROM Students GROUP BY Age ORDER BY Age;

-- 22.Retrieve the number of courses taught by each instructor.

SELECT Instructor, COUNT(*) AS CourseCount FROM Courses1 GROUP BY Instructor; 

-- ---------------------------------------------------------------------------
ALTER TABLE COURSES1 
ADD COLUMN AGE INT;

SELECT * FROM COURSES1;

INSERT INTO COURSES1(COURSEID, COURSENAME, INSTRUCTOR, AGE) 
VALUES (101, "CSE", "JOHN", 20), 
(102, "ECE", "DAVID", 22),
(103, "EEE", "ROBERT", 21),
(104, "MECH", "MICHAEL", 24),
(105, "CIVIL", "JAMES", 23),
(106, "IT", "WILLIAM", 25),
(107, "AI", "DANIEL", 20),
(108, "DS", "THOMAS", 22),
(109, "ML", "JOSEPH", 26),
(110, "CS", "CHARLES", 21),
(111, "CYBER", "CHRISTOPHER", 23),
(112, "CLOUD", "MATTHEW", 24),
(113, "IOT", "ANTHONY", 22),
(114, "BLOCKCHAIN", "MARK", 27),
(115, "DEVOPS", "STEVEN", 25),
(116, "FULLSTACK", "ANDREW", 23);

-- 23.Retrieve the average age of students enrolled in each course. 

SELECT COURSENAME, AVG(AGE) FROM COURSES1 GROUP BY COURSENAME;

-- 24.Retrieve the oldest student enrolled in each course. 

SELECT MAX(AGE) AS OLDEST_AGE FROM COURSES1;

-- 25.Retrieve the youngest student enrolled in each course.

SELECT MIN(AGE) AS YOUNGEST_AGE FROM COURSES1;

-- 26. Retrieve the number of male and female students. 

SELECT COUNT(ID), GENDER FROM STUDENTS1 GROUP BY GENDER;

SELECT * FROM STUDENTS1;

INSERT INTO STUDENTS1 (ID, FIRSTNAME, LASTNAME, AGE, GENDER)
VALUES
(1, 'Ramesh', 'Kumar', 22, 'Male'),
(2, 'Suresh', 'Reddy', 24, 'Male'),
(3, 'Priya', 'Sharma', 21, 'Female'),
(4, 'Anjali', 'Rao', 23, 'Female'),
(5, 'Arjun', 'Patel', 25, 'Male'),
(6, 'Sneha', 'Verma', 20, 'Female'),
(7, 'Rahul', 'Singh', 27, 'Male'),
(8, 'Kavya', 'Nair', 22, 'Female'),
(9, 'Vikram', 'Das', 26, 'Male'),
(10, 'Pooja', 'Reddy', 24, 'Female'),
(11, 'Kiran', 'Kumar', 28, 'Male'),
(12, 'Divya', 'Patel', 21, 'Female'),
(13, 'Akhil', 'Sharma', 23, 'Male'),
(14, 'Neha', 'Gupta', 25, 'Female'),
(15, 'Manoj', 'Rao', 29, 'Male'),
(16, 'Swathi', 'Nair', 22, 'Female'),
(17, 'Rohit', 'Verma', 26, 'Male'),
(18, 'Lakshmi', 'Das', 30, 'Female'),
(19, 'Varun', 'Singh', 24, 'Male'),
(20, 'Meena', 'Gupta', 27, 'Female');

-- 27.Retrieve the count of students whose age is less than 25.

SELECT COUNT(ID) FROM STUDENTS1 WHERE AGE < 25 ;

-- 28.Retrieve the count of students whose age is between 20 and 30 

SELECT COUNT(ID) FROM STUDENTS1 WHERE AGE BETWEEN 20 AND 30 ; 

-- 29.Retrieve the average age of students whose last name starts with 'S'. 

SELECT AVG(AGE) FROM STUDENTS1 WHERE LASTNAME LIKE "S%";

-- 30. Retrieve the count of students whose first name contains the letter 'a'. 

SELECT COUNT(ID) FROM STUDENTS1 WHERE FIRSTNAME LIKE "%S%";

