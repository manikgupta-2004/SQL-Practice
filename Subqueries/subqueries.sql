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

-- Sub-Queries in SQL
SELECT * FROM customers;
SELECT * FROM orders;

-- Wiht WHERE : subquery inside WHERE
SELECT *
FROM orders
WHERE amount > (
     SELECT AVG(amount)
     FROM orders
);

-- Wiht SELECT : subquery inside SELECT
SELECT name,
      (
		 SELECT COUNT(*)
         FROM orders o 
		 WHERE o.customer_id = c.customer_id
      ) AS order_count
FROM customers c;

-- Wiht FROM : subquery inside FROM
SELECT 
   summary.customer_id,
   summary.avg_amount
FROM
  (
    SELECT 
         customer_id,
         AVG(amount) AS avg_amount
	FROM orders
    GROUP BY customer_id
    ) AS summary;
