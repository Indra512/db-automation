-- CREATE TABLE products_jsonb (
-- 	p_id SERIAL NOT NULL PRIMARY KEY,
-- 	p_name TEXT NOT NULL,
-- 	p_details JSONB
-- );

-- INSERT INTO products_jsonb (p_name, p_details) VALUES
-- ('Laptop', '{"brand": "Dell", "specs": {"ram": "16GB", "cpu": "i7"}, "price": "1200"}'),
-- ('Phone', '{"brand": "Samsung", "specs": {"ram": "8GB", "cpu": "Snapdragon"}, "price": "800"}');

-- SELECT * FROM products_jsonb;

-- SELECT p_details -> 'specs' FROM products_jsonb;

-- SELECT p_details -> 'specs' ->> 'cpu' FROM products_jsonb;

-- SELECT p_details#>>'{specs,ram}' FROM products_jsonb;

-- SELECT * FROM products_jsonb WHERE p_details->>'brand' = 'Dell';

-- SELECT * FROM products_jsonb WHERE (p_details->>'price')::INT > 1000;

-- UPDATE products_jsonb SET p_details = jsonb_set(p_details, '{warranty}', '"2 years"') WHERE p_name = 'Laptop';

-- UPDATE products_jsonb SET p_details = jsonb_set(p_details, '{specs,ram}', '"32GB"') WHERE p_name = 'Laptop';

-- SELECT p_name FROM products_jsonb WHERE p_details ? 'brand';

-- SELECT p_name FROM products_jsonb WHERE p_details ?& array['brand', 'price'];

-- SELECT jsonb_object_keys(p_details) FROM products_jsonb;

-- SELECT jsonb_pretty(p_details) FROM products_jsonb;

-- CREATE INDEX idx_products_details ON products_jsonb USING gin(p_details);

-- Now queries like these are fast:
-- SELECT * FROM products_jsonb WHERE p_details->>'brand' = 'Dell';

-- Group data as JSON
-- SELECT json_agg(p_name) AS all_products FROM products_jsonb;

-- Build JSON object
-- SELECT json_build_object('brand', p_details->>'brand', 'price', p_details->>'price')
-- FROM products_jsonb;




