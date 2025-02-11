-- Create a new table for product prices
CREATE TABLE IF NOT EXISTS product_prices (
    product_id INT PRIMARY KEY,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Populate product_prices table from existing data in product table
INSERT INTO product_prices (product_id, price)
SELECT product_id, price
FROM product;

-- Remove the price column from the product table
ALTER TABLE product DROP COLUMN price;

-- Add the price_id column to the order_item table
ALTER TABLE order_item ADD COLUMN price_id INT;

-- Update the order_item table to reference the new product_prices table
UPDATE order_item oi
JOIN product_prices pp ON oi.product_id = pp.product_id
SET oi.price_id = pp.product_id
WHERE oi.order_item_id > 0;

-- Removing foreign key constraints
ALTER TABLE product_category DROP FOREIGN KEY product_category_ibfk_1;
ALTER TABLE product_prices DROP FOREIGN KEY product_prices_ibfk_1;
ALTER TABLE order_item DROP FOREIGN KEY order_item_ibfk_2;

ALTER TABLE order_item DROP COLUMN product_id;

-- Adding back the required constraints
ALTER TABLE product_category ADD FOREIGN KEY (product_id) REFERENCES product(product_id);
ALTER TABLE product_prices ADD FOREIGN KEY (product_id) REFERENCES product(product_id);
-- ALTER TABLE order_item ADD FOREIGN KEY (product_id) REFERENCES product(product_id);

SELECT * FROM product;
SELECT * FROM order_item;
SELECT * FROM product_prices;

-- Determining foreign key constraints for product_id
SELECT TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_NAME = 'product' AND REFERENCED_COLUMN_NAME = 'product_id';
