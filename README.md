README – SQL Script Description

This script creates and manages two related tables: users and category.
It is written for SQLite.

1. Structure

Cleanup: Drops existing users and category tables if they exist.

Table creation:

category: Stores categories (e.g., admin, developer, manager).

users: Stores user data with a foreign key (category_id) referencing category.

2. Sample Data

Inserts three categories and several users.

Users are linked to their respective categories.

3. Queries

Selects specific columns with aliases.

Selects a user by ID.

Sorts users alphabetically (ascending or descending).

4. Data Update

Example UPDATE: changes a user’s password and email based on their ID.

5. Joins

INNER JOIN: Returns users with valid categories.

LEFT JOIN: Returns all users, even those without a category.

RIGHT JOIN: Not directly supported; simulated using reversed LEFT JOIN.
