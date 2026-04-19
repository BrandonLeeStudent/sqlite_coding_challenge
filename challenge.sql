--Used SQLTOOLS 
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
--task 3
SELECT e.first_name, e.last_name, dept_avg.department_name, dept_avg.average_salary, e.salary
FROM employees as e
JOIN(
SELECT d.name AS department_name, d.id AS department_id, AVG(e.salary) AS average_salary
FROM employees AS e
JOIN departments AS d ON e.department_id = d.id
GROUP BY d.name, d.id) AS dept_avg ON e.department_id = dept_avg.department_id
WHERE e.salary > dept_avg.average_salary
ORDER BY dept_avg.department_name, e.salary DESC;
--task 4
SELECT count(c.id) AS total_customers, c.city
FROM customers AS c
WHERE loyalty_level = 'Gold' 
GROUP BY c.city
ORDER BY total_customers DESC, c.city DESC;
