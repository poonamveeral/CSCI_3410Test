/*
DO **NOT** EDIT THE CODE BELOW
*/

DROP SCHEMA IF EXISTS HW_PROJECT1;
CREATE SCHEMA HW_PROJECT1;
USE HW_PROJECT1;

CREATE TABLE TEXTBOOK(
    Title VARCHAR(50),
    ISBN CHAR(13) PRIMARY KEY,
    Price DECIMAL(10,2)
);

CREATE TABLE AUTHOR(
    LName VARCHAR(30),
    FName VARCHAR(30),
    Email VARCHAR(30),
    PRIMARY KEY(Lname, Fname)
);

-- The meaning of this table is that
-- a tuple <I, L, F> means that the
-- author whose last name is L and whose
-- first name is F wrote the textbook
-- whose ISBN is I.

CREATE TABLE AUTHORED(
    Book CHAR(13),
        FOREIGN KEY (Book)
        REFERENCES TEXTBOOK(ISBN),
    AuthorLName VARCHAR(30),
    AuthorFName VARCHAR(30),
        FOREIGN KEY (AuthorLName, AuthorFName)
        REFERENCES AUTHOR(LName, Fname)
);

INSERT INTO TEXTBOOK VALUES
   ('Starting Out with Java: Early Objects',
   9780133776744,
   30.00),
   ('NoSQL for Mere Mortals',
   9780134023212,
   47.99);

INSERT INTO AUTHOR VALUES
   ('Sullivan', 'Dan', NULL),
   ('Gaddis', 'Tony', NULL);

INSERT INTO AUTHORED VALUES
   (9780134023212, 'Sullivan', 'Dan'),
   (9780133776744, 'Gaddis', 'Tony');

/* 
START EDITING
*/

-- start snippet solution

/* code/sql/HW_TEXTBOOK_AUTHORED_SOL.sql */

-- EXERCISE 1

-- Write a command that updates the email address of 'Gaddis', 'Tony' 
-- to "tgaddis@pearson.com"

UPDATE AUTHOR SET Email = "tgaddis@pearson.com"
    WHERE LName = 'Gaddis' AND FName = 'Tony';

-- You can use
-- SELECT * FROM AUTHOR;
-- to check that the modification took place.


-- EXERCISE 2

-- Write a command that inserts the textbook of your choice in the 
-- TEXTBOOK table. No value should be NULL, but you can invent
-- the values.

INSERT INTO TEXTBOOK VALUES ('Fundamentals of Database Systems', 9780133970777, 165.89);

-- You can use
-- SELECT * FROM TEXTBOOK;
-- to check that the insertion was correctly made.


-- EXERCISE 3

-- Write a command that makes 'Gaddis', 'Tony' the author of the
-- textbook you just added to our database.

INSERT INTO AUTHORED VALUES(9780133970777, 'Gaddis', 'Tony');

-- You can use
-- SELECT * FROM AUTHORED;
-- to check that the insertion was correctly made.


-- EXERCISE 4

-- Write a command that makes "0.01" becomes the 
-- default value for the Price attribute of the
-- TEXTBOOK relation.

ALTER TABLE TEXTBOOK ALTER COLUMN Price SET DEFAULT 0.01;

-- You can use
-- DESCRIBE TEXTBOOK;
-- to check that the Price attribute now has a default
-- value.


-- EXERCISE 5

-- Write a command that insert a textbook of
-- your choice in the TEXTBOOK table, with the
-- price set to the default value.

INSERT INTO TEXTBOOK VALUES('Proof Theory', 9780486490731, DEFAULT);

-- You can use
-- SELECT * FROM TEXTBOOK;
-- to check that the insertion was correctly made.


-- EXERCISE 6

-- Write a command that creates a table called EDITOR
-- with 3 attributes, "Name", "Address" and "Website".
-- The "Name" attribute should be the primary key.
-- Then, insert two tuples in the EDITOR table, one
-- should have the "Name" attribute set to "Pearson".

CREATE TABLE EDITOR(
    Name VARCHAR(30)
        PRIMARY KEY,
    Address VARCHAR(255),
    Website VARCHAR(100)
);

INSERT INTO EDITOR VALUES 
    ('Pearson', NULL, 'http://pearsoned.com/'),
    ('Dover', NULL, 'https://store.doverpublications.com/');

-- You can use
-- DESCRIBE EDITOR;
-- to check that the table was actually created, and
-- SELECT * FROM EDITOR;
-- to check that the values were inserted.


-- EXERCISE 7

-- Write a command that creates a table called PUBLISHED
-- with 2 attributes, "Editor", and "Textbook".
-- The "Editor" attribute should references the EDITOR
-- table, and the "Textbook" attribute should reference
-- the TEXTBOOK table.

CREATE TABLE PUBLISHED(
    Editor VARCHAR(30),
        FOREIGN KEY (Editor)
        REFERENCES EDITOR(Name),
    Textbook CHAR(13),
        FOREIGN KEY (Textbook)
        REFERENCES TEXTBOOK(ISBN)
);

-- You can use
-- DESCRIBE PUBLISHED;
-- to check that the table was actually created.


-- EXERCISE 8

-- Write a command that makes "Pearson" the editor of 
-- the textbook whose ISBN is 9780133776744.

INSERT INTO PUBLISHED VALUES ("Pearson", 9780133776744);

-- You can use
-- SELECT * FROM PUBLISHED;
-- to check that the table was actually created.


-- EXERCISE 9

-- Answer the following short questions. In our model, 
-- as it is, …

-- can an author have authored more than one textbook?
-- Yes.

-- can a textbook have more than one author?
-- Yes.

-- can a textbook without ISBN be inserted in the
-- TEXTBOOK relation?
-- No, unless you create a "dummy" (fake) value for it, 
-- like 0000000000000, but this value can be used only
-- once, since ISBN is the primary key.

-- can the price of a textbook be negative?
-- Yes. We can actually test it:
-- INSERT INTO TEXTBOOK VALUES ("Test", 0000000000000, -1);

-- can two author have the same first and last name?
-- No. The query
-- INSERT INTO AUTHOR VALUES ('Smith', 'Bob', NULL), ('Smith', 'Bob', NULL);
-- returns 
-- ERROR 1062 (23000): Duplicate entry 'Smith-Bob' for key 'PRIMARY'

-- can two textbooks have the same title?
-- Yes, as long as they have different ISBN. The command
-- INSERT INTO TEXTBOOK VALUES ("Test", 0000000000001, NULL), ("Test", 0000000000002, NULL);
-- is processed just fine.

-- can two editiors have the same address?
-- Yes. The command
-- INSERT INTO EDITOR VALUES ("Test 1", "123 Main St.", NULL), ("Test 2", "123 Main St.", NULL);
-- is processed just fine.

-- end snippet solution
