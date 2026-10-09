SELECT * FROM BANK_CHURN1;

SELECT CustomerId,CreditScore,
      CASE
           WHEN CreditScore >= 750 THEN 'Low Risk'        -- WHEN ACT AS A IF CONDITION, THEN ACT AS A STATEMENT.
           WHEN CreditScore >= 650 THEN 'Medium Risk'
           ELSE 'High Risk'
       END AS RiskCategory
FROM Bank_Churn1;

-- IF AGE < 30 CLAASIFY AS YOUNG, 30-50 AS MIDDLE AGE, ABOVE > 50 AS SENIOR AGE. 

SELECT CUSTOMERID, AGE, 
	CASE 
		WHEN AGE < 30 THEN "YOUNG"
        WHEN AGE >= 30 AND AGE < 50 THEN "MIDDLE AGE" 
        ELSE "SENIOR AGE" 
	END AS AGE_CATEROGERY
FROM BANK_CHURN1; 

-- High Churn Risk: Age > 50, Balance > 100000, and Number of Products = 1
-- Medium Churn Risk: Age > 40 and Balance > 50000
-- Low Churn Risk:

SELECT AGE, BALANCE,NUMOFPRODUCTS,
	CASE
		WHEN Age > 50 and Balance > 100000 and NUMOFPRODUCTS = 1 THEN "High Churn Risk"
        WHEN Age > 40 and Balance > 50000 THEN "Medium Churn Risk"
        ELSE "Low Churn Risk"
    END AS RISK_CATEOGERY
FROM BANK_CHURN1;
 
-- A bank wants to analyze customer churn and understand how many customers have left the bank versus how many are still active.

SELECT CUSTOMERID, EXITED,
	CASE 
		WHEN EXITED = 1 THEN "CHURNED"
        WHEN EXITED = 0 THEN "RETAINED"
	END AS EXITED_OR_NOT
FROM BANK_CHURN1;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------
-- CTE
 
WITH CustomerBalance AS
(
 SELECT CUSTOMERID,BALANCE AS TOP10_CUSTOMER_BALANCE
 FROM BANK_CHURN1 ORDER BY BALANCE DESC LIMIT 10 
 )
SELECT * FROM CustomerBalance;