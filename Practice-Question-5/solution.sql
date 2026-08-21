-- 1. Database
CREATE DATABASE ranking_demo;

USE ranking_demo;


-- 2. Table
CREATE TABLE test_data (
    new_id INT
);


-- 3. Data
INSERT INTO test_data (new_id)
VALUES
(100),
(200),
(200),
(300),
(500),
(500),
(700);

SELECT * FROM test_data;

SELECT
    new_id,

    LEAD(new_id,2) OVER(
        ORDER BY new_id
    ) AS LEAD_VALUE,

    LAG(new_id,2) OVER(
        ORDER BY new_id
    ) AS LAG_VALUE

FROM test_data;
