# SQL Scripts for ERD Generation

## check_tables.sql

Run this script **before** generating your ERD to:
- See what tables exist in your database
- Identify which schema contains your tables
- View foreign key relationships
- Check primary keys
- Get table and column details

### How to Use:

1. **Connect to your database** in Oracle SQL Developer using the wallet
2. **Open a SQL Worksheet** (File → New → SQL Worksheet)
3. **Open this file** (`check_tables.sql`)
4. **Run the script** (F5 or click Run Script)
5. **Review the output** to understand your database structure
6. **Note the schema name** that contains your tables
7. **Use that schema name** when importing to Data Modeler

### What It Shows:

- **Tables in your schema** - All tables you own
- **All accessible tables** - Tables in your schema and ADMIN
- **Foreign key relationships** - How tables are connected
- **Primary keys** - Unique identifiers for each table
- **Table details** - Columns, data types, and structure
- **Table counts** - How many tables per schema

This information will help you:
- Choose the correct schema when importing to Data Modeler
- Understand relationships before generating the ERD
- Verify that foreign keys are properly defined
- Plan which tables to include in your ERD
