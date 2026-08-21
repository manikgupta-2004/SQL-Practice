CREATE DATABASE cte_practice;

USE cte_practice;


-- CUSTOMER TABLE
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    address_id INT
);

INSERT INTO customer
(customer_id, first_name, last_name, address_id)
VALUES
(1, 'Mary', 'Smith', 5),
(3, 'Linda', 'Williams', 7),
(4, 'Barbara', 'Jones', 8),
(2, 'Madan', 'Mohan', 6),
(17, 'R', 'Madhav', 9);

-- PAYMENT TABLE
CREATE TABLE payment (
    customer_id INT,
    amount INT,
    mode VARCHAR(50),
    payment_date DATE
);

INSERT INTO payment
(customer_id, amount, mode, payment_date)
VALUES
(1, 60, 'Cash', '2020-09-24'),
(11, 80, 'Cash', '2021-03-01'),
(2, 500, 'Credit Card', '2020-04-27'),
(8, 100, 'Cash', '2021-01-26'),
(7, 20, 'Mobile Payment', '2021-02-01'),
(17, 250, 'Credit Card', '2021-04-01'),
(10, 70, 'Mobile Payment', '2021-02-28');

SELECT * FROM customer;
SELECT * FROM payment;

-- CTE
WITH my_cte AS(
    SELECT 
        p.customer_id,
        p.amount,
        p.mode,
        p.payment_date,
        c.first_name,
        c.last_name,
        c.address_id,
        
       AVG(p.amount) OVER(
           ORDER BY p.customer_id
	   ) AS Average_Price,
	   COUNT(c.address_id) OVER(
           ORDER BY c.customer_id
	   ) AS Count
    FROM payment as p
    INNER JOIN customer AS c
    ON p.customer_id = c.customer_id
)
SELECT first_name, last_name, amount, Average_Price, Count
FROM my_cte;
       
