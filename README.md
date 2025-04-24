🛒 eCommerce Sales Analysis Project
Welcome to my eCommerce SQL Analytics Project!
This project focuses on exploring, cleaning, and analyzing an eCommerce dataset using MySQL to derive valuable business insights through structured queries, joins, and CTEs (Common Table Expressions).

📁 Dataset Overview
This project uses the following CSV files:

Customers.csv – Customer details (ID, name, email, etc.)

Orders.csv – Each order placed by a customer.

Order_Items.csv – Items within each order (product ID, quantity, price).

Payments.csv – Payment records linked to orders.

products.csv - Products recordes.

These datasets simulate an eCommerce store's backend system.

🎯 Objectives
The main goals of this project were:

🔍 Understand data structure and relationships between tables.

🧹 Identify missing or unmatched records (e.g., orders without payments).

📊 Extract business insights using SQL queries and CTEs.

📈 Generate KPIs and trends for reporting and decision-making.

🧠 Key Analytical Tasks Performed
Here are the major things I implemented using SQL:

✅ 1. Top 10 Customers by Total SpendingSELECT customer_id, 
       SUM(total_amount_y) AS total_spent
FROM Orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

✅ 2. Monthly Order Trend

SELECT DATE_FORMAT(STR_TO_DATE(order_date, '%m/%d/%Y'), '%Y-%m') AS month,
       COUNT(order_id) AS total_orders
FROM Orders
GROUP BY month
ORDER BY month;

✅ 4. Most Ordered Products

SELECT product_id,
       SUM(quantity) AS total_quantity
FROM order_items
GROUP BY product_id
ORDER BY total_quantity DESC
LIMIT 10;

✅ 5. Revenue per Month

SELECT DATE_FORMAT(STR_TO_DATE(order_date, '%m/%d/%Y'), '%Y-%m') AS month,
       SUM(total_amount_y) AS total_revenue
FROM Orders
WHERE order_status = 'Shipped'
GROUP BY month
ORDER BY month;

✅ 6. Payment Method Usage

SELECT payment_method,
       COUNT(*) AS total_count
FROM Payments
GROUP BY payment_method
ORDER BY total_count DESC;

✅ 7. Pending or Failed Payments

SELECT *
FROM Payments
WHERE payment_status IN ('Pending', 'Failed');

✅ 8. Average Order Value by Customer
SELECT customer_id,
       AVG(total_amount_y) AS avg_order_value
FROM Orders
GROUP BY customer_id
ORDER BY avg_order_value DESC;

✅ 10. CTE: Top 5 Orders with Highest Total Revenue
WITH top_orders AS (
    SELECT order_id,
           SUM(quantity * price_per_unit) AS total_revenue
    FROM order_items
    GROUP BY order_id
)
SELECT * 
FROM top_orders
ORDER BY total_revenue DESC
LIMIT 5;

✅ 11. Orders Without Payment Record
SELECT o.order_id
FROM Orders o
LEFT JOIN Payments p ON o.order_id = p.order_id
WHERE p.order_id IS NULL;

📂 Tools Used
MySQL Workbench – For querying and analysis

Excel/CSV Files – For loading and preparing the dataset

GitHub – For version control and sharing this project

Power BI (optional) – For data visualization

🚀 What I Learned
Writing complex SQL queries using joins and CTEs

Detecting data quality issues (missing or unmatched records)

Summarizing large datasets for meaningful KPIs

Thinking from a business analyst’s perspective

📌 Future Improvements
Integrate product and inventory datasets.

Build a Power BI dashboard to visualize insights.

Add stored procedures and triggers for automation.

Perform cohort analysis or customer retention tracking.

🙌 Let's Connect
If you're interested in collaborating or have any feedback, feel free to reach out!
