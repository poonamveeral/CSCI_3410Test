/* code/sql/HW_RESIDENCY.sql */

DROP SCHEMA IF EXISTS HW_RESIDENCY;
CREATE SCHEMA HW_RESIDENCY;
USE HW_RESIDENCY;

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
