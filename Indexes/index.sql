CREATE TABLE accounts (
     account_id INT PRIMARY KEY, 
     name VARCHAR (50), 
     balance DECIMAL (10, 2), 
     branch VARCHAR (50)
);

INSERT INTO accounts 
VALUES
(1, 'Adam', 500.00, 'Mumbai'), 
(2, 'Bob', 300.00, 'Delhi'),
(3, 'Charlie', 700.00, 'Bangalore'),
(4, 'David', 1000.00, 'Noida');

SELECT * FROM accounts;
-- Single Index
CREATE INDEX idx_branch ON accounts(branch);

SHOW INDEX FROM accounts;

SELECT * 
FROM accounts
WHERE branch = 'Mumbai';
-- DROP INDEX idx_branch ON accounts;

-- Multi Index
CREATE INDEX idx2_branch ON accounts(branch, balance); 
SHOW INDEX FROM accounts;
