-- ==========================================
-- Clean up existing tables
-- ==========================================
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS category;

-- ==========================================
-- Create tables
-- ==========================================

-- Table: category (1 side of the relationship)
CREATE TABLE category (
    id INTEGER PRIMARY KEY AUTOINCREMENT,     -- Primary key (unique identifier)
    name TEXT NOT NULL,                       -- Category name (e.g., admin, developer)
    description TEXT                          -- Optional description
);

-- Table: users (N side of the relationship)
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,     -- Primary key (unique identifier)
    username TEXT NOT NULL,                   -- User's login name
    password TEXT NOT NULL,                   -- User's password (in practice: hash it)
    email TEXT NOT NULL,                      -- User's email address
    category_id INTEGER,                      -- Foreign key to category table

    FOREIGN KEY (category_id) REFERENCES category(id)  -- Establish relationship
);

-- ==========================================
-- Insert sample data
-- ==========================================

-- Insert categories
INSERT INTO category (name, description) VALUES
    ('admin', 'Has full access'),
    ('developer', 'Responsible for coding'),
    ('manager', 'Responsible for oversight');

-- Insert users
INSERT INTO users (username, password, email, category_id) VALUES
    ('mario', 'geheim', 'tom@gmail.com', 1),
    ('max', '1234', 'max@gmail.com', 3),
    ('oliver', 'text', 'oliver@gmail.com', 3),
    ('tim', 'geheim', 'tim@gmail.com', 1),
    ('hannes', '1234', 'hannes@gmail.com', 3),
    ('max', 'text', 'max@gmail.com', 3);

-- ==========================================
-- Select queries
-- ==========================================

-- Select specific columns with alias
SELECT username AS name, email
FROM users;

-- Select user by ID
SELECT *
FROM users
WHERE id = 2;

-- Sort users alphabetically (descending)
SELECT *
FROM users
ORDER BY username DESC; -- use ASC for ascending

-- ==========================================
-- Update data
-- ==========================================
UPDATE users
SET password = '9999', email = 'neu@gmail.com'
WHERE id = 2;

-- ==========================================
-- Join examples
-- ==========================================

-- 1. INNER JOIN: Returns users that have a matching category
SELECT users.username, category.name AS category_name
FROM users
INNER JOIN category ON users.category_id = category.id;

-- 2. LEFT JOIN: Returns all users, even if they don’t have a category
SELECT *
FROM users
LEFT JOIN category ON users.category_id = category.id;

-- 3. RIGHT JOIN: Returns all categories, even if no users belong to them
-- Note: SQLite does NOT support RIGHT JOIN directly. Use LEFT JOIN and swap table order.
SELECT users.username, category.name AS category_name
FROM category
LEFT JOIN users ON users.category_id = category.id;

-- 4. FULL OUTER JOIN: Returns all users and all categories
-- SQLite does NOT support FULL JOIN directly.
-- You can simulate it with UNION of LEFT and RIGHT joins:
SELECT users.username, category.name AS category_name
FROM users
LEFT JOIN category ON users.category_id = category.id
UNION
SELECT users.username, category.name AS category_name
FROM category
LEFT JOIN users ON users.category_id = category.id;

-- ==========================================
-- Delete data
-- ==========================================
DELETE FROM users
WHERE id = 2;