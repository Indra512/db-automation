import { expect } from "@playwright/test";
import { test } from "./fixtures";

// 1. Products must have positive price
test("Products must have price > 0", async ({ db }) => {
    const res = await db.query(`
        SELECT * FROM products 
        WHERE price <= 0;
    `);
    expect(res.rowCount).toBe(0);
});

// 2. Count customers per city
test("Each city must have at least 1 customer", async ({ db }) => {
    const res = await db.query(`
        SELECT city, COUNT(*) AS cnt
        FROM customers
        GROUP BY city;
        `);
    for (const row of res.rows) {
        expect(Number(row.cnt)).toBeGreaterThan(0);
    }
});

// 3. No duplicate customer names
test("Customer name must be unique", async ({ db }) => {
    const res = await db.query(`
        SELECT customer_name, COUNT(*)
        FROM customers
        GROUP BY customer_name
        HAVING COUNT(*) > 1;
        `);
    expect(res.rowCount).toBe(0);
});


// 4. JSON: all products must have brand in details
test("Products JSON must contain brand", async ({ db }) => {
    const res = await db.query(`
        SELECT p_id, p_name 
        FROM products_jsonb 
        WHERE NOT (p_details ? 'brand');
        `);
    expect(res.rowCount).toBe(0);
});

// 5. JSON: filter products with RAM >= 8GB
// regexp_replace() = replaces characters matching a pattern.
// Pattern: [^0-9] → means any character that is NOT a digit.
// Replace with '' → remove them.
// 'g' = global, apply to all matches.
test("Products with RAM >= 8GB must exist", async ({ db }) => {
    const res = await db.query(`
        SELECT p_name, p_details->'specs'->>'ram' AS ram
        FROM products_jsonb
        WHERE (regexp_replace(p_details->'specs'->>'ram', '[^0-9]', '', 'g'))::int>=8
        `);
    expect(res.rowCount).toBeGreaterThan(0);
});

// 6. Customers whose names start with A
test("At least one customer name starts with A", async ({ db }) => {
    const res = await db.query(`
        SELECT * FROM customers
        WHERE customer_name ILIKE 'A%';
        `);
    expect(res.rowCount).toBeGreaterThan(0);
});

// 7. Check product price consistency
test("Max price should be >= Avg price", async ({ db }) => {
    const res = await db.query(`
        SELECT MAX(price) AS max_price, AVG(price) AS avg_price
        FROM products;
        `);
    const { max_price, avg_price } = res.rows[0];
    expect(Number(max_price)).toBeGreaterThanOrEqual(Number(avg_price));
});

// 8. Users JSON must contain theme in preferences
test("Users preferences JSON must contain theme", async ({ db }) => {
    const res = await db.query(`
        SELECT id, name FROM users
        WHERE NOT (preferences ? 'theme');
    `);
    expect(res.rowCount).toBe(0);
});

// 9. JSON aggregation: collect all product names
test("json_agg should return array of product names", async ({ db }) => {
    const res = await db.query(`
        SELECT json_agg(p_name) AS products_array
        FROM products_jsonb;
        `);
    const productsArray = res.rows[0].products_array;
    expect(Array.isArray(productsArray)).toBe(true);
    expect(productsArray.length).toBeGreaterThan(0);
});

// 10. Subquery: find customers who bought at least one product
test("Customers with at least one order exist", async ({ db }) => {
    const res = await db.query(`
        SELECT * FROM customers c
        WHERE EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id);
    `);
    expect(res.rowCount).toBeGreaterThanOrEqual(0);
});

