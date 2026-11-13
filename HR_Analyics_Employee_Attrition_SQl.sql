-- HR Analytics: Employee Attrition & Performance
-- PostgreSQL project script
-- Import CSV into the table, then run the analysis queries.

DROP TABLE IF EXISTS employee_attrition;

CREATE TABLE employee_attrition (
    employee_id INT PRIMARY KEY,
    employee_code VARCHAR(20),
    employee_name VARCHAR(100),
    department VARCHAR(50),
    job_role VARCHAR(80),
    job_level VARCHAR(30),
    age INT,
    marital_status VARCHAR(20),
    education VARCHAR(30),
    joining_date DATE,
    years_at_company INT,
    annual_salary NUMERIC(12,2),
    monthly_income NUMERIC(12,2),
    overtime VARCHAR(5),
    job_satisfaction INT,
    work_life_balance INT,
    environment_satisfaction INT,
    training_hours INT,
    promotions INT,
    absence_days INT,
    distance_from_home_km INT,
    work_mode VARCHAR(20),
    business_travel VARCHAR(20),
    performance_rating VARCHAR(20),
    attrition VARCHAR(5),
    age_group VARCHAR(20),
    salary_band VARCHAR(20),
    tenure_group VARCHAR(20)
);

select * from employee_attrition

-- 1. Find the total number of employees.
SELECT COUNT(*) AS EMPLOYEE_ID
FROM EMPLOYEE_ATTRITION;

--2. Find the number of employees in each department.
SELECT
 DEPARTMENT,
	COUNT(*) AS TOTAL_EMPLOYEES
FROM EMPLOYEE_ATTRITION
	GROUP BY DEPARTMENT;

--3. Find the average salary of employees in each department.
SELECT
	DEPARTMENT,
	AVG(ANNUAL_SALARY) AS AVG_SALARY
FROM
	EMPLOYEE_ATTRITION
GROUP BY
	DEPARTMENT;

--4. Find the number of employees in each job role.
SELECT
	JOB_ROLE,
	COUNT(EMPLOYEE_ID) AS EMPLOYEE_COUNT
FROM
	EMPLOYEE_ATTRITION
GROUP BY
	JOB_ROLE;
--5. Find the average age of employees in each department.
SELECT
	DEPARTMENT,
	AVG(AGE) AS AGE
FROM
	EMPLOYEE_ATTRITION
GROUP BY
	DEPARTMENT;
--6. Find the number of employees who have left the company.
SELECT
	COUNT(*) AS TOTAL_ATTRITION
FROM
	EMPLOYEE_ATTRITION
WHERE
	ATTRITION = 'Yes';

