CREATE TABLE products (
    id INTEGER,
    name VARCHAR(255),
    price FLOAT,
    description TEXT NOT NULL DEFAULT ''
);

ALTER TABLE orders ADD COLUMN discount FLOAT;

DROP TABLE IF EXISTS users;
