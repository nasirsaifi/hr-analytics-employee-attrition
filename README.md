# 📊 HR Analytics – Employee Attrition & Performance

> **Excel + PostgreSQL + Power BI project analyzing employee attrition, workforce trends, salary, satisfaction and performance to identify high-risk employee groups and support better HR decisions.**

---

## 📌 Project Overview

Employee attrition can affect workforce stability, productivity and business performance.

This project analyzes HR data to answer a key business question:

### **Why is employee attrition happening, and which employee groups are at higher risk?**

The analysis uses **Excel, PostgreSQL and Power BI** to identify patterns related to overtime, job satisfaction, work-life balance, tenure, salary, performance, departments and job roles.

---

## 🎯 Business Problems

The organization wants to understand:

- What is the overall employee attrition rate?
- Which departments and job roles have higher attrition?
- Is overtime associated with higher attrition?
- Does job satisfaction relate to employee attrition?
- Which tenure groups show higher attrition?
- How does attrition vary across salary bands?
- Which employee segments require more attention from HR?

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| **Excel** | Data preparation and analysis |
| **PostgreSQL** | SQL analysis and business questions |
| **Power BI** | Interactive dashboard and visualization |
| **GitHub** | Project documentation |

---

## 🔄 Project Workflow

```text
HR Dataset
    ↓
Data Preparation
    ↓
Excel Analysis
    ↓
PostgreSQL Analysis
    ↓
Power BI Dashboard
    ↓
Insights
    ↓
HR Recommendations
```

---

# 📊 Power BI Dashboard

![HR Analytics Dashboard](Dashboard/HR_Analytics_Dashboard.png)

### Dashboard KPIs

- **Total Employees:** 1.5K
- **Attritions:** 312
- **Attrition Rate:** 20.8%
- **Average Salary:** 817K
- **Average Tenure:** 3.7 Years

---

# 🔎 Key Findings

Based on the dashboard analysis:

- **20.8% overall attrition** was observed.
- Employees working **overtime show higher attrition**.
- **Low job satisfaction** is associated with higher attrition.
- Employees with **0–2 years of tenure** represent a higher-risk group.
- **Low work-life balance** is associated with higher attrition.
- Some **job roles and departments** show higher attrition than others.
- Attrition patterns also vary across **salary bands and performance ratings**.

> These are patterns observed in the dataset and should not be treated as proof of direct causation.

---

# 💡 Business Decisions

Based on these findings, HR can:

1. **Review overtime and workload** in high-attrition groups.
2. Create targeted **retention programs for early-tenure employees**.
3. Improve **job satisfaction and work-life balance** initiatives.
4. Investigate departments and job roles with consistently high attrition.
5. Review compensation and employee benefits for higher-risk groups.
6. Monitor attrition regularly through the Power BI dashboard.

---

# 🗄️ SQL Analysis

PostgreSQL was used to answer **15 HR business questions**.

### SQL Concepts Used

- Aggregate Functions
- `GROUP BY`
- `HAVING`
- `CASE WHEN`
- Subqueries
- CTEs
- Window Functions
- `RANK()`
- Conditional Aggregation

### Examples

- Employee count by department
- Average salary by department
- Attrition count and rate
- Overtime vs attrition
- High-attrition job roles
- Department attrition comparison
- Salary ranking within departments
- Departments above company attrition rate
- Departments with high attrition and low satisfaction

---

# 📁 Project Structure

```text
HR_Attrition/
│
├── Excel/
│   └── HR_Analytics.xlsx
│
├── SQL/
│   └── HR_Analyics_Employee_Attrition_SQL.sql
│
├── PowerBI/
│   └── HR_Analytics_Employee_Attrition.pbix
│
├── Dashboard/
│   └── HR_Analytics_Dashboard.png
│
└── README.md
```

---

# 🚀 Project Outcome

This project demonstrates an end-to-end **Data Analyst workflow**:

**Data Preparation → SQL Analysis → Power BI Dashboard → Business Insights → HR Decisions**

The project converts raw employee data into actionable insights for understanding **employee attrition and workforce performance**.

---

## 👨‍💻 Author

**Nasir Saifi**

**Aspiring Data Analyst**

`Excel` `SQL` `PostgreSQL` `Power BI` `Data Analytics`
