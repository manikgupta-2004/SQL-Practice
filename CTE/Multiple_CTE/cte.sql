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

CREATE TABLE address (
    address_id INT PRIMARY KEY,
    city_id INT
);

INSERT INTO address (address_id, city_id)
VALUES
(5, 1),
(6, 1),
(7, 1),
(8, 2),
(9, 1);

CREATE TABLE city (
    city_id INT PRIMARY KEY,
    city VARCHAR(100),
    country_id INT
);

INSERT INTO city (city_id, city, country_id)
VALUES
(1, 'Sasebo', 1),
(2, 'San Bernardino', 2);

CREATE TABLE country (
    country_id INT PRIMARY KEY,
    country VARCHAR(100)
);

INSERT INTO country (country_id, country)
VALUES
(1, 'Japan'),
(2, 'United States');

SELECT * FROM customer;
SELECT * FROM payment;
SELECT * FROM address;
SELECT * FROM city;
SELECT * FROM country;


-- CTE
WITH my_cp AS (
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
    FROM payment AS p
    INNER JOIN customer AS c
        ON p.customer_id = c.customer_id
),

my_ca AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        a.address_id,
        ci.city,
        co.country
    FROM customer AS c
    INNER JOIN address AS a
        ON a.address_id = c.address_id
    INNER JOIN city AS ci
        ON ci.city_id = a.city_id
    INNER JOIN country AS co
        ON co.country_id = ci.country_id
)

SELECT
    cp.first_name,
    cp.last_name,
    cp.amount,
    cp.Average_Price,
    cp.Count,
    ca.country,
    ca.city
FROM my_cp AS cp
INNER JOIN my_ca AS ca
    ON cp.customer_id = ca.customer_id;
       
