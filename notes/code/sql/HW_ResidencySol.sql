/* code/sql/ HW_RESIDENCY_SOL.sql */

DROP SCHEMA IF EXISTS HW_RESIDENCY_SOL;
CREATE SCHEMA HW_RESIDENCY_SOL;
USE HW_RESIDENCY_SOL;

CREATE TABLE PERSON(
    FName VARCHAR(40),
    LName VARCHAR(40),
    SSN VARCHAR(11) PRIMARY KEY,
    Birthdate DATE
    );

CREATE TABLE HOUSE(
    Address VARCHAR(40) PRIMARY KEY,
    Color ENUM("blue", "white", "green")
    );

CREATE TABLE RESIDENCY(
    Person VARCHAR(11),
    House VARCHAR(40),
    PrincipalResidence BOOLEAN,
    Status ENUM("own", "rent", "squat", "other"),
    FOREIGN KEY (Person) REFERENCES PERSON(SSN),
    FOREIGN KEY (House) REFERENCES HOUSE(Address) ON DELETE CASCADE
    );

INSERT INTO PERSON VALUES
    (NULL, "Doe", "000-00-0000", NULL), -- P.1
    ("Michael", "Keal", "000-00-0001", DATE"1983-02-11"), -- P.2
    ("James", "Baldwin", "000-00-0002", DATE"1967-01-01"), -- P.3
    ("Mridula", "Warrier", "000-00-0003", DATE"1990-02-11"); -- P.4

INSERT INTO HOUSE VALUES
    ("123 Main St.",  "blue"), -- H.1
    ("456 Second St.", "white"), -- H.2
    ("11 Third St.", "blue"); -- H.3

INSERT INTO RESIDENCY VALUES
    ("000-00-0001", "123 Main St.", TRUE, "own"), -- R.1
    ("000-00-0001", "456 Second St.", FALSE, "own"), -- R.2
    ("000-00-0002", "123 Main St.", TRUE, "rent"), -- R.3
    ("000-00-0003", "456 Second St.", TRUE, "own"); -- R.4 

-- start snippet solution4

/*
    In the following we use transactions
    to be able to simulate the "what if"
    aspect of the questions: we will not
    commit the changes we are testing,
    and roll back on them before moving to
    the next question.
*/

-- Exercise 4
-- List the rows (i.e., P.2, H.1, or even “none”) modified by the following statements: 

START TRANSACTION;
    UPDATE HOUSE SET COLOR = "green";
    -- H.1, H.2 and H.3
ROLLBACK;

START TRANSACTION;
    DELETE FROM RESIDENCY WHERE House LIKE "1%";
    -- R.1,and R.3
ROLLBACK;

START TRANSACTION;
    DELETE FROM HOUSE WHERE Address = "456 Second St.";
    -- H.2, R.2 and R.4 (because of the foreign key).
ROLLBACK;

START TRANSACTION;
    DELETE FROM PERSON WHERE Birthdate=DATE"1990-02-11";
    --  None, because of the foreign key and the referential integrity constraint.
    -- ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`HW_RESIDENCY_SOL`.`RESIDENCY`, CONSTRAINT `RESIDENCY_ibfk_1` FOREIGN KEY (`Person`) REFERENCES `PERSON` (`SSN`))
ROLLBACK;

-- end snippet solution4

-- start snippet solution5
-- Exercise 5
-- Write a query that selects … 

-- … the addresses of the houses in the system (11 Third St., 123 Main St., 456 Second St.).
SELECT Address FROM HOUSE;

-- … the SSN of the persons whose first name was not entered in the system (000-00-0000).
SELECT SSN FROM PERSON WHERE FName IS NULL;

-- … all the different colors of houses (white, blue).
SELECT DISTINCT COLOR FROM HOUSE;

-- … the address of the residency of James Baldwin (123 Main St.).
SELECT House
FROM RESIDENCY, PERSON
WHERE PERSON.Fname = "James"
      AND PERSON.LName = "Baldwin"
      AND PERSON.SSN = RESIDENCY.Person;

-- … the first name of the oldest person in the database (James).
SELECT FName
FROM PERSON
WHERE Birthdate = (
    SELECT MIN(Birthdate) FROM PERSON WHERE Birthdate IS NOT NULL
);

-- … Michael Keal’s principal residency address (123 Main St.).
SELECT RESIDENCY.House
FROM RESIDENCY, PERSON
WHERE PERSON.FName = "Michael"
      AND PERSON.LName = "Keal"
      AND PERSON.SSN = RESIDENCY.Person
      AND RESIDENCY.PrincipalResidence = TRUE;

-- … the (distinct) first and last names of the homeowners (Michael Keal, Mridula Warrier).
SELECT DISTINCT (PERSON.FName), PERSON.LName
FROM PERSON, RESIDENCY
WHERE RESIDENCY.Status = "own"
      AND RESIDENCY.Person = PERSON.SSN;
-- cf comment at snippet homonyms

SELECT PERSON.FName, PERSON.LName
FROM PERSON
WHERE SSN IN (SELECT DISTINCT(RESIDENCY.Person) FROM RESIDENCY WHERE RESIDENCY.Status = "own");


-- … the SSN of the persons that have the same principal residency as James Baldwin (000-00-0001).
SELECT RoomMate.Person
FROM RESIDENCY AS James, RESIDENCY AS RoomMate, PERSON
WHERE PERSON.FName = "James"
      AND PERSON.LName = "Baldwin"
      AND PERSON.SSN = James.Person
      AND James.House = RoomMate.House
      AND NOT James.Person = RoomMate.Person
      AND RoomMate.PrincipalResidence = TRUE;

-- end snippet solution5

START TRANSACTION;
-- start snippet homonyms
-- If we have homonymns in our database, e.g.

INSERT INTO PERSON VALUES
    ("A", "B", "000-00-0010", NULL),
    ("A", "B", "000-00-0011", NULL); 

INSERT INTO HOUSE VALUES
    ("H",  NULL); -- H.3

INSERT INTO RESIDENCY VALUES
    ("000-00-0010", "H", TRUE, "own"),
    ("000-00-0011", "H", TRUE, "own");

-- Then the query below fails, in the sense that it 
-- reports the name "A, B" only once.

SELECT DISTINCT (PERSON.FName), PERSON.LName
FROM PERSON, RESIDENCY
WHERE RESIDENCY.Status = "own"
      AND RESIDENCY.Person = PERSON.SSN;

-- A better (and not much more complicated)
-- solution would have been

SELECT PERSON.FName, PERSON.LName
FROM PERSON
WHERE SSN IN
    (SELECT DISTINCT(RESIDENCY.Person)
     FROM RESIDENCY
     WHERE RESIDENCY.Status = "own");
-- end snippet homonyms
ROLLBACK;
