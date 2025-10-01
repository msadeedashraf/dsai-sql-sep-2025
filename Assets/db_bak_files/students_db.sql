/*
https://www.geeksforgeeks.org/sql/sql-insert-statement/
*/

CREATE DATABASE StudentDB;
USE StudentDB;

CREATE TABLE Student (
    ROLL_NO INT PRIMARY KEY,
    NAME VARCHAR(50),
    ADDRESS VARCHAR(100),
    PHONE VARCHAR(15),
    AGE INT
);

INSERT INTO Student (ROLL_NO, NAME, ADDRESS, PHONE, AGE) VALUES
(1, 'Ram', 'Delhi', 'XXXXXXXXXX', 18),
(2, 'Ramesh', 'Gurgaon', 'XXXXXXXXXX', 18),
(3, 'Sujit', 'Rohtak', 'XXXXXXXXXX', 20),
(4, 'Suresh', 'Rohtak', 'XXXXXXXXXX', 18);

INSERT INTO Student 
VALUES ('5','HARSH','WEST BENGAL', 'XXXXXXXXXX','19');



INSERT INTO Student (ROLL_NO, NAME, AGE, ADDRESS, PHONE) 
VALUES
(6, 'Amit Kumar', 15, 'Delhi', 'XXXXXXXXXX'),
(7, 'Gauri Rao', 18, 'Bangalore', 'XXXXXXXXXX'),
(8, 'Manav Bhatt', 17, 'New Delhi', 'XXXXXXXXXX'),
(9, 'Riya Kapoor', 10, 'Udaipur', 'XXXXXXXXXX');