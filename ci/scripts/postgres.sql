-- =========================================================
-- Random Test Data Generator for PostgreSQL Backup Testing
-- =========================================================

-- Optional: speed up bulk inserts
SET synchronous_commit = OFF;
SET maintenance_work_mem = '512MB';

-- =========================================================
-- Drop existing tables (safe reset)
-- =========================================================

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- =========================================================
-- Create tables
-- =========================================================

CREATE TABLE customers (
    id BIGSERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE products (
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE orders (
    id BIGSERIAL PRIMARY KEY,
    customer_id BIGINT NOT NULL REFERENCES customers(id),
    order_date TIMESTAMP NOT NULL,
    status TEXT NOT NULL
);

CREATE TABLE order_items (
    id BIGSERIAL PRIMARY KEY,
    order_id BIGINT NOT NULL REFERENCES orders(id),
    product_id BIGINT NOT NULL REFERENCES products(id),
    quantity INT NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL
);

-- =========================================================
-- Insert customers
-- Adjust the number in generate_series for scale
-- =========================================================

INSERT INTO customers (first_name, last_name, email, created_at)
SELECT
    'First' || gs,
    'Last' || gs,
    'user' || gs || '@example.com',
    NOW() - (random() * interval '365 days')
FROM generate_series(1, 100000) AS gs;

-- =========================================================
-- Insert products
-- =========================================================

INSERT INTO products (name, price, created_at)
SELECT
    'Product ' || gs,
    ROUND((random() * 500 + 5)::numeric, 2),
    NOW() - (random() * interval '365 days')
FROM generate_series(1, 5000) AS gs;

-- =========================================================
-- Insert orders
-- =========================================================

INSERT INTO orders (customer_id, order_date, status)
SELECT
    (random() * 99999 + 1)::BIGINT,
    NOW() - (random() * interval '365 days'),
    (ARRAY['pending','shipped','delivered','cancelled'])[floor(random()*4)+1]
FROM generate_series(1, 300000);

-- =========================================================
-- Insert order items
-- Each order gets 1–5 items
-- =========================================================

INSERT INTO order_items (order_id, product_id, quantity, unit_price)
SELECT
    o.id,
    (random() * 4999 + 1)::BIGINT,
    (random() * 4 + 1)::INT,
    ROUND((random() * 500 + 5)::numeric, 2)
FROM orders o
CROSS JOIN LATERAL generate_series(1, (random()*4 + 1)::INT);

-- =========================================================
-- Indexes (important for realistic backup size)
-- =========================================================

CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_order_items_order ON order_items(order_id);
CREATE INDEX idx_order_items_product ON order_items(product_id);

-- =========================================================
-- Analyze for realistic planner stats
-- =========================================================

ANALYZE;

-- =========================================================
-- Summary
-- =========================================================

SELECT
    (SELECT count(*) FROM customers) AS customers,
    (SELECT count(*) FROM products) AS products,
    (SELECT count(*) FROM orders) AS orders,
    (SELECT count(*) FROM order_items) AS order_items;
