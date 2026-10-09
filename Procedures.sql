use bank_churn; 

SELECT * FROM BANK_CUSTOMER_DETAILS; 

-- CREATING A PROCEDURE

DELIMITER //
CREATE PROCEDURE france_customers_1()
BEGIN
    SELECT * FROM BANK_CUSTOMER_DETAILS WHERE geography = 'france';
END //
DELIMITER ;

call spain_customers_1();

-- ---------- Another example

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    salary DECIMAL(10,2)
);
 
DELIMITER //

CREATE PROCEDURE add_employee2(
    IN p_emp_id INT,
    IN p_emp_name VARCHAR(100),
    IN p_emp_salary DECIMAL(10,2)
)
BEGIN
    INSERT INTO Employees (emp_id, emp_name, emp_salary)
    VALUES (p_emp_id, p_emp_name, p_emp_salary);
END //

DELIMITER ;
DESCRIBE Employees;
CALL add_employee2(101, 'Ramesh', 100000);
 
DELIMITER ;

call add_employee1(101, "Ramesh", 100000);

-- widnows functions 

SELECT * FROM BANK_CUSTOMER_DETAILS;
select CustomerID, SUM(CreditScore) OVER(ORDER BY Geography) AS SUM_CREDITSCORE FROM BANK_CUSTOMER_DETAILS;
 
ALTER TABLE BANK_CUSTOMER_DETAILS 
RENAME TO BANK_CHURN1;

 SELECT CustomerId,
       Geography,
       EstimatedSalary,
       RANK() OVER(ORDER BY EstimatedSalary DESC) AS Salary_Rank
FROM bank_churn1;
 
 SELECT CustomerId,
       Geography,
       EstimatedSalary,
       DENSE_RANK() OVER(ORDER BY EstimatedSalary DESC) AS Salary_Rank
FROM bank_churn1;
 