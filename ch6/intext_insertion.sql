CREATE TABLE WORKS_ON_INFO(
    ENAME VARCHAR(30), PROJECT_NAME VARCHAR(30), HOURS DECIMAL(6, 2)
);

INSERT INTO WORKS_ON_INFO
    SELECT E.FNAME || ' ' || E.LNAME AS ENAME, P.PNAME, W.HOURS
    FROM C_EMPLOYEE E, PROJECT P, WORKS_ON W
    WHERE E.SSN = W.ESSN
        AND P.PNUMBER = W.PNO;

SELECT *
FROM WORKS_ON_INFO;

DROP TABLE WORKS_ON_INFO;

SELECT *
FROM C_EMPLOYEE;

