-- Migration: Add products and reviews tables

-- Problem 1: No primary key on products table
CREATE TABLE products (
    name VARCHAR(255),
    price DECIMAL(10, 2),
    description TEXT
);

-- Problem 2: SELECT * usage and missing WHERE clause
CREATE VIEW all_orders AS
SELECT * FROM orders;

-- Problem 3: Destructive change - dropping a column
ALTER TABLE users DROP COLUMN email;

-- Problem 4: Using reserved keyword as column name
ALTER TABLE orders ADD COLUMN "select" TEXT;

-- Problem 5: No index on foreign key
CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    user_id INTEGER REFERENCES users(id),
    rating INTEGER,
    review_text TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Problem 6: Data-dependent change
ALTER TABLE orders ALTER COLUMN status SET NOT NULL;
ALTER TABLE orders ALTER COLUMN status TYPE INTEGER USING status::integer;

-- Problem 7: SQL injection risk in a comment showing bad practice
-- Example of unsafe query: SELECT * FROM users WHERE id = $user_input
