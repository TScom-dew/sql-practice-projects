USE Supermarket_Data;

-- 1. Viewing individual table data
SELECT * FROM Customer;

SELECT * FROM purchase;

-- 2. Left Join (All customers + matching purchases)
SELECT * 
FROM Customer 
LEFT JOIN purchase 
ON Customer.Customer_Id = purchase.Customer_Id;

-- 3. Right Join (All purchases + matching customers)
SELECT * 
FROM Customer 
RIGHT JOIN purchase 
ON Customer.Customer_Id = purchase.Customer_Id;

-- 4. Inner Join ( Returns only the records that have matching IDs in both tables. )
SELECT * 
FROM Customer 
INNER JOIN purchase 
ON Customer.Customer_Id = purchase.Customer_Id;


-- 5. Full Outer Join (Emulated in MySQL using UNION)
SELECT * 
FROM Customer 
LEFT JOIN purchase 
ON Customer.Customer_Id = purchase.Customer_Id
UNION
SELECT * 
FROM Customer 
RIGHT JOIN purchase 
ON Customer.Customer_Id = purchase.Customer_Id;



-- -------------------------------------------------------------------------
-- 6. Cross Join
-- Description: Combines every row from the Customer table with every row 
-- from the purchase table (Cartesian product). Every customer is paired with every purchase.
-- -------------------------------------------------------------------------
SELECT * 
FROM Customer 
CROSS JOIN purchase;


-- -------------------------------------------------------------------------
-- 7. Filtered Join (Join with WHERE clause)
-- Description: Joins both tables and filters results to show only those records 
-- where the purchase amount is greater than 200.
-- -------------------------------------------------------------------------
SELECT Customer.Customer_Name, purchase.Purchase_amt
FROM Customer
INNER JOIN purchase 
ON Customer.Customer_Id = purchase.Customer_Id
WHERE purchase.Purchase_amt > 200.00;



-- -------------------------------------------------------------------------
-- 8. Aggregate Query with Join (GROUP BY & SUM)
-- Description: Joins tables and calculates the total purchase amount spent 
-- by each individual customer using grouping and aggregate functions.
-- -------------------------------------------------------------------------
SELECT Customer.Customer_Name, SUM(purchase.Purchase_amt) AS Total_Spent
FROM Customer
INNER JOIN purchase 
ON Customer.Customer_Id = purchase.Customer_Id
GROUP BY Customer.Customer_Id, Customer.Customer_Name;


-- -------------------------------------------------------------------------
-- 9. Temporary Table or Subquery with Join
-- Description: Create a temporary table or use a subquery to filter and analyze 
-- aggregated data (e.g., finding customers whose total spending is above a certain threshold).
-- -------------------------------------------------------------------------
--? To create Temprory table we can use With keyword

With top_purchase AS(SELECT  Purchase_id, Customer_id , purchase_amt from Purchase WHERE purchase_amt>=200)

SELECT Customer.Customer_name , top_purchase.purchase_amt from Customer
INNER JOIN top_purchase
on Customer.Customer_id= top_purchase.Customer_id;


-- -------------------------------------------------------------------------
-- 10. Subquery with IN Operator
-- Description: Find all details of customers who have made at least one purchase 
-- by using a subquery to fetch customer IDs from the purchase table.
-- -------------------------------------------------------------------------

with temp_table as (
    SELECT Customer_id from Purchase
)

SELECT * FROM Customer WHERE Customer_id IN (SELECT * FROM temp_table);