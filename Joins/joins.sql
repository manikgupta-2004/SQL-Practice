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

-- INNER JOIN
SELECT * 
FROM customers as c
INNER JOIN orders as o
ON c.customer_id = o.customer_id;

-- LEFT JOIN
SELECT * 
FROM customers as c
LEFT JOIN orders as o
ON c.customer_id = o.customer_id;

-- RIGHT JOIN
SELECT * 
FROM customers as c
RIGHT JOIN orders as o
ON c.customer_id = o.customer_id;

-- OUTER JOIN : UNION
SELECT * 
FROM customers as c
LEFT JOIN orders as o
ON c.customer_id = o.customer_id
UNION
SELECT * 
FROM customers as c
RIGHT JOIN orders as o
ON c.customer_id = o.customer_id;

-- CROSS JOIN 
SELECT * 
FROM customers as c
CROSS JOIN orders as o;

-- SELF JOIN 
SELECT * 
FROM customers as c
JOIN customers as o
ON c.customer_id = o.customer_id;

-- EXCLUSIVE JOIN : LEFT & RIGHT
-- Left Exclusive Join
SELECT *
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.customer_id IS NULL;

-- Right Exclusive Join
SELECT *
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.customer_id IS NULL;


