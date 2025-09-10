import { expect } from "@playwright/test";
import { test } from "./fixtures";


test("Verify customers exist", async ({ db }) => {
    const res = await db.query("SELECT COUNT(*) FROM customers;");
    expect(Number(res.rows[0].count)).toBeGreaterThan(0);
});

test("Verify products have price >= 0", async ({ db }) => {
    const res = await db.query("SELECT price FROM products;");
    for (const row of res.rows) {
        expect(Number(row.price)).toBeGreaterThan(0);
    }
});

test("Check all products have a brand", async ({ db }) => {
    const res = await db.query("SELECT p_details->>'brand' as brand FROM products_jsonb;");
    for (const row of res.rows) {
        expect(row.brand).toBeTruthy();
    }
});