-- SELECT (reading data)
SELECT * FROM products;
SELECT product_name, unit_price FROM products;

-- WHERE (filtering data)
SELECT * FROM products
WHERE category = 'Electronics';

-- WHERE with comparison operators
SELECT * FROM products
WHERE category = 'Electronics' AND unit_price > 100;

SELECT * FROM products
WHERE category = 'Electronics' OR category = 'Machinery';

-- LIKE / ILIKE (searching data)
SELECT * FROM products
WHERE product_name LIKE '%Sensor%';

-- ORDER BY (sorting data)
SELECT * FROM products
ORDER BY unit_price DESC;

SELECT * FROM products
ORDER BY unit_price DESC
LIMIT 5;

-- UPDATE (updating data)
UPDATE products
SET unit_price = 150
WHERE product_id = 'P001';

-- DELETE (deleting data)
DELETE FROM products
WHERE product_id = 'P999';

-- AGGREGATE FUNCTIONS (summarizing data)
SELECT COUNT(*) FROM products;
SELECT AVG(unit_price) FROM products;
SELECT SUM(quantity_produced) FROM production;
SELECT MIN(unit_price) FROM products;
SELECT MAX(unit_price) FROM products;

-- GROUP BY
SELECT category, COUNT(*)
FROM products
GROUP BY category;

-- HAVING
SELECT category, COUNT(*)
FROM products
GROUP BY category
HAVING COUNT(*) > 5;

--DATA QUALITY CHECKS
SELECT * FROM products WHERE product_name IS NULL;
SELECT * FROM inventory WHERE quantity_available < 0;
