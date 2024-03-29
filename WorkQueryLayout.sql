CREATE TABLE STUDENT(
	STUDENT_ID INT PRIMARY KEY,
    NAME VARCHAR(20),
    MAJOR VARCHAR(20)
);
CREATE TABLE STUDENT (
	STUDENT_ID INT,
    NAME VARCHAR(20),
    MAJOR VARCHAR(20),
    PRIMARY KEY(STUDENT_ID)
);

DESCRIBE STUDENT;

INSERT INTO STUDENT VALUES(1, 'JACK', 'BIOLOGY');  

INSERT INTO STUDENT VALUES(2, 'KATE', 'SOCIOLOGY');

INSERT INTO STUDENT(STUDENT_ID, NAME) VALUES(3, 'CLAIRE');

SELECT * FROM STUDENT;

/*I CANT INCLUDE DUPLICATES TO THE PRIMARY KEY COLUMN*/

INSERT INTO STUDENT(STUDENT_ID, NAME, MAJOR) VALUES(4, 'JACK', 'BIOLOGY');

INSERT INTO STUDENT(STUDENT_ID, NAME, MAJOR) VALUES(5, 'MIKE', 'COMPUTER SCIENCE');

DROP TABLE STUDENT;

CREATE TABLE STUDENT(
	STUDENT_ID INT PRIMARY KEY,
    NAME VARCHAR(20) NOT NULL,
    MAJOR VARCHAR(20) UNIQUE
);
/*NOT NULL:FIELD CANT BE NULL
  UNIQUE: THIS COLULM VALUE SHOULD NOT BE USED FOR ANOTHOR ENTRY OF THE SAME TABLE
*/

INSERT INTO STUDENT VALUES(1, 'JACK', 'BIOLOGY');  

INSERT INTO STUDENT VALUES(2, 'KATE', 'SOCIOLOGY');

INSERT INTO STUDENT VALUES(3, NULL, 'CHEMISTRY');

INSERT INTO STUDENT VALUES(4, 'JACK', 'BIOLOGY');

INSERT INTO STUDENT VALUES(3, 'MIKE', 'COMPUTER SCIENCE');

DROP TABLE STUDENT;

CREATE TABLE STUDENT (
	STUDENT_ID INT,
    NAME VARCHAR(20), 
    MAJOR VARCHAR(20) DEFAULT 'UNDICIDED',
    PRIMARY KEY(STUDENT_ID)
);
INSERT INTO STUDENT (STUDENT_ID, NAME) VALUES(1, 'JACK');  

INSERT INTO STUDENT VALUES(2, 'KATE', 'SOCIOLOGY');

INSERT INTO STUDENT VALUES(3, NULL, 'CHEMISTRY');

INSERT INTO STUDENT VALUES(4, 'JACK', 'BIOLOGY');

INSERT INTO STUDENT VALUES(3, 'MIKE', 'COMPUTER SCIENCE')

DROP TABLE STUDENT;

CREATE TABLE STUDENT (
	STUDENT_ID INT AUTO_INCREMENT,
    NAME VARCHAR(20), 
    MAJOR VARCHAR(20),
    PRIMARY KEY(STUDENT_ID)
);

INSERT INTO STUDENT (NAME, MAJOR) VALUES('JACK', 'BIOLOGY');
INSERT INTO STUDENT (NAME, MAJOR) VALUES('KATE', 'SOCIOLOGY');
INSERT INTO STUDENT (NAME, MAJOR) VALUES('CLAIR', 'CHEMISTRY');

SELECT * FROM STUDENT;

UPDATE STUDENT
SET MAJOR = 'BIO'
WHERE MAJOR = 'BIOLOGY';

SELECT * FROM STUDENT;

UPDATE STUDENT
SET MAJOR = 'BIOCHEMISTRY'
WHERE MAJOR = 'BIOLOGY' OR MAJOR = 'CHEMISTRY';

SELECT * FROM STUDENT;

UPDATE STUDENT
SET NAME = 'TOM', MAJOR = 'UNDICIDED'
WHERE STUDENT_ID = 1;

UPDATE STUDENT
SET MAJOR = 'UNDICIDED';

DELETE FROM STUDENT;

DELETE FROM STUDENT
WHERE STUDENT_ID = 1;

DELETE FROM STUDENT
WHERE NAME = 'TOM' AND MAJOR = 'UNDECIDED';

SELECT STUDENT.NAME, STUDENT.MAJOR
FROM STUDENT
ORDER BY NAME;

SELECT STUDENT.NAME, STUDENT.MAJOR
FROM STUDENT
ORDER BY NAME DESC;

