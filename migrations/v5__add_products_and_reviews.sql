CREATE TABLE products (
    name VARCHAR(255),
    price DECIMAL(10, 2),
    description TEXT
);

CREATE VIEW all_orders AS
SELECT * FROM orders;

ALTER TABLE users DROP COLUMN email;

ALTER TABLE orders ADD COLUMN "select" TEXT;

CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    user_id INTEGER REFERENCES users(id),
    rating INTEGER,
    review_text TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

ALTER TABLE orders ALTER COLUMN status SET NOT NULL;
ALTER TABLE orders ALTER COLUMN status TYPE INTEGER USING status::integer;
