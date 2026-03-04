-- =========================================================
-- MariaDB Random Data Generator for Backup Testing
-- =========================================================

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS numbers;

SET FOREIGN_KEY_CHECKS = 1;

-- =========================================================
-- Helper numbers table (FAST and MariaDB-friendly)
-- =========================================================

CREATE TABLE numbers (
    n INT PRIMARY KEY
) ENGINE=InnoDB;

-- Fill numbers table (1..1,000,000 max capacity)
INSERT INTO numbers (n)
SELECT a.N + b.N*10 + c.N*100 + d.N*1000 + e.N*10000 + 1
FROM
 (SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
  UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
 (SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
  UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,
 (SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
  UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c,
 (SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
  UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) d,
 (SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
  UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) e;

-- =========================================================
-- Tables
-- =========================================================

CREATE TABLE customers (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at DATETIME NOT NULL
) ENGINE=InnoDB;

CREATE TABLE products (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    created_at DATETIME NOT NULL
) ENGINE=InnoDB;

CREATE TABLE orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    order_date DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
) ENGINE=InnoDB;

CREATE TABLE order_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
) ENGINE=InnoDB;

-- =========================================================
-- Insert customers (100k)
-- =========================================================

INSERT INTO customers (first_name, last_name, email, created_at)
SELECT
    CONCAT('First', n),
    CONCAT('Last', n),
    CONCAT('user', n, '@example.com'),
    NOW() - INTERVAL FLOOR(RAND()*365) DAY
FROM numbers
WHERE n <= 100000;

-- =========================================================
-- Insert products (5k)
-- =========================================================

INSERT INTO products (name, price, created_at)
SELECT
    CONCAT('Product ', n),
    ROUND(RAND()*500 + 5, 2),
    NOW() - INTERVAL FLOOR(RAND()*365) DAY
FROM numbers
WHERE n <= 5000;

-- =========================================================
-- Insert orders (300k)
-- =========================================================

INSERT INTO orders (customer_id, order_date, status)
SELECT
    FLOOR(RAND()*100000) + 1,
    NOW() - INTERVAL FLOOR(RAND()*365) DAY,
    ELT(FLOOR(RAND()*4)+1, 'pending','shipped','delivered','cancelled')
FROM numbers
WHERE n <= 300000;

-- =========================================================
-- Insert order items (≈1–5 per order)
-- =========================================================

INSERT INTO order_items (order_id, product_id, quantity, unit_price)
SELECT
    o.id,
    FLOOR(RAND()*5000) + 1,
    FLOOR(RAND()*4) + 1,
    ROUND(RAND()*500 + 5, 2)
FROM orders o
JOIN numbers r ON r.n <= 5
WHERE RAND() < 0.6;

-- =========================================================
-- Indexes
-- =========================================================

CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_order_items_order ON order_items(order_id);
CREATE INDEX idx_order_items_product ON order_items(product_id);

-- =========================================================
-- Summary
-- =========================================================

SELECT
    (SELECT COUNT(*) FROM customers) AS customers,
    (SELECT COUNT(*) FROM products) AS products,
    (SELECT COUNT(*) FROM orders) AS orders,
    (SELECT COUNT(*) FROM order_items) AS order_items;