SELECT STUDENT.NAME, STUDENT.MAJOR
FROM STUDENT
ORDER BY STUDENT_ID ASC;

DROP TABLE STUDENT;

CREATE TABLE STUDENT (
	STUDENT_ID INT AUTO_INCREMENT,
    NAME VARCHAR(20), 
    MAJOR VARCHAR(20),
    PRIMARY KEY(STUDENT_ID)
);

INSERT INTO STUDENT VALUES(1, 'JACK', 'BIOLOGY');  
INSERT INTO STUDENT VALUES(2, 'KATE', 'SOCIOLOGY');
INSERT INTO STUDENT VALUES(3, 'CLAIR', 'CHEMISTRY');
INSERT INTO STUDENT VALUES(4, 'JACK', 'BIOLOGY');
INSERT INTO STUDENT VALUES(5, 'MIKE', 'COMPUTER SCIENCE');

SELECT * FROM STUDENT;

SELECT *
FROM STUDENT
ORDER BY MAJOR, STUDENT_ID;

SELECT *
FROM STUDENT
ORDER BY MAJOR, STUDENT_ID DESC;

SELECT *
FROM STUDENT
LIMIT 2;

SELECT *
FROM STUDENT
ORDER BY MAJOR, STUDENT_ID DESC
LIMIT 4;

SELECT NAME, MAJOR
FROM  STUDENT
WHERE MAJOR <> 'CHEMISTRY';

SELECT NAME, MAJOR
FROM  STUDENT
WHERE STUDENT_ID < 3;

SELECT NAME, MAJOR
FROM  STUDENT
WHERE STUDENT_ID < 3 AND NAME = 'JACK';

SELECT NAME, MAJOR
FROM  STUDENT
WHERE NAME IN ('CLAIR', 'KATE', 'MIKE');

DROP TABLE STUDENT;
/*CREATING COMPANY DATABASE*/

CREATE TABLE EMPLOYEE(
	EMP_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(40),
    LAST_NAME VARCHAR(40),
    BIRTH_DATE ,
    SEX VARCHAR(1),
    SALARY INT,
    SUPER_ID INT,
    BRANCH_ID INT
    );
INSERT INTO EMPLOYEE VALUES(100, 'DAVID', 'WALLACE', '1990-11-17','M', 250000, NULL, 1);
INSERT INTO EMPLOYEE VALUES(101, 'JAN', 'LEVINSON', '1961-05-11','F', 110000, 100, 1);
INSERT INTO EMPLOYEE VALUES(102, 'MICHAEL', 'SCOTT', '1964-03-15','M', 75000, 100, 2);
INSERT INTO EMPLOYEE VALUES(103, 'ANGELA', 'MARTIN', '1971-06-25','F', 63000, 102, 2);
INSERT INTO EMPLOYEE VALUES(104, 'KELLY', 'KAPOOR', '1980-02-05','F', 55000, 102, 2);
INSERT INTO EMPLOYEE VALUES(105, 'STANLEY', 'HUDSON', '1958-02-19','M', 69000, 102, 2);
INSERT INTO EMPLOYEE VALUES(106, 'JOSH', 'PORTER', '1969-09-05','M', 78000, 100, 3);
INSERT INTO EMPLOYEE VALUES(107, 'ANDY', 'BERNARD', '1973-07-22','M', 65000, 106, 3);
INSERT INTO EMPLOYEE VALUES(108, 'JIM', 'HALPERT', '1978-10-01','M', 71000, 106, 3);


    
CREATE TABLE BRANCH(
 BRANCH_ID INT PRIMARY KEY,
 BRANCH_NAME VARCHAR(40),
 MNG_ID INT,
 MNG_START_DATE DATE,
 FOREIGN KEY(MNG_ID) REFERENCES EMPLOYEE(EMP_ID) ON DELETE SET NULL
 );
 
INSERT INTO BRANCH VALUES(1, 'CORPORATE', 100, '2006-02-09');
INSERT INTO BRANCH VALUES(2, 'SCRANTON', 102, '1992-04-06');
INSERT INTO BRANCH VALUES(3, 'STAMFORD', 103, '1998-02-13');


