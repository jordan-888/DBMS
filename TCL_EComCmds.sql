-- Start a transaction
START TRANSACTION;

-- Create a savepoint
SAVEPOINT before_update;

-- Inserting a new customer
INSERT INTO customer (customer_id, name, email, phone_number) VALUES (102, 'Rohit', 'ro@example.com', '123-456-7890');

-- Update the customer's phone number
UPDATE customer SET phone_number = '987-654-3210' WHERE customer_id = 102;

-- View the changes
SELECT * FROM customer WHERE customer_id = 102;

-- Rollback to the savepoint if needed
ROLLBACK TO before_update;

DELETE FROM customer WHERE customer_id = 102;

-- If the changes are satisfactory, commit the transaction
COMMIT ;
