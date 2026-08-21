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


-- Analytical Window Functions
SELECT
    new_id,

    FIRST_VALUE(new_id) OVER(
        ORDER BY new_id
    ) AS FRIST_VALUE,

    LAST_VALUE(new_id) OVER(
        ORDER BY new_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS LSAT_VALUE,

    LEAD(new_id) OVER(
        ORDER BY new_id
    ) AS LEAD_VALUE,

    LAG(new_id) OVER(
        ORDER BY new_id
    ) AS LAG_VALUE

FROM test_data;
