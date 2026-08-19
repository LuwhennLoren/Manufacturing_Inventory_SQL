CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(20),
    address VARCHAR(200)
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    date_hired DATE
);

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

CREATE TABLE materials (
    material_id SERIAL PRIMARY KEY,
    material_name VARCHAR(100) NOT NULL,
    supplier_id INTEGER REFERENCES suppliers(supplier_id),
    unit_cost DECIMAL(10,2)
);

CREATE TABLE inventory (
    inventory_id SERIAL PRIMARY KEY,
    product_id VARCHAR(10) REFERENCES products(product_id),
    quantity_available INTEGER,
    last_updated DATE
);

CREATE TABLE production (
    production_id SERIAL PRIMARY KEY,
    product_id VARCHAR(10) REFERENCES products(product_id),
    employee_id INTEGER REFERENCES employees(employee_id),
    quantity_produced INTEGER,
    production_date DATE
);

CREATE TABLE defects (
    defect_id SERIAL PRIMARY KEY,
    production_id INTEGER REFERENCES production(production_id),
    defect_description VARCHAR(200),
    defect_date DATE
);
