INSERT INTO customer (customer_id, name, email, phone_number) 
VALUES(101, 'Dev', 'dev@example.com', '123-456-7890');

UPDATE customer SET phone_number = '987-654-3210' WHERE customer_id = 101;

DELETE FROM customer WHERE customer_id = 101;

SELECT * FROM customer;