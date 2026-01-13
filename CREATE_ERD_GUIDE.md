# Creating an ERD in Oracle SQL Developer

## Quick Start Guide

### Prerequisites
- Oracle SQL Developer installed
- Database connection configured with wallet files
- Access to the database schema

## Method 1: Generate ERD from Existing Database (Recommended)

### Step 1: Connect to Database
1. Open Oracle SQL Developer
2. Click the **+** icon to create a new connection
3. Fill in connection details:
   - **Name**: `CLINICALDB23AI`
   - **Username**: Your database username
   - **Password**: Your database password
   - **Connection Type**: `Cloud Wallet`
   - **Configuration File**: Browse to `Wallet_clinicaldb23ai` folder
   - **Service**: Select appropriate service (high/medium/low)
4. Click **Test** to verify connection
5. Click **Save** and **Connect**

### Step 2: Import Schema to Data Modeler
1. In SQL Developer, right-click your connection
2. Navigate to: **Data Modeler** → **Import** → **Data Dictionary**
3. Select your connection from the dropdown
4. Click **Next**
5. Select the schema(s) you want to import (e.g., your username schema)
6. Click **Next**
7. Select tables to include in the ERD:
   - Use **Select All** or choose specific tables
   - You can filter by table name
8. Click **Next**
9. Review the import summary
10. Click **Finish**

### Step 3: View and Customize ERD
1. The Data Modeler window will open with your ERD
2. Tables will be displayed with their columns and relationships
3. You can:
   - Rearrange tables by dragging
   - Zoom in/out
   - Show/hide columns
   - Customize colors and styles

### Step 4: Export ERD
1. **File** → **Export** → **To Image File**
2. Choose format (PNG, PDF, SVG, etc.)
3. Select location and save

## Method 2: Create ERD Manually

### Step 1: Open Data Modeler
1. In SQL Developer: **File** → **Data Modeler** → **New** → **Relational Model**
2. Or use: **View** → **Data Modeler** → **Browser**

### Step 2: Create Tables
1. Right-click in the diagram area
2. Select **New** → **Table**
3. Enter table name
4. Add columns:
   - Right-click table → **Edit**
   - Add columns with data types
   - Set primary keys
   - Add constraints

### Step 3: Create Relationships
1. Click the **Foreign Key** tool
2. Click the child table (where FK will be)
3. Click the parent table (referenced table)
4. Define the relationship

### Step 4: Save and Export
1. **File** → **Save As** (saves as .dm file)
2. **File** → **Export** → **To Image File**

## Tips for Clinical Trial Database ERD

Common entities you might want to include:
- **Studies** - Clinical trial studies
- **Subjects** - Trial participants
- **Sites** - Clinical trial sites
- **Forms** - Data collection forms
- **Form_Data** - Actual form responses
- **Users** - System users
- **Roles** - User roles and permissions
- **Audit_Log** - Data change tracking

## Troubleshooting

### Connection Issues
- Verify wallet files are in the correct location
- Check `tnsnames.ora` for service names
- Ensure network connectivity to Oracle Cloud

### Import Issues
- Make sure you have SELECT privileges on tables
- Check that tables exist in the selected schema
- Verify connection is active

### ERD Display Issues
- Use **View** → **Zoom** to adjust size
- **View** → **Grid** to show/hide grid
- Right-click table → **Properties** to customize appearance

## Alternative: Use Database Actions

You can also create ERDs using Oracle Database Actions:
1. Access: https://G2C2EBF11BB0545-CLINICALDB23AI.adb.us-ashburn-1.oraclecloudapps.com/ords/sql-developer
2. Navigate to **Data Modeler** section
3. Follow similar import process
