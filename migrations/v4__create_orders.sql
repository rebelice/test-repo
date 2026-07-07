CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    amount NUMERIC(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
