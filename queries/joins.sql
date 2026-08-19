-- JOINS (allows to pull information from another table)
SELECT
    p.product_name,
    pr.quantity_produced,
    pr.production_date
FROM products p
INNER JOIN production pr
ON p.product_id = pr.product_id;

SELECT
    p.product_name,
    e.employee_name,
    pr.quantity_produced
FROM production pr
INNER JOIN products p ON pr.product_id = p.product_id
INNER JOIN employees e ON pr.employee_id = e.employee_id;

-- CASE (Conditional Logic) (like an if-else statement)
SELECT
    product_name,
    unit_price,
    CASE
        WHEN unit_price >= 500 THEN 'High'
        WHEN unit_price >= 200 THEN 'Medium'
        ELSE 'Low'
    END AS price_category
FROM products;

-- Subqueries (a query inside another query)
SELECT product_name, unit_price
FROM products
WHERE unit_price > (SELECT AVG(unit_price) FROM products);

-- CTEs (Common Table Expressions) (lets you name a temporary result and reuse it)
WITH production_summary AS (
    SELECT product_id, SUM(quantity_produced) AS total_produced
    FROM production
    GROUP BY product_id
)
SELECT p.product_name, ps.total_produced
FROM production_summary ps
JOIN products p ON ps.product_id = p.product_id;

-- VIEWS (a saved query that behaves like a table)
CREATE VIEW production_report AS
SELECT p.product_name, SUM(pr.quantity_produced) AS total_produced
FROM production pr
JOIN products p ON pr.product_id = p.product_id
GROUP BY p.product_name;

SELECT * FROM production_report;

