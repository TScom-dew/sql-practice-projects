# 03 - Aggregations, Grouping, and Functions

This note covers aggregate functions, data grouping (`GROUP BY`), and conditional group filtering (`HAVING`) to analyze data effectively.

---

## 1. What are Aggregate Functions?
Aggregate functions perform a calculation on a set of values and return a single summary value. They ignore `NULL` values by default.

### Common Aggregate Functions:
* **`COUNT()`**: Counts the number of rows or non-null values.
  ```sql
  SELECT COUNT(*) FROM Customers;
  ```
* **SUM():** Calculates the total sum of a numeric column.

```sql
SELECT SUM(Amount) FROM Orders;
```
* **AVG():** Calculates the average value of a numeric column.
  ```sql
  SELECT AVG(Customer_Age) FROM Customers;
  ```
* **MAX():** Finds the highest value in a column.
  ```sql
  SELECT MAX(Price) FROM Products;
  ```
* **MIN():** Finds the lowest value in a column.
  ```sql
  SELECT MIN(Price) FROM Products;
  ```


## 2. Grouping Data (GROUP BY)
The GROUP BY clause groups rows that share common values into summary rows (e.g., finding the total customers in each city). It is always used alongside aggregate functions.

```sql
-- Count how many customers belong to each city
SELECT City, COUNT(*) AS Total_Customers
FROM Customers
GROUP BY City;
```


## 3. Filtering Groups (`HAVING` vs `WHERE`)

* **`WHERE:`** Filters rows before grouping takes place. It cannot use aggregate functions.

* **`HAVING:`** Filters groups after the GROUP BY clause has been applied. It is specifically used with aggregate functions.
  
```sql
-- Find only those cities that have more than 5 customers
SELECT City, COUNT(*) AS Total_Customers
FROM Customers
GROUP BY City
HAVING COUNT(*) > 5;
```


## 4. Order of Execution in SQL
Knowing the order in which SQL processes a query helps in writing error-free aggregate queries:

1. FROM (and JOINs)
2. WHERE (Filter individual rows)
3. GROUP BY (Group the rows)
4. HAVING (Filter groups)
5. SELECT (Choose final columns)
6. ORDER BY (Sort results)
7. LIMIT (Restrict row output)

