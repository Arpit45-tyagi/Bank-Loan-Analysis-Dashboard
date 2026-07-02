create database bank_loan_analysis
use bank_loan_analysis

select top 5 * from Loan_Data2
--           Total Applicants

select count(*) as Total_Applicants  from Loan_Data2



--           Total Approved & Rejected Loans

select Loan_Status,
count(*)as Total
from Loan_Data2
group by Loan_Status

/* Mostly loan aproved */

--           Gender-wise Applicants

select Gender,
count(*)as Total_Applicants
from Loan_Data2
group by Gender            --   Mostly Applicants are Male

--           Education-wise applicant
select Education,
count(*)as Total_Applicants
from Loan_Data2
group by Education          -- Mostly Applicaants are Graduated

--           Property Area-Wise Applicant

select Property_Area,
count(*)as Total_Applicant
from Loan_Data2
group by Property_Area        /* Most Applicant belong to semiurban area */


--            Married vs Loan Status

select  Married,Loan_Status,
count(*) as Total
from Loan_Data2
group by Married,Loan_Status    /* Married applicants accounted for the highest number of 
approved loans(285) however,loan approval depends on multiple factors, and matrial status
alone is not sufficient to predict approval*/

--           Education vs Loan Status

select Education,Loan_Status,
count(*)as Total
from Loan_Data2
group by Education,Loan_Status    /* Graduate applicants recieved the highest number of aprroved
loans(340),indicating that graduates have a heigher loan approval count compared to non-graduates
Educations appers to have a positive asociation with loan approvals, but it is not the only 
deciding factor */

--       Does Property Area influence loan approval ?

select Property_Area,Loan_Status,
count(*)as Total
from Loan_Data2
group by Property_Area,Loan_Status   /* Bussines Insights :
Semiurban areas recorded the highest number of approved loans (179),indicating a higher
loan approval trend compared to rural and urban areas */


--          Self Employed


select Self_Employed,Loan_Status,
count(*)as Total
from Loan_Data2
group by Self_Employed,Loan_Status      /* Business Insight:
Most approved loans were granted to non-self-employed applicants (343)
while self-employed applicants accounted for only 56 approved loans.*/

--      Average Applicant income

select avg(ApplicantIncome)
from Loan_Data2                        /* Bussiness Insight:
The Average applicant income is 5,403.Most loan applicants are centered around this income level.
Applicant income is an important factor in loan approval, but it should be analyzed together with
credit history,loan amount,and other applicant details.*/

-- Maximum Income

select max(ApplicantIncome)
from Loan_Data2



-- Minimum Income
select min(ApplicantIncome)
from Loan_Data2                        /* Bussiness Insight:
Minimum applicant income is 150. this indicates the dataset contains applicants with very low 
income,which may influence loan approval analysis and should be verified of outliers */

--  Avg Loan Amount

select avg(LoanAmount)
from Loan_Data2                        /* Bussiness Insight:
The average loan amount is 146.Most approved and rejected loan applications are centered around this 
evaluted along with applicant income and credit history to make better lending decisions */

-- Highest Loan Amount

select max(LoanAmount)
from Loan_Data2                       /* Bussiness Insight:
Max Loan amount is 700 showing that some Applicants requested significantly higher loans than the average 
is 146 .High value loans may require additional risk assessment before approval.*/

-- Credit History

select Credit_History,
count(*) as total
from Loan_Data2
group by Credit_History              /* Bussiness Insight:
Most applicants have a good credit history(475),indicating a lower overall lending risk*/

-- Credit History vs Loan Status
select Credit_History,Loan_Status,
count(*) as total
from Loan_Data2
Group by Credit_History,Loan_Status   /* Bussiness Insights:
Applicants with a good credit history () recived the highest number of loan approval (378)
while applicants with a poor credit history(0) had a highest number of rejection(82).This indicates
that credit history is the strongest factor influenceing loan approval */

-- Dependents

select Dependents,
count(*)
from Loan_Data2
group by Dependents                 /* Bussiness Insights:
Applicants with no dependents(345) make up the largest group,while applicants with three or more
dependents are the mallest group(51) */

-- Dependents vs Loan_Status
select Dependents,Loan_Status,
count(*) as total
from Loan_Data2
group by Dependents,Loan_Status      /* Bussiness Insights:
Applicants with no dependents received the highest number of loan approvals(238).
Loan approvals generally decrease as the number of dependents increase.*/

-- Loan Term Distribution

select Loan_Amount_Term,
count(*)
from Loan_Data2
group by Loan_Amount_Term           /* Bussines Insights:
The 360 month loan term is the most preferred by applicants, suggesting customers favor lower 
monthly EMIs through longer repayment periods.*/

-- Top 10 Highest Loan
select top 10 Loan_Id,
LoanAmount from Loan_Data2
order by LoanAmount desc            /* Bussines Insights :
The maximum loan amount approved is 700, showing that eligible customers can receive high-value
loans based on their profile.*/

-- Top 10 Highest income

select top 10 Loan_Id,
ApplicantIncome 
from Loan_Data2
order by ApplicantIncome desc      /* Bussines Insights:
The highest applicant incime is 81,000 showing thaat the bank serve high-income customers,but loan
approval depends on multiple elgibility factors */

-- Income Categories
select 
case
when ApplicantIncome<3000 then 'Low'
when ApplicantIncome between 3000 and 6000 then 'Medium'
else 'High'
end Income_Category,
count(*) Total
from Loan_Data2
group by 
case
when ApplicantIncome <3000 then 'Low'
when ApplicantIncome between 3000 and 6000 then 'Medium'
else 'High'
end                         /* Bussines Insights :
Medium income applicants (303) form the largest customer segment, making them the bank's primary target 
auidence for loans.*/

-- Loan Amount Categories

select
case 
when LoanAmount<100 then 'Small'
when LoanAmount between 100 and 200 then 'Medium'
else 'Large'
end Loan_Category,
count(*)
from Loan_Data2
group by
case 
when LoanAmount<100 then 'Small'
when LoanAmount between 100 and 200 then 'Medium'
else 'Large' 
end                              /* Bussiness Insights :
Medium loan amounts are the most common (373),showing higher demand for medium sized loans among 
applicants */


-- Average Loan Amount by Property Area
select Property_Area,
avg(LoanAmount) as Avg_Loan
from Loan_Data2
group by Property_Area          /* Bussiness Insights :
The avg loan amount is highest in rural areas (152), suggesting customers in rural regions 
tend to apply for a recieve slightly larger loans than those in semiurban and urban areas. */

-- Average Income by Education
select Education,
avg(ApplicantIncome) as Avg_Income
from Loan_Data2
group by Education              /* Bussiness Insights :
Graduates have a higher average income (5,857),
suggesting education positively impacts applicants earning capacity. */

-- Loan Approval Rate by Property Area\
select Property_Area,
Loan_Status,
count(*) as Total
from Loan_Data2
group by Property_Area,Loan_Status




-- Avg Loan Amount by Education
select Education,
avg(LoanAmount) as Avg_Loan
from Loan_Data2
group by Education




-- Top 5 Lowest Applicant Income
select top 5 Loan_Id,
ApplicantIncome 
from Loan_Data2
order by ApplicantIncome asc



-- Applicants with Loan Amount above Average
select Loan_ID,
LoanAmount
From Loan_Data2
where LoanAmount>(select avg(LoanAmount) from
Loan_Data2)



-- Approvel Rate By Credit History
select Credit_History,
count(*) as Total,
SUM(case when Loan_Status='Y' then 1
else 0 end) as Approved
from Loan_Data2
group by Credit_History