/*
ALTER TABLE EMPLOYEE
ADD FOREIGN KEY(BRANCH_ID)
REFERENCES BRANCH(BRANCH_ID)
ON DELETE SET NULL;


ALTER TABLE EMPLOYEE
ADD FOREIGN KEY(SUPER_ID)
REFERENCES EMPLOYEE(EMP_ID)
ON DELETE SET NULL;
*/
CREATE TABLE CLIENT(
	CLIENT_ID INT PRIMARY KEY,
    CLIENT_NAME VARCHAR(40),
    BRANCH_ID INT,
    FOREIGN KEY(BRANCH_ID) REFERENCES BRANCH(BRANCH_ID) ON DELETE SET NULL
    );
    
    INSERT INTO CLIENT VALUES(400, 'DUNMORE HIGHSCHOOL', 2);
    INSERT INTO CLIENT VALUES(401, 'LAKHWANA COUNTRY', 2);
    INSERT INTO CLIENT VALUES(402, 'FEDEX', 3);
	INSERT INTO CLIENT VALUES(403, 'JOHN DALY LAW, LLC', 3);
	INSERT INTO CLIENT VALUES(404, 'SCRANTON WHITEPAGES', 2);
	INSERT INTO CLIENT VALUES(405, 'TIMES NEWSPAPER', 3);
	INSERT INTO CLIENT VALUES(406, 'FEDEX', 2);




CREATE TABLE WORKS_WITH(
	EMP_ID INT,
    CLIENT_ID INT,
    TOTAL_SALES INT,
    PRIMARY KEY(EMP_ID, CLIENT_ID),
    FOREIGN KEY(EMP_ID) REFERENCES EMPLOYEE(EMP_ID) ON DELETE CASCADE,
    FOREIGN KEY(CLIENT_ID) REFERENCES CLIENT(CLIENT_ID) ON DELETE CASCADE
    );
    
INSERT INTO WORKS_WITH VALUES(105, 400, 55000);   
INSERT INTO WORKS_WITH VALUES(102, 401, 267000);
INSERT INTO WORKS_WITH VALUES(108, 402, 22500);
INSERT INTO WORKS_WITH VALUES(107, 403, 5000);
INSERT INTO WORKS_WITH VALUES(108, 403, 12000);
INSERT INTO WORKS_WITH VALUES(105, 404, 33000);
INSERT INTO WORKS_WITH VALUES(107, 405, 26000);
INSERT INTO WORKS_WITH VALUES(102, 406, 15000);
INSERT INTO WORKS_WITH VALUES(105, 406, 130000);   
   
    
 CREATE TABLE BRANCH_SUPPLIER(
	BRANCH_ID INT,
    SUPPLIER_NAME VARCHAR(40),
    SUPPLY_TYPE VARCHAR(40),
    PRIMARY KEY(BRANCH_ID, SUPPLIER_NAME),
    FOREIGN KEY(BRANCH_ID) REFERENCES BRANCH(BRANCH_ID) ON DELETE CASCADE
    ); 
    
INSERT INTO BRANCH_SUPPLIER VALUES(2, 'HAMMER MILL', 'PAPER');
INSERT INTO BRANCH_SUPPLIER VALUES(2, 'UNI-BALL', 'WRITING UTENSILS');
INSERT INTO BRANCH_SUPPLIER VALUES(3, 'PATRIOT PAPER', 'PAPER');
INSERT INTO BRANCH_SUPPLIER VALUES(2, 'J.T FORMS & LABELS', 'CUSTOM FORMS');
INSERT INTO BRANCH_SUPPLIER VALUES(3, 'UNI-BALL', 'WRITING UTENSILS');
INSERT INTO BRANCH_SUPPLIER VALUES(3, 'HAMMER MILL', 'PAPER');
INSERT INTO BRANCH_SUPPLIER VALUES(3, 'STOMFORD LABLES', 'CUSTOM FORMS');

/*UNION*/
/*FIND A LIST OF ALL MONEY SPENT OR EARNED BY THE COMPANY*/
SELECT SALARY
FROM EMPLOYEE
UNION
SELECT TOTAL_SALES
FROM WORKS_WITH;

/*JOINS*/
INSERT INTO BRANCH VALUES(4, 'BUFFALO', NULL, NULL);

SELECT EMPLOYEE.EMP_ID, EMPLOYEE.FIRST_NAME, BRANCH.BRANCH_NAME
FROM EMPLOYEE
JOIN BRANCH 
ON EMPLOYEE.EMP_ID = BRANCH.MNG_ID;

SELECT EMPLOYEE.EMP_ID, EMPLOYEE.FIRST_NAME, BRANCH.BRANCH_NAME
FROM EMPLOYEE
LEFT JOIN BRANCH 
ON EMPLOYEE.EMP_ID = BRANCH.MNG_ID;

	SELECT EMPLOYEE.EMP_ID, EMPLOYEE.FIRST_NAME, BRANCH.BRANCH_NAME
FROM EMPLOYEE
RIGHT JOIN BRANCH 
ON EMPLOYEE.EMP_ID = BRANCH.MNG_ID;





	
    
     
    
    

 














