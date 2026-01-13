# Generate ERD from Existing Database Tables

This guide will walk you through generating an ERD from your existing CLINICALDB23AI database.

## Prerequisites
- Oracle SQL Developer installed
- Wallet files in `Wallet_clinicaldb23ai` folder
- Database username and password
- Network access to Oracle Cloud

## Step 1: Connect to Database

1. **Open Oracle SQL Developer**

2. **Create New Connection:**
   - Click **+** icon in Connections panel
   - Or: Right-click Connections → **New Connection**

3. **Configure Connection:**
   ```
   Name: CLINICALDB23AI
   Username: [your database username]
   Password: [your database password]
   Connection Type: Cloud Wallet
   Configuration File: /Users/tomtolleson/oracle-clinical-trial-data-mgmt-on-oci/Wallet_clinicaldb23ai
   Service: clinicaldb23ai_medium (or high/low)
   ```

4. **Test Connection:**
   - Click **Test** button
   - Should show: "Status: Success"
   - Click **Save**
   - Click **Connect**

## Step 2: Verify Tables Exist (Optional)

Before generating the ERD, you may want to see what tables exist:

1. **In SQL Developer**, with your connection selected, open a SQL Worksheet
2. **Run this query:**
   ```sql
   SELECT owner, table_name, num_rows
   FROM all_tables
   WHERE owner = USER
   ORDER BY table_name;
   ```
   
   Or to see all tables you have access to:
   ```sql
   SELECT owner, table_name, num_rows
   FROM all_tables
   WHERE owner IN (USER, 'ADMIN')
   ORDER BY owner, table_name;
   ```

3. **Note the schema name(s)** that contain your tables

## Step 3: Generate ERD Using Data Modeler

### Method A: Import from Data Dictionary (Recommended)

1. **Right-click your connection** in the Connections panel

2. **Navigate to:**
   ```
   Data Modeler → Import → Data Dictionary
   ```

3. **Step 1 - Select Connection:**
   - Choose your `CLINICALDB23AI` connection from dropdown
   - Click **Next**

4. **Step 2 - Select Schema:**
   - Check the schema(s) that contain your tables
   - Common schemas: Your username, `ADMIN`, or custom schema names
   - Click **Next**

5. **Step 3 - Select Tables:**
   - **Option 1**: Click **Select All** to import all tables
   - **Option 2**: Manually select specific tables
   - You can filter by typing table names in the search box
   - Click **Next**

6. **Step 4 - Review Summary:**
   - Review the list of tables that will be imported
   - Check the number of tables, columns, constraints
   - Click **Finish**

7. **ERD Generation:**
   - Data Modeler window will open
   - Tables will be automatically arranged
   - Relationships (foreign keys) will be shown as lines

## Step 4: View and Customize Your ERD

### Arrange Tables
- **Drag and drop** tables to reposition them
- **Right-click** → **Auto Layout** for automatic arrangement
- **View** → **Zoom** to adjust size (Fit to Window, Zoom In/Out)

### Customize Appearance
- **Right-click table** → **Properties**:
  - Change table color
  - Modify font size
  - Adjust border style
- **View** → **Grid** to show/hide grid lines
- **View** → **Page Breaks** to see print layout

### Show/Hide Elements
- **Right-click table** → **Show**:
  - ✓ Columns
  - ✓ Primary Keys
  - ✓ Foreign Keys
  - ✓ Indexes
  - ✓ Constraints

### View Table Details
- **Double-click table** to see detailed properties
- View all columns, data types, constraints
- Edit if needed (changes won't affect database)

## Step 5: Export Your ERD

### Export as Image
1. **File** → **Export** → **To Image File**
2. **Choose format:**
   - **PNG** - Best for presentations, documents
   - **PDF** - Best for documentation, printing
   - **SVG** - Scalable vector, good for web
   - **JPEG** - Smaller file size
3. **Select location** and filename
4. Click **Save**

### Export as Data Modeler File
1. **File** → **Save As**
2. Save as `.dm` file (Data Modeler format)
3. Can be reopened later in SQL Developer

### Export DDL Scripts
1. **File** → **Export** → **DDL File**
2. Generates SQL scripts to recreate the schema
3. Useful for documentation or version control

## Step 6: Document Your ERD

### Add Notes and Comments
- **Right-click table** → **Edit** → **Comments** tab
- Add descriptions for tables and columns
- Document business rules

### Print or Share
- **File** → **Print** to print the ERD
- Export as PDF for sharing with team
- Include in project documentation

## Troubleshooting

### No Tables Found
**Problem**: Import shows no tables
**Solutions**:
- Verify you're connected to the correct database
- Check schema name - try `ADMIN` or your username
- Run the verification query in Step 2 to see available tables
- Ensure your user has SELECT privileges on tables

### Connection Fails
**Problem**: Cannot connect to database
**Solutions**:
- Verify wallet path is correct
- Check username and password
- Try different service level (high/medium/low)
- Ensure network connectivity to Oracle Cloud
- Check if wallet files are not corrupted

### ERD Shows No Relationships
**Problem**: Tables appear but no foreign key lines
**Solutions**:
- Foreign keys may not be defined in database
- Check if relationships exist: `SELECT * FROM all_constraints WHERE constraint_type = 'R'`
- You can manually add relationships in Data Modeler

### Tables Overlap or Hard to Read
**Solutions**:
- Use **View** → **Auto Layout** to rearrange
- Manually drag tables apart
- Use **View** → **Zoom** to adjust size
- Hide less important columns: Right-click table → **Show** → uncheck items

### Import Takes Too Long
**Solutions**:
- Select specific tables instead of "Select All"
- Import one schema at a time
- Close other applications to free memory
- For large schemas, consider importing in batches

## Quick Reference Commands

### Check Your Schema
```sql
-- See all your tables
SELECT table_name FROM user_tables ORDER BY table_name;

-- See tables with row counts
SELECT table_name, num_rows 
FROM user_tables 
ORDER BY table_name;

-- See all foreign key relationships
SELECT 
    a.table_name child_table,
    a.constraint_name,
    b.table_name parent_table
FROM user_constraints a
JOIN user_constraints b ON a.r_constraint_name = b.constraint_name
WHERE a.constraint_type = 'R'
ORDER BY a.table_name;
```

### Check Available Schemas
```sql
-- See schemas you have access to
SELECT DISTINCT owner FROM all_tables ORDER BY owner;
```

## Next Steps After Creating ERD

1. **Review relationships** - Verify foreign keys are correct
2. **Document** - Add comments and descriptions
3. **Share** - Export and share with team
4. **Update** - Re-import periodically as schema evolves
5. **Version control** - Save .dm files in git for tracking changes

## Alternative: Use Database Actions Web Interface

If SQL Developer is not available, you can also use the web-based interface:

1. **Open browser** and go to:
   ```
   https://G2C2EBF11BB0545-CLINICALDB23AI.adb.us-ashburn-1.oraclecloudapps.com/ords/sql-developer
   ```

2. **Login** with your database credentials

3. **Navigate to Data Modeler** section

4. **Follow similar import process**
