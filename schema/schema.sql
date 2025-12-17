-- This schema intentionally violates multiple rules for testing:
-- 1. Table name "fakeTable" is not snake_case (should be fake_table)
-- 2. Primary key column is "idd" instead of "id"
-- 3. Missing created_at and updated_at columns
-- 4. Using VARCHAR instead of TEXT

CREATE TABLE "public"."fakeTable" (
    "idd" serial,
    "name" VARCHAR(16)
);
