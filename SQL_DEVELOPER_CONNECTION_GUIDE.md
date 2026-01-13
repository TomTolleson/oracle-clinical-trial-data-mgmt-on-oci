# Connecting to CLINICALDB23AI using Oracle SQL Developer

## Wallet Information

Your wallet contains the following service levels:
- **clinicaldb23ai_high** - High performance service
- **clinicaldb23ai_medium** - Medium performance service (recommended for general use)
- **clinicaldb23ai_low** - Low performance service
- **clinicaldb23ai_tp** - Transaction Processing service
- **clinicaldb23ai_tpurgent** - Urgent Transaction Processing service

## Step-by-Step Connection Setup

### Step 1: Open Oracle SQL Developer
Launch Oracle SQL Developer on your Mac.

### Step 2: Create New Connection
1. Click the **+** (plus) icon in the Connections panel, or
2. Right-click in the Connections panel → **New Connection**

### Step 3: Configure Connection Using Cloud Wallet

Fill in the connection details:

**Basic Tab:**
- **Name**: `CLINICALDB23AI` (or any name you prefer)
- **Username**: Your database username (e.g., `ADMIN` or your custom user)
- **Password**: Your database password
- **Save Password**: ✓ (optional, for convenience)

**Connection Type:**
- Select **Cloud Wallet** from the dropdown

**Configuration:**
- **Configuration File**: Click the folder icon and browse to:
  ```
  /Users/tomtolleson/oracle-clinical-trial-data-mgmt-on-oci/Wallet_clinicaldb23ai
  ```

**Service:**
- Select one of the available services:
  - `clinicaldb23ai_high` (for high performance)
  - `clinicaldb23ai_medium` (recommended for general use)
  - `clinicaldb23ai_low` (for low priority tasks)

### Step 4: Test Connection
1. Click **Test** button
2. Status should show: **Success**
3. If successful, click **Save**
4. Click **Connect**

## Creating an ERD from Your Database

### Method 1: Import from Data Dictionary (Recommended)

1. **After connecting**, right-click your connection in the Connections panel
2. Navigate to: **Data Modeler** → **Import** → **Data Dictionary**
3. **Select Connection**: Choose your `CLINICALDB23AI` connection
4. Click **Next**
5. **Select Schema**: 
   - Choose your schema (usually your username, e.g., `ADMIN`)
   - Or select multiple schemas if needed
6. Click **Next**
7. **Select Tables**:
   - Use **Select All** to import all tables
   - Or manually select specific tables
   - You can filter by typing table names
8. Click **Next**
9. **Review Summary**: Check the tables that will be imported
10. Click **Finish**

### Step 2: View Your ERD

The Data Modeler window will open showing:
- All tables as boxes
- Columns within each table
- Primary keys (PK) and Foreign keys (FK)
- Relationships between tables

### Step 3: Customize Your ERD

**Rearrange Tables:**
- Click and drag tables to reposition them
- Right-click → **Auto Layout** for automatic arrangement

**Customize Display:**
- Right-click table → **Properties** to change colors, fonts
- **View** → **Zoom** to adjust size
- **View** → **Grid** to show/hide grid lines

**Show/Hide Elements:**
- Right-click table → **Show** to toggle columns, constraints, etc.

### Step 4: Export Your ERD

1. **File** → **Export** → **To Image File**
2. Choose format:
   - **PNG** (for presentations, documents)
   - **PDF** (for documentation)
   - **SVG** (for web, scalable)
   - **JPEG** (for images)
3. Select location and filename
4. Click **Save**

## Alternative: Manual ERD Creation

If you want to create an ERD from scratch:

1. **File** → **Data Modeler** → **New** → **Relational Model**
2. Right-click in diagram → **New** → **Table**
3. Enter table name and add columns
4. Create relationships using the Foreign Key tool
5. Save as `.dm` file

## Troubleshooting

### Connection Fails
- **Verify wallet path**: Make sure the path to `Wallet_clinicaldb23ai` is correct
- **Check username/password**: Ensure credentials are correct
- **Try different service**: Switch between `high`, `medium`, or `low`
- **Check network**: Ensure you can reach `adb.us-ashburn-1.oraclecloud.com`

### Import Fails
- **Check permissions**: Ensure your user has SELECT privileges on tables
- **Verify schema**: Make sure the schema name is correct
- **Check connection**: Ensure connection is active before importing

### ERD Not Displaying Correctly
- **Refresh**: Right-click → **Refresh**
- **Zoom**: Use View → Zoom to adjust
- **Layout**: Try View → Auto Layout

## Quick Reference

**Wallet Location:**
```
/Users/tomtolleson/oracle-clinical-trial-data-mgmt-on-oci/Wallet_clinicaldb23ai
```

**Available Services:**
- `clinicaldb23ai_high`
- `clinicaldb23ai_medium` ⭐ (recommended)
- `clinicaldb23ai_low`
- `clinicaldb23ai_tp`
- `clinicaldb23ai_tpurgent`

**Database Actions URL:**
```
https://G2C2EBF11BB0545-CLINICALDB23AI.adb.us-ashburn-1.oraclecloudapps.com/ords/sql-developer
```

## Next Steps

After creating your ERD:
1. Review relationships between tables
2. Document any missing foreign keys
3. Export for documentation
4. Share with your team
5. Use as reference for application development
