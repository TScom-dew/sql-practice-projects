# 01 - SQL Basics & Fundamentals

This note covers the core fundamentals of SQL (Structured Query Language), essential commands, and filtering techniques used to interact with relational databases.

---

## 1. Introduction to SQL
* **SQL** stands for Structured Query Language. It is used to communicate with, manage, and query relational databases (like MySQL, PostgreSQL, Oracle).
* **Tables:** Data is stored in rows (records) and columns (fields).

---

## 2. Core Retrieval Commands (`SELECT` & `FROM`)
The most basic building block of any SQL query is retrieving data from a table.

```sql
-- Select all columns from a table
SELECT * 
FROM Customers;

-- Select specific columns
SELECT Customer_Name, Customer_Age 
FROM Customers;
```

## 3. Filtering Data (WHERE Clause)
The WHERE clause is used to filter records that fulfill a specified condition.

```sql
-- Filter rows based on a condition
SELECT * 
FROM Customers 
WHERE Customer_Age > 18;
```
### Common Operators used in WHERE:

- Comparison: ` =, != (or <>), >, <, >=, <= `

- Logical Operators: AND, OR, NOT
  ```sql
  SELECT * FROM Customers WHERE Age > 18 AND City = 'Delhi';
  ```

- Special Operators:
  - IN: To specify multiple possible values.
 
    ```sql
    SELECT * FROM Customers WHERE City IN ('Delhi', 'Mumbai', 'Patna');
    ```
  - BETWEEN: To select values within a given range.
    ```sql
    SELECT * FROM Customers WHERE Age BETWEEN 18 and 30;
    ```

  - LIKE: For pattern matching (using % wildcard).
    ```sql
    SELECT * FROM Customers WHERE Customer_Name LIKE 'A%'; -- Names starting with 'A'
    ```

## 4. Sorting Data (ORDER BY)

Used to sort the result set in ascending or descending order.

- Ascending (Default): ASC

- Descending: DESC
```sql
SELECT * 
FROM Customers 
ORDER BY Customer_Age DESC;

```

## 5. Limiting Results (LIMIT)
Used to restrict the number of rows returned by a query (very useful for large datasets or previews).

```sql
SELECT * 
FROM Customers 
LIMIT 5;
```



