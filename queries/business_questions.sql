-- Which materials are running low? (assuming a low-stock threshold of 50)
SELECT * FROM inventory WHERE quantity_available < 50;

-- Which products have the highest production volume?
SELECT p.product_name, SUM(pr.quantity_produced) AS total
FROM production pr
JOIN products p ON pr.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total DESC;

-- Which products have the most defects?
SELECT p.product_name, COUNT(d.defect_id) AS defect_count
FROM defects d
JOIN production pr ON d.production_id = pr.production_id
JOIN products p ON pr.product_id = p.product_id
GROUP BY p.product_name
ORDER BY defect_count DESC;
