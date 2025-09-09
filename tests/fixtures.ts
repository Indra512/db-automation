import { test as base } from "@playwright/test";
import { Client } from "pg";

export const test = base.extend<{
    db: Client;
}>({
    db: [
        async ({ }, use) => {
            const client = new Client({
                user: "postgres",
                host: "localhost",
                database: "postgres",
                password: "1234567890",
                port: 5432
            });

            await client.connect();

            // Make db available to tests
            await use(client);

            // Cleanup after test
            await client.end();

        },
        { scope: "worker" }
    ],
});