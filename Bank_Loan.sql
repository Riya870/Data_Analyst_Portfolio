Create database Bank_Loan;

use Bank_Loan

SELECT * FROM [dbo].[financial_loan]

--Check Null Value and Blank
SELECT  * FROM [dbo].[financial_loan]
WHERE[id] IS NULL OR [id]=''
OR [address_state]IS NULL OR [address_state]=''
OR [application_type]IS NULL OR [application_type]=''
OR [emp_length]IS NULL OR [emp_length]=''
OR [emp_title] IS NULL OR [emp_title]=''
OR [grade]IS NULL OR[grade] =''
OR [home_ownership]IS NULL OR [home_ownership]=''
OR [issue_date]IS NULL OR[issue_date] =''
OR[last_credit_pull_date] IS NULL OR [last_credit_pull_date] =''
OR[last_payment_date] IS NULL OR[last_payment_date] =''
OR[loan_status] IS NULL OR [loan_status]=''
OR [next_payment_date]IS NULL OR[next_payment_date] =''
OR[member_id] IS NULL OR[member_id] =''
OR [purpose]IS NULL OR [purpose]=''
OR [sub_grade]IS NULL OR[sub_grade] =''
OR [term]IS NULL OR[term] =''
OR [verification_status]IS NULL OR [verification_status]=''
OR [annual_income]IS NULL OR[annual_income] =''
OR [dti]IS NULL OR [dti]=''
OR[installment] IS NULL OR[installment] =''
OR [int_rate]IS NULL OR[int_rate] =''
OR [loan_amount]IS NULL OR [loan_amount]=''
OR [total_acc]IS NULL OR [total_acc]=''
OR [total_payment]IS NULL OR[total_payment] ='';


DELETE FROM [dbo].[financial_loan]
WHERE[id] IS NULL OR [id]=''
OR [address_state]IS NULL OR [address_state]=''
OR [application_type]IS NULL OR [application_type]=''
OR [emp_length]IS NULL OR [emp_length]=''
OR [emp_title] IS NULL OR [emp_title]=''
OR [grade]IS NULL OR[grade] =''
OR [home_ownership]IS NULL OR [home_ownership]=''
OR [issue_date]IS NULL OR[issue_date] =''
OR[last_credit_pull_date] IS NULL OR [last_credit_pull_date] =''
OR[last_payment_date] IS NULL OR[last_payment_date] =''
OR[loan_status] IS NULL OR [loan_status]=''
OR [next_payment_date]IS NULL OR[next_payment_date] =''
OR[member_id] IS NULL OR[member_id] =''
OR [purpose]IS NULL OR [purpose]=''
OR [sub_grade]IS NULL OR[sub_grade] =''
OR [term]IS NULL OR[term] =''
OR [verification_status]IS NULL OR [verification_status]=''
OR [annual_income]IS NULL OR[annual_income] =''
OR [dti]IS NULL OR [dti]=''
OR[installment] IS NULL OR[installment] =''
OR [int_rate]IS NULL OR[int_rate] =''
OR [loan_amount]IS NULL OR [loan_amount]=''
OR [total_acc]IS NULL OR [total_acc]=''
OR [total_payment]IS NULL OR[total_payment] ='';

SELECT * FROM [dbo].[financial_loan];

--Calculate the total number of applications
SELECT COUNT([id]) FROM [dbo].[financial_loan]

--MTD Loan Applications
--Calculates the total number of loan applications in December 2021
SELECT COUNT([id]) AS  MTD_Total_Application
FROM [dbo].[financial_loan]
WHERE MONTH(issue_Date) = 12 AND YEAR(issue_Date) = 2021;

--PMTD Loan Applications
-- Calculates the total number of loan applications for the previous month (PMTD - Previous Month to Date).
SELECT COUNT([id]) AS PMTD_Total_Appliactions
from [dbo].[financial_loan]
WHERE MONTH([issue_date]) = 11 AND YEAR([issue_date]) =2021;

