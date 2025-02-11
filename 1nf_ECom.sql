-- Create order_items table
CREATE TABLE IF NOT EXISTS order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    item_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Populate order_items table from existing data in orders table
INSERT INTO order_items (order_id, item_name)
SELECT order_id, item_list
FROM orders;

-- Remove item_list column from orders table
ALTER TABLE orders DROP COLUMN item_list;

SELECT * FROM order_items ;