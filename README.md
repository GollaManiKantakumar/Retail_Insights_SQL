# Retail_Insights_SQL
🛒 FreshMart Stock Health Report (SQL Project)
📌 Project Overview

This project presents a Stock Health Reporting System designed for a retail supermarket chain (FreshMart) to solve critical inventory management problems such as:

Overstocking of perishable goods
Accumulation of dead stock
Lack of revenue visibility across categories

The solution is implemented using MySQL (SQL Data Analytics) and provides actionable insights through analytical reports.

📄 Detailed Report:

🎯 Problem Statement

FreshMart faces financial losses due to inefficient inventory handling. This project answers three key business questions:

Which products are about to expire and at risk?
Which products are not selling (dead stock)?
Which product categories generate the most revenue?
🧠 Key Features
1️⃣ Expiring Soon Alert
Identifies products expiring within 7 days
Filters items with high stock (>50 units)
Calculates stock risk value
2️⃣ Dead Stock Analysis
Detects products with no sales in last 60 days
Highlights capital tied up in inventory
Helps optimize stock clearance decisions
3️⃣ Revenue Contribution Report
Ranks categories based on monthly revenue
Uses window functions for percentage contribution
Supports better business decision-making
🗂️ Database Schema

The project follows Third Normal Form (3NF) ensuring no redundancy and strong data integrity.

Tables Used:
Categories
Products
SalesTransactions

📌 Relationship:

Categories (1) → Products (1) → SalesTransactions
One category → many products
One product → many transactions
⚙️ Technologies Used
Database: MySQL 8.0+
SQL Type: ANSI SQL with MySQL extensions
Concepts:
Joins
Subqueries
Window Functions (SUM() OVER())
Date Functions
Aggregations
📊 Sample Insights
🔴 Expiring Products
Bread, Milk, Eggs → High stock + near expiry
Immediate action required (discounts/promotions)
🟡 Dead Stock
Products with zero sales in 60 days
Example: snacks, household items
Indicates poor demand or placement
🟢 Revenue Leaders
Top categories:
Bakery
Dairy & Eggs
Beverages

(As shown in report tables on pages 6–7)

📦 Dataset Details
Data Type	Records
Categories	8
Products	29
Transactions	32
Dead Stock Items	11
Expiring Products	~9

✔ Includes realistic dummy data for testing all scenarios

🚀 How to Run
Install MySQL (8.0+ recommended)
Open terminal / command prompt
Run the SQL script:
mysql -u root -p < freshmart_stock_health_report_mysql.sql
💡 Key Achievements
✔ Designed normalized database (3NF)
✔ Built dynamic SQL queries using date logic
✔ Implemented business-driven analytics
✔ Used window functions for advanced insights
✔ Handled edge cases (60-day dead stock logic)
🔮 Future Enhancements
Dashboard integration (Tableau / Power BI / Metabase)
Automated alerts using stored procedures
Store-level analysis
Real-time inventory tracking
👨‍💻 Author

Golla Manikanta Kumar
📧 manikantakumargolla4@gmail.com

🔗 LinkedIn: Golla Manikanta Kumar

⭐ Conclusion

This project delivers a complete SQL-based inventory analytics system that helps businesses:

Reduce losses from expired goods
Improve inventory turnover
Make data-driven decisions
