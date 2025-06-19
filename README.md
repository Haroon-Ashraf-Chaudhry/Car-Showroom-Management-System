# 🚗 Car Showroom Management System

A comprehensive **relational database system** designed to automate and streamline the operations of a car showroom. This project covers all essential aspects of database design and development including table creation, normalization, views, stored procedures, triggers, and PL/SQL functions.

> 📂 All SQL scripts for creating tables, defining triggers, procedures, functions, and views are included in this repository.

---

## 📖 Overview

The **Car Showroom Management System** enables efficient tracking and management of:
- Car inventory
- Customer interactions
- Sales processes
- Bookings and test drives
- Insurance and warranties
- Payroll and staff records

Built using **Oracle SQL / PL/SQL**, the system ensures data consistency, referential integrity, and supports business insights through queries and views.

---

## ✨ Key Features

- 📦 **Inventory Management** – Track cars with full specifications and statuses
- 👤 **Customer & Booking Records** – Maintain detailed customer profiles and bookings
- 💰 **Sales & Payments** – Capture all sale-related data with integrity
- 🧾 **Test Drives & Feedback** – Manage scheduled drives and customer impressions
- 🛡️ **Warranties & Insurance** – Track coverage periods and providers
- 🧑‍💼 **Staff & Payroll Integration** – Link payroll to staff and showroom hierarchy
- 📊 **Advanced Queries** – Select statements for reporting and insights
- 🧠 **PL/SQL Triggers & Procedures** – Business logic enforced within the DB
- 👁️ **Views** – Simplified summaries for analysis and admin use

---

## 🛠️ Technologies Used

- **Oracle SQL / PL/SQL**
- **ER Modeling**
- **Normalization (1NF to 5NF)**
- **Data Integrity Constraints (PK, FK, CHECK, UNIQUE)**
- **Functions, Triggers, Procedures**
- **SQL Views and Reporting Queries**

---

## 🧩 Database Schema Highlights

### 🧾 Main Tables
- `Customer`, `Car`, `Salesperson`, `Sale`, `TestDrive`, `Showroom`, `Inventory`
-  `Staff`, `Payroll`, `Administration`, `Insurance`, `Booking`, `Warranty`

### 📐 Relationships
- Customers can book/test/buy multiple cars
- Showrooms manage staff, salespeople, inventory
- Cars are linked to sales, bookings, test drives, warranties, and insurance

### 🔄 Normalization
- ✅ Fully normalized to **BCNF and 4NF**
- ✅ No redundancy or multivalued dependencies
- ✅ Foreign keys ensure referential integrity

---

## 📜 SQL Highlights

### ✅ Create Table Scripts
- All tables created with correct datatypes, keys, and constraints

### 🔍 Select Queries
- List all customers with purchased cars
- Test drives by car model
- Warranty coverage for each car
- Salesperson sales count
- Inventory summary per showroom

### 🧠 Views
- View 1: Staff + Showroom + Payroll summary
- View 2: Showroom-wise staff role listing

### 🧩 PL/SQL
- **Function**: Return warranty end date for given Car ID
- **Procedure**: Insert a new Sale record
- **Trigger**: Prevent duplicate `VIN` entries in `Car` table

---

## 🚀 How to Use

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/Car_Showroom_DB.git
   cd Car_Showroom_DB
2. Open in Oracle SQL Developer or compatible IDE

3. Run Tables.sql to initialize all tables

4. Insert data into the tables

5. Run remaining scripts:

- views.sql

- triggers.sql

- functions.sql

- procedures.sql

6. Explore results via Queries.sql

---

## 📄 License
- This project is licensed under the MIT License.