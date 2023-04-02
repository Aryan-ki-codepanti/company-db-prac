-- Q24 For each department, retrieve the department number, the number of employees in the department, and their average salary.

SELECT DNO, COUNT( * ), AVG(SALARY)
FROM C_EMPLOYEE
GROUP BY DNO;

-- Q25 For each project, retrieve the project number, the project name, and the number of employees who work on that project

SELECT PNO, PNAME, COUNT( * )
FROM PROJECT, WORKS_ON
WHERE PNO = PNUMBER
GROUP BY PNO, PNAME;

-- Q26 For each project on which more than two employees work, retrieve the project number, the project name, and the number of employees who work on the project
SELECT PNO, PNAME, COUNT( * )
FROM PROJECT, WORKS_ON
WHERE PNO = PNUMBER
GROUP BY PNO, PNAME
HAVING COUNT( * ) > 2;

--Q27 For each project, retrieve the project number, the project name, and the number of employees from department 5 who work on the project

SELECT PNUMBER, PNAME, COUNT( * )
FROM PROJECT, WORKS_ON, C_EMPLOYEE
WHERE PNUMBER = PNO
    AND ESSN = SSN
    AND DNO = 5
GROUP BY PNUMBER, PNAME;

-- Q28 For each department that has more than five employees, retrieve the department number and the number of its employees who are making more than $40,000
SELECT DNO, COUNT( * )
FROM EMPLOYEE
WHERE SALARY > 40000
    AND DNO IN (
        SELECT DNO
        FROM EMPLOYEE
        GROUP BY DNO
        HAVING COUNT( * ) > 5
    )
GROUP BY DNO;


