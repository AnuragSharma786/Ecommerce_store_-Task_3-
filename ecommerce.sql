select * from customers;
select * from order_items;
select * from orders;
select * from payments;
select * from products;

-- 'Top 10 Customers by Total Spending'
SELECT customer_id, 
       SUM(total_amount_y) AS total_spent
FROM Orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- Monthly Revenue Trend
SELECT monthname(orders.order_date) AS month,
       COUNT(order_id) AS total_orders
FROM Orders
GROUP BY month
ORDER BY month asc;

-- Most Ordered Products
SELECT product_id,
       SUM(quantity) AS total_quantity
FROM order_items
GROUP BY product_id
ORDER BY total_quantity DESC
LIMIT 10;

--  Revenue per Month
select monthname(order_date) as months,
sum(total_amount_y) as total_revenue
from orders
where order_status = 'Shipped'
group by months
order by months asc;

-- Payment Method Usage
select payment_method , count(*) as total_count
from payments
group by payment_method
order by total_count;

-- Pending or Failed Payments
select payment_status, count(*) as total_count
from payments
group by payment_status
order by total_count;

-- Average Order Value by Customer
select customer_id , avg(total_amount_y) as avg_order
from orders
group by customer_id
order by avg_order desc;

-- Top 5 Orders with Highest Total Revenue
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

-- Orders Without Payment Record
SELECT o.order_id
FROM Orders o
LEFT JOIN Payments p ON o.order_id = p.order_id
WHERE p.order_id IS NULL;