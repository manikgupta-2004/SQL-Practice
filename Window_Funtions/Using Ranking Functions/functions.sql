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


-- 4. Ranking Window Functions
SELECT
    new_id,

    ROW_NUMBER() OVER(
        ORDER BY new_id
    ) AS ROW_NO,

    RANK() OVER(
        ORDER BY new_id
    ) AS RANK_NO,

    DENSE_RANK() OVER(
        ORDER BY new_id
    ) AS DENSE_RANK_NO,

    PERCENT_RANK() OVER(
        ORDER BY new_id
    ) AS PERCENT_RANK_NO

FROM test_data;
