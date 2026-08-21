-- 1. Database create
CREATE DATABASE sql_practice;

-- 2. Database select
USE sql_practice;


-- 3. Table create
CREATE TABLE payment (
    customer_id INT,
    amount INT,
    mode VARCHAR(50),
    payment_date DATE
);


-- 4. Data insert
INSERT INTO payment 
(customer_id, amount, mode, payment_date)
VALUES
(1, 60, 'Cash', '2020-09-24'),
(10, 70, 'Mobile Payment', '2021-02-28'),
(11, 80, 'Cash', '2021-03-01'),
(2, 500, 'Credit Card', '2020-04-27'),
(8, 100, 'Cash', '2021-01-26');


-- 5. Check table
SELECT *
FROM payment;


-- 6. Case Statement
SELECT
    customer_id,
    amount,
    CASE
        WHEN amount > 100 THEN 'Expensive Product'
        WHEN amount = 100 THEN 'Normal Product'
        ELSE 'Inexpensive Product'
    END AS ProductStatus
FROM payment;

-- 7. Case Expression
SELECT
    customer_id,
    CASE amount
        WHEN 500 THEN 'Prime Customer'
        WHEN 100 THEN 'Plus Customer'
        ELSE 'Regular Customer'
    END AS CustomerStatus
FROM payment;
