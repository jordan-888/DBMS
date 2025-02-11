SELECT name, email
FROM customer;

SELECT SUM(stock_quantity) AS total_stock_quantity
FROM product;

SELECT MAX(total_amount) AS max_order_amount
FROM orders;

SELECT MIN(duration_hrs) AS min_tracking_duration
FROM tracking_details;

SELECT AVG(price) AS avg_product_price
FROM product;

SELECT name
FROM category;

SELECT name
FROM customer
UNION
SELECT name
FROM product;

SELECT o.order_id, o.total_amount, c.name AS customer_name, c.email AS customer_email
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id;

SELECT p.name
FROM product p
JOIN product_category pc ON p.product_id = pc.product_id
JOIN category c ON pc.category_id = c.category_id;

SELECT c.customer_id, c.name, c.email, SUM(oi.subtotal) AS total_spending
FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_item oi ON o.order_id = oi.order_id
GROUP BY c.customer_id
ORDER BY total_spending DESC
LIMIT 1;