-- Total Funded Amount
-- Calculates the total funded amount across all loan applications.
SELECT SUM([loan_amount]) AS Total_Funded_Amount
from [dbo].[financial_loan]

--MTD Total Funded Amount
-- Calculates the Month-to-Date (MTD) total funded amount in December 2021.
SELECT SUM([loan_amount]) AS MTD_Total_Funded_Amount
from [dbo].[financial_loan]
where MONTH([issue_date])=12 AND YEAR([issue_date])=2021;

--PMTD Total Funded Amount
-- Calculates the total funded amount for the previous month (PMTD - Previous Month to Date).
SELECT SUM([loan_amount]) AS PMTS_Total_Funded_Amount
from [dbo].[financial_loan]
WHERE MONTH([issue_date])= 11 AND  YEAR([issue_date]) = 2021;

--Total Amount Received
-- Calculates the total amount collected from loan payments.
SELECT SUM([total_payment]) AS Total_Amount_Collected
FROM [dbo].[financial_loan]

--MTD Total Amount Received
-- Calculates the Month-to-Date (MTD) total amount collected from loan payments in December 2021.
SELECT SUM([total_payment]) AS MTD_Total_Amount_Collected
from [dbo].[financial_loan]
WHERE MONTH([issue_date]) = 12 AND YEAR([issue_date]) = 2021

--PMTD Total Amount Received
-- Calculates the Previous Month-to-Date (PMTD) total amount collected from loan payments.
SELECT SUM([total_payment]) AS PMTD_Total_Amount_Collected
from [dbo].[financial_loan]
WHERE MONTH([issue_date]) = 11 AND YEAR([issue_date])= 2021;

--Average Interest Rate
-- Calculates the average interest rate across all loan applications.
SELECT AVG([int_rate])* 100 AS Avg_Int_Rate
FROM [dbo].[financial_loan]

--.MTD Average Interest
-- Calculates the Month-to-Date (MTD) average interest rate for loan applications in December 2021.

SELECT AVG([int_rate])*100 AS MTD_Avg_Int_Rate
from [dbo].[financial_loan]
WHERE MONTH([issue_date]) = 12 AND YEAR([issue_date]) = 2021;

--PMTD Average Interest
-- Calculates the Previous Month-to-Date (PMTD) average interest rate for loan applications.
SELECT AVG([int_rate])*100 AS PTMD_AVG_Int_Rate
from [dbo].[financial_loan]
WHERE MONTH([issue_date]) = 11 AND YEAR([issue_date])= 2021;


--Avg DTI
-- Calculates the average Debt-to-Income Ratio (DTI) across all loan applications.
SELECT AVG([dti])*100 AS AVG_DTI
from [dbo].[financial_loan]

--MTD Avg DTI
-- Calculates the Month-to-Date (MTD) average Debt-to-Income Ratio (DTI) for loan applications in December 2021.
SELECT AVG([dti])*100 AS MTD_Avg_DTI
From [dbo].[financial_loan]
WHERE MONTH([issue_date]) = 12 AND YEAR([issue_date]) = 2021

--PMTD Avg DTI
-- Calculates the Previous Month-to-Date (PMTD) average Debt-to-Income Ratio (DTI) for loan applications.
SELECT AVG([dti])*100 AS PMTD_AVG_DTI
FROM [dbo].[financial_loan]
WHERE MONTH([issue_date]) = 11 AND YEAR([issue_date]) = 2021

--Good Loan Percentage
-- Calculates the percentage of loans that are 'Fully Paid' or 'Current'.
SELECT 
	(COUNT(CASE WHEN [loan_status] = 'Fully Paid' OR [loan_status] = 'Current'
	THEN [id] END)*100) / COUNT([id]) AS Good_Loan_Percentage
FROM [dbo].[financial_loan]

