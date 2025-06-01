--- 小测试1
SELECT SUM(price * unit) AS total_sales_2024
FROM sale
WHERE time >= '2024-01-01' AND time < '2025-01-01';

SELECT product_id, SUM(unit) AS total_units_sold
FROM sale
GROUP BY product_id
ORDER BY total_units_sold DESC
LIMIT 5;

SELECT
    EXTRACT(MONTH FROM time) AS month,
    SUM(unit) AS total_units_sold
FROM sale
WHERE time >= '2024-01-01' AND time < '2025-01-01'
GROUP BY month
ORDER BY total_units_sold DESC
LIMIT 1;


--- 小测试2
SELECT DISTINCT p.id, p.name
FROM product p
JOIN sale s ON p.id = s.product_id;

SELECT
    p.id,
    p.name,
    COALESCE(SUM(s.unit), 0) AS total_units_sold
FROM product p
LEFT JOIN sale s ON p.id = s.product_id
GROUP BY p.id, p.name
ORDER BY p.id;

SELECT
    p.name,
    COALESCE(SUM(s.price * s.unit), 0) AS total_sales,
    COALESCE(SUM((s.price - p.cost_price) * s.unit), 0) AS total_profit
FROM product p
LEFT JOIN sale s ON p.id = s.product_id
GROUP BY p.id, p.name
ORDER BY p.name;