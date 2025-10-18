# DP-080 T-SQL Conceptual Case Study Questions (Non-Coding, Set of 10)
_Author: Microsoft Learn-based T-SQL Concept Reinforcement_  
_Based on: https://learn.microsoft.com/en-us/training/paths/get-started-querying-with-transact-sql/_

This set of case study questions is designed to evaluate a student’s understanding of key T-SQL concepts through real-world reasoning, use-case analysis, and best practice evaluation—**without requiring actual SQL code**.

---

## 🧠 Conceptual Case Study Questions

---

### 🧩 Case Study 1: WHERE vs HAVING

**Scenario:**  
Your team lead has asked you to explain why a recent report filtered some values using `WHERE` and others using `HAVING`. The report shows the number of orders placed by each customer and only includes customers who have placed more than 2 orders.

**Question:**  
1. Why is the `HAVING` clause necessary in this report?
2. What would happen if you mistakenly used a `WHERE` clause to filter customers with more than 2 orders?

---

### 🧩 Case Study 2: Choosing the Right Join

**Scenario:**  
You are asked to build a report listing all customers and any orders they might have placed. Some customers have not yet placed any orders.

**Question:**  
1. Which type of join should you use to include **all** customers, even if they haven’t placed an order?
2. Why would an `INNER JOIN` not work in this case?

---

### 🧩 Case Study 3: GROUP BY Design Pitfall

**Scenario:**  
A junior team member wrote a query to calculate total revenue but grouped the data by both `product_name` and `customer_id`, leading to a bloated and confusing report.

**Question:**  
1. Why might grouping by both `product_name` and `customer_id` not provide the correct total revenue?
2. What key considerations should go into choosing grouping columns?

---

### 🧩 Case Study 4: ORDER BY and Performance

**Scenario:**  
You are reviewing a report that is taking a long time to run. The developer used `ORDER BY` on three different columns, including a text column with thousands of distinct values.

**Question:**  
1. What performance issues does `ORDER BY` introduce in large datasets?
2. What practices can reduce the performance impact of sorting?

---

### 🧩 Case Study 5: Using SELECT *

**Scenario:**  
A developer used `SELECT *` in a production reporting query that pulls data from multiple joined tables.

**Question:**  
1. What are the risks and drawbacks of using `SELECT *` in real-world queries?
2. How could this decision affect performance, maintenance, and clarity?

---

### 🧩 Case Study 6: DISTINCT vs GROUP BY

**Scenario:**  
Your colleague wrote a query using `DISTINCT` to eliminate duplicate records. Another team member suggested using `GROUP BY` instead.

**Question:**  
1. In what situations are `DISTINCT` and `GROUP BY` functionally equivalent?
2. When is one preferable over the other, and why?

---

### 🧩 Case Study 7: Logical Query Processing Order

**Scenario:**  
A developer is confused why they can't use an alias defined in the `SELECT` clause inside the `WHERE` clause.

**Question:**  
1. Explain the logical order in which SQL processes different clauses.
2. Why does this behavior prevent the use of aliases in `WHERE`?

---

### 🧩 Case Study 8: Filtering with NULLs

**Scenario:**  
Your team needs a report listing customers who haven’t placed any orders. Someone tries filtering using `= NULL` and gets no results.

**Question:**  
1. Why doesn’t `= NULL` work as expected?
2. What is the correct approach for checking `NULL` values and why?

---

### 🧩 Case Study 9: Implicit vs Explicit Joins

**Scenario:**  
Two queries return the same result—one uses the traditional comma-separated table list with `WHERE` conditions for joining, while the other uses `INNER JOIN` syntax.

**Question:**  
1. Why is the `JOIN` syntax recommended over the old comma-based joins?
2. What problems can arise from using implicit joins?

---

### 🧩 Case Study 10: Aggregates and NULLs

**Scenario:**  
A student is confused why the `AVG()` function returns a smaller number than expected. You inspect the data and notice several rows with `NULL` values in the target column.

**Question:**  
1. How does `AVG()` treat `NULL` values?
2. How should analysts account for or handle NULLs in aggregate functions?

---
