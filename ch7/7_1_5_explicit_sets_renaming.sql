--Q 17 Retrieve the Social Security numbers of all employees who work on project numbers 1, 2, or 3.

SELECT DISTINCT(ESSN)
FROM WORKS_ON
WHERE PNO IN (1, 2, 3);

-- Q8A Get names of employees and supervisors while renaming

SELECT A.FNAME EMPLOYEE_NAME, B.FNAME SUPERVISOR_NAME
FROM C_EMPLOYEE A, C_EMPLOYEE B
WHERE A.SUPER_SSN = B.SSN;

