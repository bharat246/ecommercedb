-- Create database
CREATE DATABASE ecommerce;
USE ecommerce;

-- Create customers table
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    address VARCHAR(255)
);

-- Create products table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    description TEXT
);

-- Create orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Insert sample data
INSERT INTO customers (name, email, address) VALUES
('Alice', 'alice@example.com', 'Delhi'),
('Bob', 'bob@example.com', 'Mumbai'),
('Charlie', 'charlie@example.com', 'Bangalore');

INSERT INTO products (name, price, description) VALUES
('Product A', 30.00, 'Basic product'),
('Product B', 60.00, 'Premium product'),
('Product C', 50.00, 'Special product');

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, CURDATE(), 120.00),
(2, CURDATE() - INTERVAL 10 DAY, 200.00),
(3, CURDATE() - INTERVAL 40 DAY, 80.00);
