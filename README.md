# 🛒 FreshMart Stock Health Report (SQL Project)

## 📌 Project Overview

This project focuses on building a **Stock Health Reporting System** for a retail supermarket chain, *FreshMart*.
It addresses common inventory challenges such as overstocking, unsold products, and unclear revenue contribution.

The solution is implemented using **MySQL** and provides meaningful insights through analytical SQL queries.

---

## 🎯 Problem Statement

Retail businesses often struggle with inefficient inventory management, leading to financial losses.
This project aims to answer three critical business questions:

* Which products are **close to expiry** and require immediate action?
* Which products are **not selling (dead stock)**?
* Which product categories contribute the **most revenue**?

---

## 🧠 Key Features

### 1️⃣ Expiring Soon Alert

* Identifies products expiring within the next **7 days**
* Filters items with **high stock levels (>50 units)**
* Calculates potential **stock risk value**

---

### 2️⃣ Dead Stock Analysis

* Detects products with **no sales in the last 60 days**
* Highlights inventory where capital is stuck
* Helps in planning discounts or clearance strategies

---

### 3️⃣ Revenue Contribution Report

* Calculates **monthly revenue by category**
* Uses **window functions** to determine percentage contribution
* Helps identify high-performing categories

---

## 🗂️ Database Design

The database is structured following **Third Normal Form (3NF)** to ensure data consistency and avoid redundancy.

### Tables Used:

* `Categories`
* `Products`
* `SalesTransactions`

### Relationships:

* One category → multiple products
* One product → multiple transactions

---

## ⚙️ Technologies Used

* **Database:** MySQL 8.0+
* **Query Language:** SQL (ANSI + MySQL functions)

### Concepts Applied:

* Joins
* Subqueries
* Window Functions (`SUM() OVER()`)
* Date Functions
* Aggregations

---

## 📊 Sample Insights

### 🔴 Expiring Products

Products like *Bread, Milk, Eggs* were identified with high stock and nearing expiry.
➡ Recommended action: discounts or promotions

---

### 🟡 Dead Stock

Products with no sales in the last 60 days highlight low demand.
➡ Suggested action: repositioning or clearance

---

### 🟢 Revenue Leaders

Top-performing categories include:

* Bakery
* Dairy & Eggs
* Beverages

---

## 📦 Dataset Summary

| Data Type      | Records |
| -------------- | ------- |
| Categories     | 8       |
| Products       | 29      |
| Transactions   | 32      |
| Dead Stock     | 11      |
| Expiring Items | ~9      |

---

## 🚀 How to Run

1. Install MySQL (version 8.0 or above recommended)
2. Open terminal or command prompt
3. Execute the SQL script:

```bash
mysql -u root -p < freshmart_stock_health_report_mysql.sql
```

---

## 💡 Key Achievements

* Designed a **normalized database (3NF)**
* Built **business-focused SQL queries**
* Applied **date-based logic for real scenarios**
* Used **window functions for advanced insights**
* Handled edge cases like **60-day inactivity tracking**

---

## 🔮 Future Enhancements

* Integration with dashboards (Tableau / Power BI)
* Automated alerts using stored procedures
* Store-level performance analysis
* Real-time inventory tracking

---

## 👨‍💻 Author

**Golla Manikanta Kumar**
📧 [manikantakumargolla4@gmail.com](mailto:manikantakumargolla4@gmail.com)

🔗 LinkedIn: Golla Manikanta Kumar

---

## ⭐ Conclusion

This project demonstrates how SQL can be used to transform raw inventory data into actionable insights.

It helps businesses:

* Reduce losses from expired products
* Improve stock management
* Make data-driven decisions

---
