# 📊 Superstore Sales Analysis (Microsoft SQL Project)

**📁 Project Type**: Portfolio  
**📌 Tools Used**: Microsoft SQL Server  
**📅 Timeline**: 2014–2017

---

## 📌 Overview
This project is a complete **sales analysis** using Microsoft SQL on the popular **Superstore dataset**. It demonstrates SQL techniques such as:

- Data Cleaning (handling duplicates and nulls)
- Exploratory Data Analysis (EDA)
- Profit/Loss Segmentation
- Customer Behavior
- Regional and Product Performance
- Time-based Sales Trends (monthly and quarterly)

---

## 🧹 Step 1: Data Cleaning

- ✅ Removed **duplicate orders** based on `OrderID` and `ProductID` using `ROW_NUMBER()`.
- ✅ Filled **missing profit values** with the **average profit**.
- ✅ Identified **negative profit entries** as losses.

---

## 📊 Step 2: Exploratory Data Analysis (EDA)

### 🔹 Category-Level Insights
- Total sales by product **Category**
- Total **Profit** by Category
- Top **Revenue Generating Products**

### 🔹 Time-Based Trends
- **Monthly & Quarterly Sales Trends**
- Best/Worst Performing **Months & Quarters**
- **Average Order Value** over time

### 🔹 Customer & Segment Analysis
- Top **Customers by Revenue**
- **Customer Purchase Frequency**
- Segments that **spend the most**

### 🔹 Regional Insights
- Top Performing **Regions and Cities**
- Highest Revenue from **specific locations**

---

## 📈 Key Metrics

| Metric                   | Value          |
|--------------------------|----------------|
| ✅ Total Profit           | $442,187       |
| ❌ Total Loss             | $155,699       |
| 📊 Net Profit             | $286,488       |
| 🛒 Average Order Value    | ~ $458         |
| 🌍 Top Region             | West           |
| 👤 Top Customer           | Sean Miller         |
| ↻ Avg Purchase Frequency | 6        |
| 🗖️ Top Quarter            | Q4             |

---

## 🔍 Sample SQL Queries

```sql
-- Net Profit Calculation
SELECT SUM(Profit) AS NetProfit
FROM OrderDetails;

-- Quarterly Sales
SELECT
    DATEPART(QUARTER, OrderDate) AS SalesQuarter,
    SUM(Sales) AS TotalQuarterlySales
FROM OrderDetails
GROUP BY DATEPART(QUARTER, OrderDate)
ORDER BY SalesQuarter DESC;
```

---

## 💡 Insights

- **Q4** saw the highest sales, suggesting a year-end peak in customer purchasing while **Q1** recorded lowest sales.
- Most profits are generated from **Technology** and **Office Supplies**.
- Best sales performance month is **November** while Worse month is **February**.
- Most sales are generated from **Technology Category** and **Furniture Category**.
- **Canon imageCLASS 2200 Advanced Copier** and **Fellowes PB500 Electric Punch Plastic Comb Binding Machine with Manual Bind** are products that generated most revenue.
- **West Region**, **New York City** and **Consumer Segment** dominate revenue.
- Negative profit entries may indicate discounts or unprofitable product lines.


