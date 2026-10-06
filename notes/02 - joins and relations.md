# 02 - Database Relationships & SQL Joins

This note covers how data is linked across multiple tables using keys and how to combine data using various types of SQL Joins.

---

## 1. Table Relationships & Keys
In a relational database, data is split into multiple related tables to avoid duplication and maintain organization.
* **Primary Key (PK):** A unique identifier for each record in a table (e.g., `Customer_id`). It cannot be null or duplicated.
* **Foreign Key (FK):** A field in one table that refers to the Primary Key in another table, establishing a link between them.

---

## 2. What is a JOIN?
A `JOIN` clause is used to combine rows from two or more tables based on a related column between them.

---

## 3. Types of SQL Joins

### A. INNER JOIN
Returns only the records that have matching values in both tables. Unmatched rows are excluded.
```sql
SELECT Customers.Customer_Name, Orders.Order_ID
FROM Customers
INNER JOIN Orders ON Customers.Customer_id = Orders.Customer_id;
```

### B. LEFT JOIN (or LEFT OUTER JOIN)
Returns all records from the left table, and the matched records from the right table. If there is no match, the right side returns NULL.

```sql
SELECT Customers.Customer_Name, Orders.Order_ID
FROM Customers
LEFT JOIN Orders ON Customers.Customer_id = Orders.Customer_id;
```

### C. RIGHT JOIN (or RIGHT OUTER JOIN)
Returns all records from the right table, and the matched records from the left table. If there is no match, the left side returns NULL.

```sql
SELECT Customers.Customer_Name, Orders.Order_ID
FROM Customers
RIGHT JOIN Orders ON Customers.Customer_id = Orders.Customer_id;
```

### D. FULL OUTER JOIN
Returns all records when there is a match in either the left or right table.

> [!Note] Note: MySQL does not support FULL OUTER JOIN directly, but it can be simulated using a UNION of LEFT and RIGHT joins.

```sql
SELECT Customers.Customer_Name, Orders.Order_ID
FROM Customers
LEFT JOIN Orders ON Customers.Customer_id = Orders.Customer_id
UNION
SELECT Customers.Customer_Name, Orders.Order_ID
FROM Customers
RIGHT JOIN Orders ON Customers.Customer_id = Orders.Customer_id;
```


