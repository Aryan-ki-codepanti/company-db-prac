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