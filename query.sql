-- 1. Retrieve all customers who placed an order in the last 30 days
SELECT DISTINCT c.name, c.email
FROM customers c
JOIN orders o ON c.id = o.customer_id
WHERE o.order_date >= CURDATE() - INTERVAL 30 DAY;

-- 2. Get total amount of all orders placed by each customer
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.name;

-- 3. Update the price of Product C to 45.00
UPDATE products SET price = 45.00 WHERE name = 'Product C';

-- 4. Add a new column discount to products table
ALTER TABLE products ADD COLUMN discount DECIMAL(5,2) DEFAULT 0.00;

-- 5. Retrieve top 3 products with highest price
SELECT name, price FROM products ORDER BY price DESC LIMIT 3;

-- 6. Get names of customers who ordered Product A
SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE p.name = 'Product A';

-- 7. Join orders and customers to get customer name and order date
SELECT c.name, o.order_date
FROM customers c
JOIN orders o ON c.id = o.customer_id;

-- 8. Retrieve orders with total amount greater than 150.00
SELECT * FROM orders WHERE total_amount > 150.00;

-- 9. Normalize: create order_items table
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Example insert into order_items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2), (2, 2, 3);

-- 10. Retrieve average total of all orders
SELECT AVG(total_amount) AS avg_order_total FROM orders;
