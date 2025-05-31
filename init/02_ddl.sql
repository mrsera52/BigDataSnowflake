--клиенты
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INT,
    email TEXT UNIQUE,
    country TEXT,
    postal_code TEXT,
    pet_type TEXT,
    pet_name TEXT,
    pet_breed TEXT
);

--продавцы
CREATE TABLE sellers (
    seller_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT UNIQUE,
    country TEXT,
    postal_code TEXT
);

-- товары
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name TEXT,
    category TEXT,
    price NUMERIC,
    weight NUMERIC,
    color TEXT,
    size TEXT,
    brand TEXT,
    material TEXT,
    description TEXT,
    rating NUMERIC,
    reviews INT,
    release_date DATE,
    expiry_date DATE
);

--магазины
CREATE TABLE stores (
    store_id SERIAL PRIMARY KEY,
    name TEXT,
    location TEXT,
    city TEXT,
    state TEXT,
    country TEXT,
    phone TEXT,
    email TEXT
);

--поставщикы
CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    name TEXT,
    contact TEXT,
    email TEXT,
    phone TEXT,
    address TEXT,
    city TEXT,
    country TEXT
);

-- таблица продаж - центр снежинки
CREATE TABLE fact_sales (
    sale_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    seller_id INT REFERENCES sellers(seller_id),
    product_id INT REFERENCES products(product_id),
    store_id INT REFERENCES stores(store_id),
    supplier_id INT REFERENCES suppliers(supplier_id),
    sale_date DATE,
    quantity INT,
    total_price NUMERIC
);
