-- SELECT customer_name, country FROM customers; 

-- SELECT * FROM customers; 

-- SELECT DISTINCT country FROM customers; 

-- SELECT COUNT(DISTINCT country) FROM customers; 

-- SELECT * FROM customers WHERE city = 'London';

-- SELECT * FROM customers WHERE customer_id = 19;

-- SELECT * FROM customers WHERE customer_id > 80;

-- SELECT * FROM products ORDER BY price;

-- SELECT * FROM products ORDER BY price DESC;

-- SELECT * FROM customers LIMIT 20;

-- SELECT * FROM customers LIMIT 20 OFFSET 40;

-- SELECT MIN(price) FROM products;

-- SELECT MAX(price) FROM products;

-- SELECT MIN(price) AS lowest_price FROM products;

-- SELECT MAX(price) AS highest_price FROM products;

-- SELECT COUNT(customer_id) FROM customers;

-- SELECT COUNT(customer_id) FROM customers WHERE city = 'London';

-- SELECT SUM(quantity) FROM order_details;

-- SELECT AVG(price) FROM products;

-- SELECT AVG(price)::NUMERIC(10, 2) FROM products;

-- SELECT * FROM customers WHERE customer_name LIKE 'A%';

-- SELECT * FROM customers WHERE customer_name LIKE '%A%';

-- SELECT * FROM customers WHERE customer_name ILIKE 'a%';

-- SELECT * FROM customers WHERE customer_name LIKE '%en';

-- SELECT * FROM customers WHERE city LIKE 'L_nd__';

-- SELECT * FROM customers WHERE country IN('Germany', 'UK', 'France');

-- SELECT * FROM customers WHERE country NOT IN('Germany', 'UK', 'France');

-- SELECT * FROM customers WHERE customer_id IN (SELECT customer_id FROM orders);

-- SELECT * FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM orders);

-- SELECT * FROM products WHERE price BETWEEN 10 AND 15;

-- SELECT * FROM products WHERE product_name BETWEEN 'Pavlova' AND 'Tofu' ORDER BY product_name; 

-- SELECT * FROM orders WHERE order_date BETWEEN '2023-04-12' AND '2023-05-05'; 

-- SELECT customer_id AS id FROM customers;

-- SELECT product_name || unit AS product FROM products;

-- SELECT product_name || ' ' || unit AS product FROM products;

-- SELECT product_name AS "My Great Products" FROM products; 

-- SELECT testproduct_id, product_name, category_name FROM testproducts INNER JOIN categories ON testproducts.category_id = categories.category_id;

-- SELECT testproduct_id, product_name, category_name FROM testproducts LEFT JOIN categories ON testproducts.category_id = categories.category_id;

-- SELECT testproduct_id, product_name, category_name FROM testproducts RIGHT JOIN categories ON testproducts.category_id = categories.category_id;

-- SELECT testproduct_id, product_name, category_name FROM testproducts FULL JOIN categories ON testproducts.category_id = categories.category_id;

-- SELECT testproduct_id, product_name, category_name FROM testproducts CROSS JOIN categories;

-- SELECT product_id, product_name FROM products UNION SELECT testproduct_id, product_name FROM testproducts ORDER BY product_id;

-- SELECT product_id, product_name FROM products UNION ALL SELECT testproduct_id, product_name FROM testproducts ORDER BY product_id;

-- SELECT COUNT(customer_id), country FROM customers GROUP BY country;

-- SELECT customers.customer_name, COUNT(orders.order_id) FROM orders LEFT JOIN customers ON orders.customer_id = customers.customer_id GROUP BY customer_name;

-- SELECT COUNT(customer_id), country FROM customers GROUP BY country HAVING COUNT(customer_id) > 5;

-- SELECT order_details.order_id, SUM(products.price) FROM order_details LEFT JOIN products ON order_details.product_id = products.product_id GROUP BY order_id HAVING SUM(products.price) > 400.00;

-- SELECT customers.customer_name, SUM(products.price) FROM order_details LEFT JOIN products ON order_details.product_id = products.product_id LEFT JOIN orders ON order_details.order_id = orders.order_id LEFT JOIN customers ON orders.customer_id = customers.customer_id GROUP BY customer_name HAVING SUM(products.price) > 1000.00;

-- SELECT customers.customer_name FROM customers WHERE EXISTS(SELECT order_id FROM orders WHERE customer_id = customers.customer_id);

-- SELECT customers.customer_name FROM customers WHERE NOT EXISTS(SELECT order_id FROM orders WHERE customer_id = customers.customer_id);

-- SELECT product_name FROM products WHERE product_id = ANY (SELECT product_id FROM order_details WHERE quantity > 120);

-- SELECT product_name FROM products WHERE product_id = ALL (SELECT product_id FROM order_details WHERE quantity > 10);

-- SELECT product_name, CASE WHEN price < 10 THEN 'Low price product' WHEN price > 50 THEN 'High price product' ELSE 'Normal product' END AS "price category" FROM products;

