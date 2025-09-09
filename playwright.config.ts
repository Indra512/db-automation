import { defineConfig } from "@playwright/test";

export default defineConfig({
  testDir: "./tests",          // Folder for tests
  timeout: 30 * 1000,          // 30 sec per test
  retries: 1,                  // Retry failed tests once
  use: {
    headless: true,            // Run in headless mode
    viewport: { width: 1280, height: 720 },
    ignoreHTTPSErrors: true
  },
  reporter: [["list"], ["html", { outputFolder: "playwright-report" }]]
});
