-- Create Database
CREATE DATABASE ecommerce_sql_database;
USE ecommerce_sql_database;

-- Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(100)
);

-- Insert Customers
INSERT INTO customers (customer_id, customer_name, email, city) VALUES
(1, 'Alice', 'alice@example.com', 'New York'),
(2, 'Bob', 'bob@example.com', 'Los Angeles'),
(3, 'Charlie', 'charlie@example.com', 'Chicago'),
(4, 'Diana', 'diana@example.com', 'Houston'),
(5, 'Ethan', 'ethan@example.com', 'Phoenix');

-- Create Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT
);

-- Insert Products
INSERT INTO products (product_id, product_name, price, stock) VALUES
(101, 'Laptop', 900.00, 10),
(102, 'Headphones', 150.00, 25),
(103, 'Keyboard', 100.00, 30),
(104, 'Mouse', 50.00, 40),
(105, 'Monitor', 300.00, 15);

-- Create Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Orders
INSERT INTO orders (order_id, customer_id, product_id, quantity, order_date) VALUES
(1001, 1, 101, 1, '2024-06-01'),
(1002, 2, 102, 2, '2024-06-02'),
(1003, 1, 103, 1, '2024-06-03'),
(1004, 3, 104, 3, '2024-06-04'),
(1005, 4, 105, 1, '2024-06-05');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL server 8.0/uploads/ecommerce_sql_database.csv
INTO TABLE Customers, Products, Orders;
Fields terminated by ','
LINES terminated by '\n'
IGNORE 1 rows;

USE ecommerce_sql_database;

-- a. SELECT, WHERE, ORDER BY, GROUP BY
SELECT customer_name, city 
FROM customers 
WHERE city = 'New York' 
ORDER BY customer_name;

SELECT city, COUNT(*) AS total_customers 
FROM customers 
GROUP BY city;

-- b. JOINS (INNER, LEFT, RIGHT)
SELECT c.customer_name, p.product_name, o.quantity
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN products p ON o.product_id = p.product_id;

SELECT c.customer_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

SELECT o.order_id, c.customer_name
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id;

-- c. Subquery
SELECT customer_name 
FROM customers 
WHERE customer_id IN (
    SELECT customer_id 
    FROM orders 
    GROUP BY customer_id 
    HAVING COUNT(order_id) > 1
);

-- d. Aggregate Functions
SELECT 
    SUM(quantity) AS total_items_sold,
    AVG(quantity) AS avg_items_per_order
FROM orders;

-- e. Create View
CREATE VIEW customer_orders AS
SELECT 
    c.customer_name, 
    p.product_name, 
    o.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;

-- f. Index Optimization
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_orders_product_id ON orders(product_id);