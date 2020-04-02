/* code/sql/HW_PKtest.sql */

DROP SCHEMA IF EXISTS HW_PKtest;
CREATE SCHEMA HW_PKtest;
USE HW_PKtest;

CREATE TABLE TEST(
    A INT,
    B INT,
    PRIMARY KEY (A,B)
);
