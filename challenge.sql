--Task 1
SELECT c.first_name, c.last_name, SUM(oi.quantity * oi.unit_price) AS total_price
FROM customers AS c
JOIN orders AS o ON c.id = o.customer_id
JOIN order_items AS oi ON o.id = oi.order_id
GROUP BY c.first_name, c.last_name
ORDER BY SUM(oi.quantity * oi.unit_price) DESC
LIMIT 5;
--Task 2
SELECT category, SUM(oi.quantity * oi.unit_price) AS total_revenue 
FROM order_items AS oi
JOIN products AS p ON oi.product_id = p.id
GROUP BY category
ORDER BY SUM(oi.quantity * oi.unit_price) DESC;
