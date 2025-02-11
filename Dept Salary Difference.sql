CREATE TABLE Salaries 
	(emp_name VARCHAR(50), department VARCHAR(50), salary INT, PRIMARY KEY (emp_name, department));

INSERT INTO Salaries (emp_name, department, salary)
	VALUES('Kathy', 'Engineering', 50000),
			('Roy', 'Marketing', 30000),
			('Charles', 'Engineering', 45000),
			('Jack', 'Engineering', 85000),
			('Benjamin', 'Marketing', 34000),
			('Anthony', 'Marketing', 42000),
			('Edward', 'Engineering', 102000),
			('Terry', 'Engineering', 44000),
			('Evelyn', 'Marketing', 53000),
			('Arthur', 'Engineering', 32000);

SELECT * FROM SALARIES

/*
Find the highest salary difference between Marketing and Engineering departments.
*/

--APPROACH 1
	
WITH CTE AS
(
	SELECT MAX(SALARY) as Marketing_Salary FROM SALARIES
	WHERE DEPARTMENT = 'Marketing'
),
CTE1 AS
(
	SELECT MAX(SALARY) as Engineering_Salary FROM SALARIES
	WHERE DEPARTMENT = 'Engineering'
)
SELECT (CTE1.Engineering_Salary - CTE.Marketing_Salary)AS SALARY_DIFFERENCE
FROM CTE CROSS JOIN CTE1

--APPROACH 2

SELECT 
    MAX(
        CASE 
            WHEN department = 'Marketing' THEN salary 
            ELSE 0 
        END
    ) AS Max_Marketing_Salary,
    MAX(
        CASE 
            WHEN department = 'Engineering' THEN salary 
            ELSE 0 
        END
    ) AS Max_Engineering_Salary,
    (MAX(
        CASE 
            WHEN department = 'Engineering' THEN salary 
            ELSE 0 
        END
    ) - MAX(
        CASE 
            WHEN department = 'Marketing' THEN salary 
            ELSE 0 
        END
    )) AS Salary_Difference
FROM Salaries;
