CREATE DATABASE IF NOT EXISTS joins;

USE joins;

CREATE TABLE customers (
	customer_id INT PRIMARY KEY, 
    name VARCHAR (50), 
    city VARCHAR (50)
);

INSERT INTO customers 
VALUES
(1, 'Alice','Mumbai'),
(2,'Bob','Delhi'),
(3, 'Charlie','Bangalore'),
(4, 'David', 'Mumbai');

CREATE TABLE orders (
    order_id INT PRIMARY KEY, 
    customer_id INT, 
    amount INT
);

INSERT INTO orders 
VALUES
(101, 1, 500),
(102, 1, 900),
(103, 2, 300),
(104, 5, 700);

SELECT * FROM customers;
SELECT * FROM orders;

CREATE VIEW view1 AS
SELECT customer_id, name FROM customers;

SELECT * FROM view1;

CREATE VIEW view2 AS
SELECT c.customer_id, c.name, o.order_id
FROM customers c 
INNER JOIN orders o
ON c.customer_id = o.customer_id;

SELECT * FROM view2;
