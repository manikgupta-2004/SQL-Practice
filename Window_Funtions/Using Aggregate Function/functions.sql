-- 1. Database create karo
CREATE DATABASE window_demo;

-- 2. Database select karo
USE window_demo;


-- 3. Table create karo
CREATE TABLE test_data (
    new_id INT,
    new_cat VARCHAR(50)
);


-- 4. Data insert karo
INSERT INTO test_data (new_id, new_cat)
VALUES
(100, 'Agni'),
(200, 'Agni'),
(500, 'Dharti'),
(700, 'Dharti'),
(200, 'Vayu'),
(300, 'Vayu'),
(500, 'Vayu');

SELECT * FROM test_data;


-- 5. Window Functions : only PARTITION BY
SELECT
    new_id,
    new_cat,

    SUM(new_id) OVER (
        PARTITION BY new_cat
    ) AS Total,

    AVG(new_id) OVER (
        PARTITION BY new_cat
    ) AS Average,

    COUNT(new_id) OVER (
        PARTITION BY new_cat
    ) AS `Count`,

    MIN(new_id) OVER (
        PARTITION BY new_cat
    ) AS Min,

    MAX(new_id) OVER (
        PARTITION BY new_cat
    ) AS Max

FROM test_data;

-- 6. Window Functions : only ORDER BY
SELECT
    new_id,
    new_cat,

    SUM(new_id) OVER (
        PARTITION BY new_cat
        ORDER BY new_id
    ) AS Total,

    AVG(new_id) OVER (
        PARTITION BY new_cat
        ORDER BY new_id
    ) AS Average,

    COUNT(new_id) OVER (
        PARTITION BY new_cat
        ORDER BY new_id
    ) AS `Count`,

    MIN(new_id) OVER (
        PARTITION BY new_cat
        ORDER BY new_id
    ) AS Min,

    MAX(new_id) OVER (
        PARTITION BY new_cat
        ORDER BY new_id
    ) AS Max

FROM test_data;

-- 6. Window Functions : OrderBy+Rows
SELECT
    new_id,
    new_cat,

    SUM(new_id) OVER(
        ORDER BY new_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS Total,

    AVG(new_id) OVER(
        ORDER BY new_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS Average,

    COUNT(new_id) OVER(
        ORDER BY new_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS `Count`,

    MIN(new_id) OVER(
        ORDER BY new_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS Min,

    MAX(new_id) OVER(
        ORDER BY new_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS Max

FROM test_data
ORDER BY new_id;
