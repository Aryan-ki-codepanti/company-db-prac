--Q16B

SELECT FNAME, LNAME
FROM C_EMPLOYEE E
WHERE EXISTS(
                SELECT *
                FROM DEPENDENT D
                WHERE E.SSN = D.ESSN
                        AND E.SEX = D.SEX
                        AND E.FNAME = D.DEPENDENT_NAME
        );

-- Query 6 Retrieve the names of employees who have no dependents

SELECT FNAME, LNAME
FROM C_EMPLOYEE
WHERE NOT EXISTS(
                SELECT *
                FROM DEPENDENT
                WHERE SSN = ESSN
        );

-- Query 7 List the names of managers who have at least one dependent

SELECT FNAME, LNAME
FROM C_EMPLOYEE, C_DEPARTMENT
WHERE SSN = MGR_SSN --managers
        AND EXISTS( --dependent check
                SELECT *
                FROM DEPENDENT
                WHERE ESSN = SSN
        );

SELECT FNAME, LNAME
FROM C_EMPLOYEE
WHERE EXISTS( --manager check
                SELECT *
                FROM C_DEPARTMENT
                WHERE MGR_SSN = SSN
        )
        AND EXISTS( -- dependent check
                SELECT *
                FROM DEPENDENT
                WHERE ESSN = SSN
        );

--no nested
SELECT DISTINCT(FNAME), LNAME
FROM C_EMPLOYEE, C_DEPARTMENT, DEPENDENT
WHERE SSN = MGR_SSN --manager check
        AND SSN = ESSN-- dependent check;

-- Q3 Retrieve the name of each employee who works on all the projects controlled by department number 5


SELECT FNAME, LNAME
FROM C_EMPLOYEE
WHERE NOT EXISTS(
                SELECT PNUMBER
                FROM PROJECT
                WHERE DNUM = 5 EXCEPT
                        SELECT PNO
                        FROM WORKS_ON
                        WHERE ESSN = SSN
        );

-- or Select each employee such that there does not exist a project controlled by department 5 that the employee does not work on

SELECT FNAME, LNAME
FROM C_EMPLOYEE
WHERE NOT EXISTS (
                SELECT *
                FROM WORKS_ON B
                WHERE B.PNO IN (
                                SELECT PNUMBER
                                FROM PROJECT
                                WHERE DNUM = 5
                        )
                        AND NOT EXISTS (
                                SELECT *
                                FROM WORKS_ON C
                                WHERE SSN = C.ESSN
                                        AND C.PNO = B.PNO
                        )
        );