# Gym Management System (MySQL)

📖 Overview
The Gym Management System is a relational database built with MySQL Workbench 8.0. It manages classes, members, memberships, payments, and trainers for a gym.

This project demonstrates:
Relational database design and table relationships
Data integrity using primary keys, foreign keys, unique, and check constraints
Advanced queries, views, and stored procedures for automation and reporting
Sample data for testing and demonstrations

⚙️ Features:
5 main tables: classes, members, memberships, payments, trainers

Constraints: Primary keys, foreign keys, unique, and check constraints

Automation: Stored procedures and views

Sample data included

📁 Files & Folder Structure
/sql
    gym_system.sql       # Full database export (tables, data, views, procedures)
/reports
    ERD.png              # Database diagram
    project_document.pdf # Detailed report 
README.md                # Project overview and instructions

🚀 Usage

Open MySQL Workbench.
Import the SQL file:
Go to Server → Data Import → Import from Self-Contained File
Select /sql/gym_system.sql
Execute to create the database with tables, sample data, views, and procedures
Run queries, views, or stored procedures as needed

🗂 Database Diagram

Shows all tables, primary/foreign keys, and relationships

💡 Example Query
-- List all members and their active memberships
SELECT m.first_name, m.last_name, ms.membership_type, ms.start_date, ms.end_date
FROM members m
JOIN memberships ms ON m.member_id = ms.member_id;

🛠 Tools Used

MySQL Workbench 8.0 – Database creation, management, and queries

GitHub – Version control and project hosting

## 🗂 Database Diagram
[View ERD Diagram](./reports/ERD.png)

## 🗂 Database Diagram
![ERD Diagram](./reports/ERD.png)

👤 Author
Daniel Alandary

