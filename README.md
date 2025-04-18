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
<img width="228" alt="image" src="https://github.com/user-attachments/assets/0cb3a54d-6a49-48ae-b2a2-96245ad39279" />


- Total **Profit** by Category
<img width="238" alt="image" src="https://github.com/user-attachments/assets/bb210b85-4bf1-4578-b237-91db6760c398" />


- Top **Revenue Generating Products**
<img width="350" alt="image" src="https://github.com/user-attachments/assets/18f48859-6a26-41f7-94b5-057d8418c02c" />


### 🔹 Time-Based Trends
- **Monthly & Quarterly Sales Trends**
- Best/worse Performing **Months & Quarters**
<img width="272" alt="image" src="https://github.com/user-attachments/assets/efdd9884-f5b4-48ea-a2df-0cb850501877" />

<img width="255" alt="image" src="https://github.com/user-attachments/assets/a60a3887-48e9-4603-a718-2340bb1dc3e2" />


- **Average Order Value** over time
<img width="182" alt="image" src="https://github.com/user-attachments/assets/0ae206ba-f40c-4ddd-bb1b-d37097c3f158" />


### 🔹 Customer & Segment Analysis
- Top **Customers by Revenue**
<img width="311" alt="image" src="https://github.com/user-attachments/assets/4dadfe04-ecf0-41bd-a10c-39037d7f4c85" />

- **Customer Average Purchase Frequency**
<img width="254" alt="image" src="https://github.com/user-attachments/assets/8cd76e3a-b3ed-453b-86cd-285e80494f47" />

- Segment that **spend the most**
<img width="200" alt="image" src="https://github.com/user-attachments/assets/62562594-9faf-465f-9e2a-91fada40f9ba" />


### 🔹 Regional Insights
- Top Performing **Regions and Cities**
<img width="208" alt="image" src="https://github.com/user-attachments/assets/904dc7ed-a972-44cb-a935-08e5ef0d3416" />
<img width="242" alt="image" src="https://github.com/user-attachments/assets/061baf1b-0f10-451f-b119-7903b85d3703" />


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


