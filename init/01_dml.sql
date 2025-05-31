-- Временная таблица чтоб считать csv
CREATE TABLE IF NOT EXISTS tmp_table (
    id INT,
    customer_first_name TEXT,
    customer_last_name TEXT,
    customer_age INT,
    customer_email TEXT,
    customer_country TEXT,
    customer_postal_code TEXT,
    customer_pet_type TEXT,
    customer_pet_name TEXT,
    customer_pet_breed TEXT,
    seller_first_name TEXT,
    seller_last_name TEXT,
    seller_email TEXT,
    seller_country TEXT,
    seller_postal_code TEXT,
    product_name TEXT,
    product_category TEXT,
    product_price NUMERIC,
    product_quantity INT,
    sale_date DATE,
    sale_customer_id INT,
    sale_seller_id INT,
    sale_product_id INT,
    sale_quantity INT,
    sale_total_price NUMERIC,
    store_name TEXT,
    store_location TEXT,
    store_city TEXT,
    store_state TEXT,
    store_country TEXT,
    store_phone TEXT,
    store_email TEXT,
    pet_category TEXT,
    product_weight NUMERIC,
    product_color TEXT,
    product_size TEXT,
    product_brand TEXT,
    product_material TEXT,
    product_description TEXT,
    product_rating NUMERIC,
    product_reviews INT,
    product_release_date DATE,
    product_expiry_date DATE,
    supplier_name TEXT,
    supplier_contact TEXT,
    supplier_email TEXT,
    supplier_phone TEXT,
    supplier_address TEXT,
    supplier_city TEXT,
    supplier_country TEXT
);

-- Основная таблица из которой делаются таблицы снежинки
CREATE TABLE main_table (
    id SERIAL PRIMARY KEY, 
    customer_first_name TEXT,
    customer_last_name TEXT,
    customer_age INT,
    customer_email TEXT,
    customer_country TEXT,
    customer_postal_code TEXT,
    customer_pet_type TEXT,
    customer_pet_name TEXT,
    customer_pet_breed TEXT,
    seller_first_name TEXT,
    seller_last_name TEXT,
    seller_email TEXT,
    seller_country TEXT,
    seller_postal_code TEXT,
    product_name TEXT,
    product_category TEXT,
    product_price NUMERIC,
    product_quantity INT,
    sale_date DATE,
    sale_customer_id INT GENERATED ALWAYS AS IDENTITY UNIQUE,
    sale_seller_id INT GENERATED ALWAYS AS IDENTITY UNIQUE,
    sale_product_id INT GENERATED ALWAYS AS IDENTITY UNIQUE,
    sale_quantity INT,
    sale_total_price NUMERIC,
    store_name TEXT,
    store_location TEXT,
    store_city TEXT,
    store_state TEXT,
    store_country TEXT,
    store_phone TEXT,
    store_email TEXT,
    pet_category TEXT,
    product_weight NUMERIC,
    product_color TEXT,
    product_size TEXT,
    product_brand TEXT,
    product_material TEXT,
    product_description TEXT,
    product_rating NUMERIC,
    product_reviews INT,
    product_release_date DATE,
    product_expiry_date DATE,
    supplier_name TEXT,
    supplier_contact TEXT,
    supplier_email TEXT,
    supplier_phone TEXT,
    supplier_address TEXT,
    supplier_city TEXT,
    supplier_country TEXT
);

COPY tmp_table
(id, customer_first_name, customer_last_name, customer_age, customer_email, customer_country, customer_postal_code,
customer_pet_type, customer_pet_name, customer_pet_breed,
seller_first_name, seller_last_name, seller_email, seller_country, seller_postal_code,
product_name, product_category, product_price, product_quantity,
sale_date, sale_customer_id, sale_seller_id, sale_product_id, sale_quantity, sale_total_price,
store_name, store_location, store_city, store_state, store_country, store_phone, store_email,
pet_category, product_weight, product_color, product_size, product_brand, product_material,
product_description, product_rating, product_reviews,
product_release_date, product_expiry_date,
supplier_name, supplier_contact, supplier_email, supplier_phone, supplier_address, supplier_city, supplier_country)
FROM '/data/MOCK_DATA1.csv' WITH CSV HEADER DELIMITER ',' NULL '' ESCAPE '"';

COPY tmp_table FROM '/data/MOCK_DATA2.csv' WITH CSV HEADER;
COPY tmp_table FROM '/data/MOCK_DATA3.csv' WITH CSV HEADER;
COPY tmp_table FROM '/data/MOCK_DATA4.csv' WITH CSV HEADER;
COPY tmp_table FROM '/data/MOCK_DATA5.csv' WITH CSV HEADER;
COPY tmp_table FROM '/data/MOCK_DATA6.csv' WITH CSV HEADER;

COPY tmp_table FROM '/data/MOCK_DATA7.csv' WITH CSV HEADER;
COPY tmp_table FROM '/data/MOCK_DATA8.csv' WITH CSV HEADER;
COPY tmp_table FROM '/data/MOCK_DATA9.csv' WITH CSV HEADER;
COPY tmp_table FROM '/data/MOCK_DATA.csv' WITH CSV HEADER;


INSERT INTO main_table (
    customer_first_name, customer_last_name, customer_age, customer_email, customer_country, customer_postal_code,
    customer_pet_type, customer_pet_name, customer_pet_breed,
    seller_first_name, seller_last_name, seller_email, seller_country, seller_postal_code,
    product_name, product_category, product_price, product_quantity,
    sale_date, sale_quantity, sale_total_price,
    store_name, store_location, store_city, store_state, store_country, store_phone, store_email,
    pet_category, product_weight, product_color, product_size, product_brand, product_material,
    product_description, product_rating, product_reviews,
    product_release_date, product_expiry_date,
    supplier_name, supplier_contact, supplier_email, supplier_phone, supplier_address, supplier_city, supplier_country
)
SELECT
    customer_first_name, customer_last_name, customer_age, customer_email, customer_country, customer_postal_code,
    customer_pet_type, customer_pet_name, customer_pet_breed,
    seller_first_name, seller_last_name, seller_email, seller_country, seller_postal_code,
    product_name, product_category, product_price, product_quantity,
    sale_date, sale_quantity, sale_total_price,
    store_name, store_location, store_city, store_state, store_country, store_phone, store_email,
    pet_category, product_weight, product_color, product_size, product_brand, product_material,
    product_description, product_rating, product_reviews,
    product_release_date, product_expiry_date,
    supplier_name, supplier_contact, supplier_email, supplier_phone, supplier_address, supplier_city, supplier_country
FROM tmp_table;

DROP TABLE tmp_table; 
