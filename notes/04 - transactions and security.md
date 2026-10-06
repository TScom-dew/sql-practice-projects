# 04 - Database Transactions, ACID Properties, and Security

This note covers database transactions, the ACID properties ensuring data integrity, Transaction Control Language (TCL) commands, and basic database security management.

---

## 1. What is a Transaction?
A **transaction** is a sequence of one or more SQL operations executed as a single unit of work. If any single operation fails, the entire transaction fails to maintain data integrity.

---

## 2. The ACID Properties
To ensure reliable processing, database transactions must satisfy four key properties (ACID):
* **Atomicity:** "All or Nothing." Either all operations in a transaction succeed completely, or none of them are applied.
* **Consistency:** A transaction brings the database from one valid state to another, maintaining all predefined rules (like constraints and foreign keys).
* **Isolation:** Multiple transactions can execute concurrently without interfering with or seeing each other's intermediate uncommitted states.
* **Durability:** Once a transaction is committed, its changes are permanent, even in the event of a system crash or power failure.

---

## 3. Transaction Control Language (TCL) Commands
Commands used to manage changes made by DML statements (`INSERT`, `UPDATE`, `DELETE`):

* **`START TRANSACTION` (or `BEGIN`):** Marks the beginning of a new transaction block.
* **`COMMIT`:** Saves all changes permanently to the database.
* **`ROLLBACK`:** Reverts changes made during the current transaction if an error occurs.
* **`SAVEPOINT`:** Sets a point within a transaction to which you can roll back without rolling back the entire transaction.

```sql
START TRANSACTION;

UPDATE Accounts SET Balance = Balance - 500 WHERE Account_ID = 1;
UPDATE Accounts SET Balance = Balance + 500 WHERE Account_ID = 2;

-- If everything is correct:
COMMIT;

-- If something goes wrong:
-- ROLLBACK;
```

---


## 4. Database Security & Access Control
Ensuring that only authorized users have access to specific data.


- Creating a User:
  ```sql
  CREATE USER 'analyst'@'localhost' IDENTIFIED BY 'secure_password';
  ```
- Granting Privileges (GRANT):
  ```sql
  GRANT SELECT, INSERT ON Supermarket.* TO 'analyst'@'localhost';
  ```

- Revoking Privileges (REVOKE):
  ```sql
  REVOKE INSERT ON Supermarket.* FROM 'analyst'@'localhost';
  ```

- Applying Changes:
  ```sql
  FLUSH PRIVILEGES;
  ```
