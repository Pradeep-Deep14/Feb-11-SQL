CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100)
);

INSERT INTO products (product_id, product_name) VALUES
(1, 'Laptop'),
(2, 'Mobile'),
(3, 'Tablet');

/*
Write a SQL query to list all products with their IDs
*/

SELECT PRODUCT_NAME,
       PRODUCT_ID
FROM PRODUCTS
