SHOW GRANTS FOR 'root'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE ON ECommerceWebsite.customer TO 'root'@'localhost';

REVOKE INSERT, UPDATE ON ECommerceWebsite.customer FROM 'root'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE ON ECommerceWebsite.customer TO 'root'@'localhost';

