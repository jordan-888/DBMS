-- Create a new table for order totals
CREATE TABLE IF NOT EXISTS order_totals (
    order_id INT PRIMARY KEY,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Populate order_totals table from existing data in orders table
INSERT INTO order_totals (order_id, total_amount)
SELECT order_id, total_amount
FROM orders;

-- Remove total_amount column from orders table
ALTER TABLE orders DROP COLUMN total_amount;

SELECT * FROM order_totals ;
SELECT * FROM orders;