# Manufacturing Inventory & Production Database

## Overview
A relational database system simulating inventory, production, and quality control tracking for a fictional electronics manufacturer (Sample Manufacturing).  Built using PostgreSQL and designed to reflect how real manufacturing companies track products, materials, suppliers, and defects.

## Problem It Solves
Manufacturing companies need to track multiple connected pieces of information — what products they make, what materials go into them, who supplies those materials, who's producing what, and where quality issues (defects) are happening. This project models that relationship using a normalized relational database, making it possible to answer real business questions like "which products have the most defects?" or "which materials are running low?"

## Tech Stack
- PostgreSQL
- pgAdmin 4
- Mockaroo (sample data generation)

## Database Structure
7 connected tables: suppliers, employees, products, materials, inventory, production, and defects — linked through primary and foreign keys.

[INSERT ERD SCREENSHOT HERE]

## Key Features
- Relational schema with primary/foreign key constraints
- Multi-table JOIN queries
- Aggregate functions and GROUP BY reporting
- A saved VIEW (production_report) for reusable reporting
- Data quality checks (e.g. detecting incomplete supplier records)

## Sample Queries

**Which products have the most defects?**
\`\`\`sql
SELECT p.product_name, COUNT(d.defect_id) AS defect_count
FROM defects d
JOIN production pr ON d.production_id = pr.production_id
JOIN products p ON pr.product_id = p.product_id
GROUP BY p.product_name
ORDER BY defect_count DESC;
\`\`\`

[INSERT SCREENSHOT OF RESULT HERE]

**Production summary view**
\`\`\`sql
SELECT * FROM production_report;
\`\`\`

[INSERT SCREENSHOT OF RESULT HERE]

## What I Learned
Through this project, I strengthened my understanding of relational databases, table relationships, and how to write SQL queries for filtering, joining, and summarizing data. I also learned how to troubleshoot real data problems — such as fixing foreign key errors, handling mismatched date formats, and cleaning up data during import — which taught me a lot about how messy real-world data actually is compared to textbook examples.