--.Good Loan Applications
-- Counts the number of loan applications that are classified as 'Fully Paid' or 'Current'
SELECT COUNT([id]) AS Good_Loan_Applications
FROM [dbo].[financial_loan]
WHERE [loan_status] = 'Fully Paid' OR [loan_status] = 'Current'

--Counts the number Loan_status Fully Paid or Current
SELECT [loan_status] , COUNT([id]) AS Good_Loan_Applications
FROM [dbo].[financial_loan]
WHERE [loan_status] = 'Fully Paid' OR [loan_status] = 'Current'
GROUP BY [loan_status];

--.Good Loan Funded Amount
-- Calculates the total funded amount for loan applications that are classified as 'Fully Paid' or 'Current'
SELECT SUM([loan_amount]) AS  Good_Loan_Funded_amount
from [dbo].[financial_loan]
WHERE [loan_status] = 'Fully Paid' OR [loan_status] = 'Current'


--Good Loan Amount Received
-- Calculates the total amount received from the customers for loan applications that are classified as 'Fully Paid' or 'Current'
SELECT SUM([total_payment]) AS Good_Loan_amount_received
FROM [dbo].[financial_loan]
WHERE [loan_status] = 'Fully  Paid' OR [loan_status] = 'Current'

SELECT [loan_status], SUM([total_payment])  
FROM [dbo].[financial_loan]
WHERE [loan_status] = 'Fully Paid' OR [loan_status] = 'Current'
GROUP BY [loan_status];

--Bad Loan Percentage
-- Calculates the percentage of loans that are 'Charged Off'.

SELECT 
	(COUNT(CASE WHEN [loan_status] = 'Charged Off' THEN [id] END) * 100)/
	COUNT([id]) AS Bad_Loan_Percentage
FROM [dbo].[financial_loan]

--Bad Loan Applications
-- Counts the number of loan applications that are classified as 'Charged Off'
SELECT COUNT([id]) AS Bad_Loan_Applications
FROM [dbo].[financial_loan]
WHERE [loan_status] = 'Charged Off'

--Bad Loan Funded Amount
-- Calculates the total funded amount for loan applications that are classified as 'Charged Off'
SELECT SUM([loan_amount]) AS Bad_Loan_Funded_Amount
FROM [dbo].[financial_loan]
WHERE loan_status = 'Charged Off'

--Bad Loan Amount Received
-- Calculates the total amount received from the customers for loan applications that are classified as 'Charged Off'
SELECT SUM([total_payment]) AS Bad_Loan_amount_received
FROM [dbo].[financial_loan]
WHERE [loan_status] = 'Charged Off'

--LOAN STATUS
-- Retrieves loan status statistics, including counts, total amount received, 
-- total funded amount, average interest rate, and average Debt-to-Income Ratio (DTI).

SELECT [loan_status],
COUNT([id]) AS Loan_Count,
SUM([total_payment]) AS  Total_Amount_Received,
SUM([loan_amount]) AS Total_Funded_Amount,
AVG([int_rate])AS Interset_Rate,
AVG([dti]) AS DTI
FROM [dbo].[financial_loan]
GROUP BY [loan_status];

--Retrieves Month-to-Date (MTD) loan status statistics for December 2021, including total amount received and total funded amount.
SELECT [loan_status],
COUNT([id]) AS Loan_Count,
SUM([total_payment]) AS MTD_Total_Amount_Received,
SUM([loan_amount]) AS MTD_Total_Funded_Amount
FROM [dbo].[financial_loan]
WHERE MONTH([issue_date]) = 12 AND YEAR([issue_date]) = 2021
GROUP BY [loan_status]

-- BANK LOAN REPORT | OVERVIEW
/*
1. MONTHLY OVERVIEW
*/

