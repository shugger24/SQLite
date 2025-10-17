# SQLite Users & Category Script

## Overview
SQL script for creating and managing two related tables in **SQLite**:  
`users` and `category`.

## Structure
- Drops existing tables if they exist.  
- Creates `category` (stores roles like admin, developer, manager).  
- Creates `users` (stores user data with a foreign key to `category`).  

## Sample Data
- Inserts example categories and users.  
- Links users to categories via `category_id`.

## Queries
- Selects users and categories with aliases.  
- Filters users by ID.  
- Sorts users alphabetically (ASC/DESC).  

## Updates & Joins
- Updates user password and email by ID.  
- Demonstrates `INNER JOIN` and `LEFT JOIN`.  
- Simulates `RIGHT JOIN` via reversed `LEFT JOIN`.

## Notes
For demonstration and learning purposes only.