--7. What is the total employee count and overall attrition rate?
SELECT
	COUNT(*) AS TOTAL_EMPLOYEE,
	COUNT(CASE WHEN ATTRITION = 'Yes' THEN 1 END)AS ATTRITION_COUNT,
	ROUND(
		COUNT(CASE WHEN ATTRITION = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
		2
	)AS ATTRITION_RATE
FROM
	EMPLOYEE_ATTRITION;

--8. Which departments have the highest employee count and highest attrition rate?
SELECT DEPARTMENT,
COUNT(*) AS TOTAL_EMPLOYEE,
	COUNT(CASE WHEN ATTRITION = 'Yes' THEN 1 END)AS ATTRITION_COUNT,
	ROUND(
		COUNT(CASE WHEN ATTRITION = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
		2
	)AS ATTRITION_RATE
FROM
	EMPLOYEE_ATTRITION GROUP BY DEPARTMENT
ORDER BY ATTRITION_COUNT DESC;

--9 Does overtime have an impact on employee attrition?
SELECT
	OVERTIME,
	COUNT(*) AS TOTAL_EMPLOYEES,
	COUNT(CASE WHEN ATTRITION = 'Yes' THEN 1 END)AS ATTRITION_COUNT,
	ROUND(
		COUNT(CASE WHEN ATTRITION = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
		2
	)AS ATTRITION_RATE
FROM
	EMPLOYEE_ATTRITION GROUP BY overtime
ORDER BY ATTRITION_COUNT DESC;

--10. Which job roles have high salary but also high attrition?
SELECT JOB_ROLE,
ROUND(AVG(ANNUAL_SALARY), 2) AS AVG_SALARY,
COUNT(*) AS TOTAL_EMPLOYEE,
COUNT(
	CASE WHEN ATTRITION = 'Yes' THEN 1 END) AS ATTRITION_COUNT,
ROUND(
	COUNT(CASE WHEN ATTRITION = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
	2
) AS ATTRITION_RATE
FROM  EMPLOYEE_ATTRITION
GROUP BY JOB_ROLE
ORDER BY ATTRITION_RATE DESC;

--11. Find departments that have more than 100 employees and an average annual salary greater than 50,000.
SELECT 
    DEPARTMENT,
    COUNT(*) AS TOTAL_EMPLOYEES,
    AVG(ANNUAL_SALARY) AS AVG_SALARY
FROM EMPLOYEE_ATTRITION
GROUP BY DEPARTMENT
HAVING COUNT(*) > 100
   AND AVG(ANNUAL_SALARY) > 50000;

--12. Find job roles where total employees are greater than 20 and attrition count is greater than 5.
SELECT
    JOB_ROLE,
    COUNT(*) AS TOTAL_EMPLOYEES,
    COUNT(CASE WHEN ATTRITION = 'Yes' THEN 1 END) AS ATTRITION_COUNT
FROM EMPLOYEE_ATTRITION
GROUP BY JOB_ROLE
HAVING COUNT(*) > 20
   AND COUNT(CASE WHEN ATTRITION = 'Yes' THEN 1 END) > 5;

--13. Rank employees within each department based on annual salary.
SELECT
	EMPLOYEE_ID,
	EMPLOYEE_NAME,
	DEPARTMENT,
	ANNUAL_SALARY,
	RANK() OVER (PARTITION BY DEPARTMENT ORDER BY ANNUAL_SALARY DESC
	)AS SALARY_RANK
FROM EMPLOYEE_ATTRITION;

--14. Using a CTE, find departments whose attrition rate is higher than the company's overall attrition rate.
WITH DEPT_ATTRITION AS (
    SELECT
        DEPARTMENT,
        COUNT(*) AS TOTAL_EMPLOYEES,
        COUNT(CASE WHEN ATTRITION = 'Yes' THEN 1 END) AS ATTRITION_COUNT,
        COUNT(CASE WHEN ATTRITION = 'Yes' THEN 1 END) * 100.0
            / COUNT(*) AS ATTRITION_RATE
    FROM EMPLOYEE_ATTRITION
    GROUP BY DEPARTMENT
)
SELECT *
FROM DEPT_ATTRITION
WHERE ATTRITION_RATE > (
    SELECT COUNT(CASE WHEN ATTRITION = 'Yes' THEN 1 END) * 100.0
           / COUNT(*)
    FROM EMPLOYEE_ATTRITION
);

--15 Find departments having more than 50 employees, above-average attrition rate, and below-average job satisfaction.
WITH DEPT_ANALYSIS AS (
    SELECT
        DEPARTMENT,
        COUNT(*) AS TOTAL_EMPLOYEES,
         COUNT(CASE WHEN ATTRITION = 'Yes' THEN 1 END) * 100.0
            / COUNT(*) AS ATTRITION_RATE,
			AVG(JOB_SATISFACTION) AS AVG_JOB_SATISFACTION
    FROM EMPLOYEE_ATTRITION
    GROUP BY DEPARTMENT
)
SELECT *
FROM DEPT_ANALYSIS
WHERE TOTAL_EMPLOYEES>50
AND ATTRITION_RATE > (
    SELECT COUNT(CASE WHEN ATTRITION = 'Yes' THEN 1 END) * 100.0
           / COUNT(*)
    FROM EMPLOYEE_ATTRITION
) AND AVG_JOB_SATISFACTION< (
	SELECT AVG(JOB_SATISFACTION)
	FROM EMPLOYEE_ATTRITION
);






























