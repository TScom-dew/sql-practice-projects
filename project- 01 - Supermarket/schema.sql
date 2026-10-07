
-- create database named 'Supermarket_Data'
CREATE DATABASE IF NOT EXISTS Supermarket_Data;

USE Supermarket_Data;

-- now creating customer table
CREATE TABLE Customer ( 
    Customer_Id INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Customer_age  INT
);


-- now creating purchase table
CREATE  TABLE purchase(
    Purchase_id INT PRIMARY KEY,
    Customer_id  INT,
    Purchase_amt FLOAT,
    CONSTRAINT Customer_id_FK FOREIGN KEY(Customer_id) REFERENCES Customer(Customer_id)
);


-- Insert sample data into Customer table
INSERT INTO Customer (Customer_Id, Customer_Name, Customer_age) VALUES
(1, 'John', 15),
(2, 'Sara', 16),
(3, 'Adam', 17);

-- Insert sample data into purchase table (linked via Customer_id)
INSERT INTO purchase (Purchase_id, Customer_id, Purchase_amt) VALUES
(101, 1, 250.50),
(102, 2, 420.00),
(103, 3, 150.75);




