# 🚀 Global Startup Success Analyzer using SQL

A powerful end-to-end SQL project that analyzes global startup data to uncover key success metrics, industry trends, funding behavior, and IPO prediction — built using **pure SQL in MySQL Workbench**.

---

## 📌 Project Overview

This project focuses on analyzing startup success metrics based on funding, valuation, employee size, social reach, and more.

- 📊 Country & industry-wise startup distribution
- 💰 Funding trends across different stages
- 🧠 Success Score rankings by industry
- 📈 Predictive IPO candidate detection using conditional logic
- 🏆 Top startup identification using window functions

---

## 🛠 Tools Used

| Tool | Purpose |
|------|---------|
| **MySQL Workbench** | Query writing & execution |
| **SQL** | Data analysis (basic to advanced) |
| **Excel / Power BI (Optional)** | For dashboard visualizations |
| **GitHub** | Version control & portfolio showcase |

---

## 🗃️ Dataset Columns

| Column Name | Description |
|-------------|-------------|
| Startup_Name | Name of the startup |
| Founded_Year | Year it was founded |
| Country | Country of origin |
| Industry | Sector the startup belongs to |
| Funding_Stage | Seed, Series A/B/C, IPO |
| Total_Funding | Total capital raised |
| Number_of_Employees | Employee strength |
| Annual_Revenue | Yearly revenue |
| Valuation | Estimated market valuation |
| Success_Score | Custom scoring metric |
| Acquired / IPO | Yes/No flags |
| Customer_Base | Estimated users |
| Tech_Stack | Tech used |
| Social_Media_Followers | Online popularity metric |

---

## 📄 SQL Features Covered

### 🔰 Basic to Intermediate
✅ Basic SELECT, WHERE, LIMIT  
✅ Aggregate Functions: `COUNT`, `SUM`, `AVG`, `ROUND`  
✅ Sorting & Grouping: `GROUP BY`, `ORDER BY`  
✅ Filtering with `WHERE`, `HAVING`, and `IS NOT NULL`  
✅ Aliases for readable outputs

### ⚙️ Joins & Subqueries
✅ Correlated Subqueries (e.g., avg funding per country)  
✅ Scalar Subqueries in WHERE clause  
✅ Filtering using subqueries with comparison

### 📊 Advanced Analytics
✅ Window Functions: `RANK() OVER(PARTITION BY...)`  
✅ Common Table Expressions (CTE) using `WITH`  
✅ Conditional Logic using `CASE WHEN THEN`  
✅ Data Labeling (IPO Candidate Prediction Logic)  
✅ Categorization (Funding Stage Mapping)

### 🔁 Data Transformation & Pivoting
✅ Data Pivoting using `SUM(CASE WHEN...)` pattern  
✅ Ranking top startups per industry  
✅ Country-wise stage distribution  
✅ Funding stage to numerical level conversion

### 📁 Database Design
✅ Schema Creation (`CREATE SCHEMA startup`)  
✅ Table Design with 15+ columns including:
  - Business Metrics: funding, revenue, valuation  
  - Performance Metrics: success score, social followers  
  - Boolean flags: Acquired / IPO  
  - Categorical Dimensions: industry, country, tech stack

### 📌 Project Structure Features
✅ Fully executable `.sql` file  
✅ Structured and commented sections  
✅ Output-ready query blocks  
✅ Exportable for Excel or BI dashboards  
✅ Ready for GitHub, resume, LinkedIn

---

## 🔍 Key Sample Queries

### 1. 📍 Total Startups

```sql
SELECT COUNT(*) AS total_startups FROM global_startup;
