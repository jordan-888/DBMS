-- Create a new table for order_item_details
CREATE TABLE IF NOT EXISTS order_item_details (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    quantity INT NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Populate order_item_details table from existing data in order_item table
INSERT INTO order_item_details (order_item_id, order_id, quantity, subtotal)
SELECT order_item_id, order_id, quantity, subtotal
FROM order_item;

-- Remove the quantity and subtotal columns from the order_item table
ALTER TABLE order_item DROP COLUMN quantity, DROP COLUMN subtotal;

SELECT * FROM order_item;
SELECT * FROM order_item_details;