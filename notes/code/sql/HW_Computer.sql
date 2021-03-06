/* code/sql/HW_Computer.sql */

DROP SCHEMA IF EXISTS HW_Computer;
CREATE SCHEMA HW_Computer;
USE HW_Computer;


CREATE TABLE COMPUTER(
    ID VARCHAR(20) PRIMARY KEY,
    Model VARCHAR(20)
);
    
CREATE TABLE PRINTER(
    ID VARCHAR(20) PRIMARY KEY,
    Model VARCHAR(20)
);
    
CREATE TABLE CONNEXION(
    Computer VARCHAR(20),
    Printer VARCHAR(20),
    PRIMARY KEY(Computer, Printer),
    FOREIGN KEY (Computer) REFERENCES COMPUTER(ID),
    FOREIGN KEY (Printer) REFERENCES PRINTER(ID)
);

INSERT INTO COMPUTER VALUES
    ('A', 'DELL A'),
    ('B', 'HP X'),
    ('C', 'ZEPTO D'),
    ('D', 'MAC Y');

INSERT INTO PRINTER VALUES
    ('12', 'HP-140'),
    ('13', 'HP-139'),
    ('14', 'HP-140'),
    ('15', 'HP-139');

INSERT INTO CONNEXION VALUES
    ('A', '12'),
    ('A', '13'),
    ('B', '13'),
    ('C', '14'); 