-- Retrieves monthly overview statistics, including the month number, month name, 
-- total loan applications, total funded amount, and total amount received.
SELECT MONTH([issue_date]) AS Month_Number,
DATENAME(MONTH,[issue_date])AS Month_Name,
COUNT([id]) AS Total_Loan_Applications,
SUM([total_payment]) AS Total_Amount_Received,
SUM([loan_amount]) AS Total_Funded_Amount
FROM [dbo].[financial_loan]
GROUP BY MONTH([issue_date]),DATENAME(MONTH,[issue_date])
ORDER BY MONTH([issue_date]);

/*
2. STATEWISE OVERVIEW
*/
-- Retrieves statewise overview statistics, including the state name, 
-- total loan applications, total funded amount, and total amount received.

SELECT [address_state] AS State,
COUNT([id]) AS Total_Loan_Applications,
SUM([total_payment]) AS Total_Amount_Received,
SUM([loan_amount])AS Total_Funded_Amoount
FROM [dbo].[financial_loan]
GROUP BY [address_state]
ORDER BY COUNT([id]) DESC;

/*
3. LOAN TERM OVERVIEW
*/

-- -- Retrieves loan term overview statistics, including the term (duration), 
-- total loan applications, total funded amount, and total amount received.

SELECT [term] as Term,
COUNT([id])AS Total_Loan_Applications,
SUM([total_payment])As Total_Amount_Received,
SUM([loan_amount]) AS Total_Funded_Amount
FROM [dbo].[financial_loan]
GROUP BY [term]
ORDER BY COUNT([id]) DESC;

/*
4. EMPLOYEE LENGTH OVERVIEW
*/

-- Retrieves employee length overview statistics, including the employee length, 
-- total loan applications, total funded amount, and total amount received.

SELECT [emp_length] AS Employee_Length,
COUNT([id]) AS Total_Loan_Applications,
SUM([total_payment]) AS Total_Amount_Received,
SUM([loan_amount]) AS Total_Funded_Amount
FROM  [dbo].[financial_loan]
GROUP BY [emp_length]
ORDER BY [emp_length];

/*
5. PURPOSE OVERVIEW
*/

-- Retrieves purpose overview statistics, including the loan purpose, 
-- total loan applications, total funded amount, and total amount received.
SELECT[purpose]  AS Purpose,
COUNT([id]) AS Total_Loan_Applications,
SUM([total_payment]) AS Total_Amount_Received,
SUM([loan_amount]) AS Total_Funded_Amount
FROM  [dbo].[financial_loan]
GROUP BY [purpose]
ORDER BY COUNT([id]) DESC;


/*
6. HOME OWNERSHIP OVERVIEW
*/

-- Retrieves home ownership overview statistics, including the home ownership status, 
-- total loan applications, total funded amount, and total amount received.
SELECT[home_ownership]  AS Home_Ownership,
COUNT([id]) AS Total_Loan_Applications,
SUM([total_payment]) AS Total_Amount_Received,
SUM([loan_amount]) AS Total_Funded_Amount
FROM  [dbo].[financial_loan]
GROUP BY [home_ownership]
ORDER BY COUNT([id]) DESC;


SELECT COUNT([id]) AS Total_Loan_Applications,
verification_status,
SUM([total_payment]) AS Total_Amount_Received,
SUM([loan_amount]) AS Total_Funded_Amount
FROM [dbo].[financial_loan]
GROUP BY verification_status;

SELECT COUNT([id]) AS Total_Loan_Applications,
[issue_date],
SUM([total_payment]) AS Total_Amount_Received,
SUM([loan_amount]) AS Total_Funded_Amount
FROM [dbo].[financial_loan]
GROUP BY issue_date
ORDER BY issue_date DESC;


SELECT COUNT(id) AS Total_Loan_Applications , [application_type],grade,
loan_status,
SUM([total_payment]) AS Total_Amount_Received,
SUM([loan_amount]) AS Total_Funded_Amount
FROM [dbo].[financial_loan]
GROUP BY [application_type],loan_status,grade
ORDER BY grade;