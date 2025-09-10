# 🤖 PostgreSQL Database Automation with Playwright + TypeScript

## 📌 Project Overview  
This repository demonstrates how to automate **database validation using PostgreSQL** with **Playwright + TypeScript**.  
The focus is on practicing SQL queries, validating data integrity, testing JSON/JSONB fields, and automating checks locally.  

---

## 🚀 Features  
- PostgreSQL client integration with TypeScript.  
- Playwright fixtures for reusable DB connections.  
- Automated tests for:  
  - Data integrity (uniqueness, constraints).  
  - JSON/JSONB validation.  
  - Aggregates and ranking.  
  - Business rules.  
- Playwright HTML reports for test results.  

---

## 📂 Project Structure   
- **tests/** → Playwright test files (fixtures, basic, advanced).  
- **tsconfig.json** → TypeScript configuration.  
- **playwright.config.ts** → Playwright configuration.  

---

## 🛠️ Setup Instructions  
1. Clone the repository.  
2. Install dependencies.  
3. Configure PostgreSQL connection in the project.  
4. Run SQL scripts if needed (schema + sample data).  
5. Run Playwright tests.  
6. View test results in the Playwright HTML report.  

---

## 🧪 Test Coverage  
- **Basic tests**  
  - Validate product price > 0.  
  - Ensure unique customer names.  
  - Validate JSON keys in product details.  
- **Advanced tests**  
  - Top customers by order value.  
  - Orders with at least one item.  
  - Unique emails validation.  
  - JSON required fields.  
  - Orders respect credit limits.  
  - Category sales ranking.  
  - Revenue reconciliation.  

---

## 📊 Optimization Practice  
Explored query performance with:  
- `EXPLAIN ANALYZE` for execution plans.  
- Indexing strategies (`btree`, `GIN`).  
- Comparing JOIN vs subquery performance.  
- Optimizing JSON queries with GIN indexes.  

---

## 📘 Documentation  
- SQL POC Document (with explanations).  
- Cheat Sheet (syntax quick reference).  
- Mock Test (Q&A with answers).  
- Test Results Template.  
- Executive Summary.  

---

## 🎯 Conclusion  
This POC demonstrates:  
- PostgreSQL test automation from scratch.  
- Real-world query validation using Playwright + TypeScript.  
- JSON/JSONB handling with automation.  
- Performance insights using `EXPLAIN ANALYZE`.  

📌 Outcome: A **complete PostgreSQL automation POC** that runs locally with Playwright.  
