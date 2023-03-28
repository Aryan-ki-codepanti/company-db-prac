conn system/12345;

SHOW USER;

SELECT USER FROM DUAL;
ALTER DATABASE OPEN;
alter session set container=orclpdb;

CREATE USER COMPANY IDENTIFIED BY 12345; 

SELECT * FROM ALL_USERS;

GRANT create session,connect,resource to COMPANY;

conn COMPANY/12345;