# Ecommerce_sql_database
Task 4-SQL for data analysis 

This repository contains SQL scripts, sample dataset tables, and query result screenshots for analyzing a basic ecommerce database using MySQL.

Project Structure:
Ecommerce_sql_dataset.sql – Full SQL script including:
  - Table creation
  - Sample data insertion
  - Queries from mini-guide: SELECT, JOINs, Subqueries, Aggregates, View, Index
- `Ecommerce_sql_dataset.sql` – Query-only script based on the hints/guide
- `.png` files – Individual query result screenshots (SELECT, JOIN, GROUP BY, etc.)

Dataset Overview:
Three tables are used:
- `customers`: Basic customer information
- `products`: Product catalog with price and stock
- `orders`: Transactions connecting customers and products

Query Highlights:
The project demonstrates:
- Basic filtering and sorting using `SELECT`, `WHERE`, `ORDER BY`
- Grouping data using `GROUP BY` and `COUNT()`
- Joining multiple tables (`INNER`, `LEFT JOIN`)
- Subquery to identify frequent buyers
- Aggregate functions: `SUM()`, `AVG()`
- Creating SQL views for simplified access
- Indexing for performance optimization

Tools Used:
- MySQL Workbench

Output Preview:
Query results are visualized as screenshots

How to Use:
1. Clone the repo
2. Run `Ecommerce_sql_database.sql` in MySQL
3. Explore results or modify queries as needed
