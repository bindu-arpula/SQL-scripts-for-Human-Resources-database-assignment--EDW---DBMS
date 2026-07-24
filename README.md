# SQL-scripts-for-Human-Resources-database-assignment--EDW---DBMS

--HR Database Design & Analytics using SQL
*Project Overview

This project was developed as part of the Enterprise Data Warehouses & Database Management Systems module during my MSc in Data Analytics.

The objective was to design, implement, and analyze a Human Resources relational database that supports HR operations and analytical reporting using SQL. The project demonstrates database design principles, normalization, SQL implementation, data population, analytical queries, and performance optimization.

🎯 Objectives
Design a normalized HR relational database
Implement the database using SQL
Populate the database with sample HR data
Create SQL Views for HR reporting
Write advanced SQL queries for business insights
Apply database optimization techniques
Demonstrate enterprise database design principles

🛠️ Technologies Used
MySQL
Relational Database Design
Entity Relationship Diagram (ERD)


Database Schema
The HR database consists of multiple entities representing an enterprise HR system, including:
Employee
Department
Job Role
Salary
Attendance
Performance Review
Training Program
Employee Training
Project
Employee Project
Skill
Employee Skill
Performance Criteria
Employee Performance Criteria


🗄️ Database Design
The database was designed following the complete database development lifecycle:
Domain Analysis
Entity Identification
Conceptual Design
Logical Design
Physical Design
Entity Relationship Diagram (ERD)
Normalization to Third Normal Form (3NF)


📈 Features
Database Design
Relational database modeling
Primary & Foreign Keys
One-to-Many Relationships
Many-to-Many Relationships
Junction Tables
Referential Integrity

✅ SQL Implementation
CREATE TABLE
INSERT Statements
SQL Views
Aggregate Functions
JOIN Operations
Subqueries
CASE Statements
Window Functions
Stored Procedures
User Defined Functions


📊 HR Analytics Performed
The project includes SQL queries to answer business questions such as:
Average employee performance by department
Employee performance classification
Employees earning above department average
Salary ranking using Window Functions
Department salary summary
Training participation analysis
Employee skill distribution
Project allocation analysis


📉 SQL Views
Two analytical SQL Views were created:

Department Salary Summary
Provides:
Employee count by department
Total department salary
Average department salary

Training Participation Summary
Provides:
Training program participation
Employee learning engagement
Training completion insights


📚 Database Concepts Demonstrated
Database Normalization (1NF, 2NF, 3NF)
Entity Relationship Modeling
Primary Keys
Foreign Keys
Composite Keys
Referential Integrity
SQL Views
Query Optimization
CAP Theorem
Enterprise Database Design


📁 Repository Structure

HR-Database-Analytics
│
├── SQL
│   ├── create_tables.sql
│   ├── insert_data.sql
│   ├── views.sql
│   ├── analytical_queries.sql
│   └── stored_procedures.sql
│
├── ERD
│   └── HR_Database_ERD.png
│
├── Report
│   └── Database_Design_Report.pdf
│
├── Images
│   ├── ERD.png
│   ├── Database_Schema.png
│   └── SQL_Output.png
│
└── README.md


>> Learning Outcomes

Through this project, I gained practical experience in:
Designing enterprise relational databases
Writing complex SQL queries
Creating normalized database schemas
Developing HR reporting solutions
Building analytical SQL views
Applying database optimization techniques
Supporting HR decision-making through data analysis


>> Future Improvements
Develop an interactive Power BI dashboard connected to the database
Automate ETL processes
Integrate the database with a cloud platform
Expand the dataset with real-world HR scenarios
