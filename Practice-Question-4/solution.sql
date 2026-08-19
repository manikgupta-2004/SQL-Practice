---After creation of both the tablesi in some database 
SELECT * FROM customers
SELECT * FROM orders

---Left Exclusive Join
SELECT *
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.customer_id IS NULL;


---Right Exclusive Join
SELECT *
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.customer_id IS NULL;
