# Installing and Opening Oracle SQL Developer

## What is Oracle SQL Developer?

**Oracle SQL Developer** is a **free desktop application** (GUI tool) for working with Oracle databases. It runs on:
- **macOS** (your system)
- Windows
- Linux

It's not a web application - you need to download and install it on your Mac.

## Check if Already Installed

### Method 1: Check Applications Folder
1. Open **Finder**
2. Go to **Applications** folder
3. Look for **"SQL Developer"** or **"sqldeveloper"**

### Method 2: Check via Terminal
Open Terminal and run:
```bash
ls /Applications | grep -i sql
```

### Method 3: Search Spotlight
1. Press **⌘ + Space** (Command + Space)
2. Type **"SQL Developer"**
3. See if it appears

## If NOT Installed: Download and Install

### Step 1: Download Oracle SQL Developer

**Option A: Direct Download (Recommended)**
1. Go to: https://www.oracle.com/database/sqldeveloper/
2. Click **"Download Oracle SQL Developer"**
3. Choose **macOS** version
4. You'll need to:
   - Create a free Oracle account (if you don't have one)
   - Accept the license agreement
   - Download the `.dmg` file

**Option B: Oracle Technology Network**
1. Visit: https://www.oracle.com/tools/downloads/sqldev-downloads.html
2. Download the latest version for macOS

### Step 2: Install on macOS

1. **Open the downloaded `.dmg` file**
2. **Drag "SQL Developer"** to your **Applications** folder
3. **Eject the disk image**
4. **Go to Applications** and double-click **SQL Developer**

### Step 3: First Launch

**Important**: Oracle SQL Developer requires **Java** (JDK). 

**If you see a Java error:**
1. SQL Developer will prompt you to locate Java
2. On macOS, Java is usually at: `/Library/Java/JavaVirtualMachines/`
3. Or install Java from: https://www.oracle.com/java/technologies/downloads/

**First-time setup:**
- SQL Developer will ask where to store user preferences
- Choose a location (default is usually fine)
- Click **OK**

## Opening Oracle SQL Developer

### Method 1: From Applications
1. Open **Finder**
2. Go to **Applications**
3. Double-click **SQL Developer**

### Method 2: From Spotlight
1. Press **⌘ + Space**
2. Type **"SQL Developer"**
3. Press **Enter**

### Method 3: From Terminal
```bash
open /Applications/SQLDeveloper.app
```

Or if installed elsewhere:
```bash
open -a "SQL Developer"
```

### Method 4: Create Dock Shortcut
- After first launch, right-click the icon in Dock
- Choose **"Keep in Dock"** for easy access

## System Requirements

- **macOS**: 10.14 (Mojave) or later
- **Java**: JDK 11 or later (usually included or auto-detected)
- **RAM**: 2GB minimum (4GB recommended)
- **Disk Space**: ~500MB for installation

## Alternative: Use Web-Based Database Actions (No Installation Needed)

If you prefer **not to install** a desktop application, you can use Oracle's web-based interface:

### Oracle Database Actions (Web-Based)

1. **Open your web browser**
2. **Go to:**
   ```
   https://G2C2EBF11BB0545-CLINICALDB23AI.adb.us-ashburn-1.oraclecloudapps.com/ords/sql-developer
   ```
3. **Login** with your database credentials
4. **Use Data Modeler** feature to create ERD

**Advantages:**
- ✅ No installation required
- ✅ Works from any computer
- ✅ Always up-to-date
- ✅ Can create ERDs

**Disadvantages:**
- ❌ Requires internet connection
- ❌ May have fewer features than desktop version
- ❌ Performance may be slower

## Which Should You Use?

### Use Desktop SQL Developer if:
- ✅ You want full-featured tool
- ✅ You'll use it frequently
- ✅ You want offline access
- ✅ You prefer desktop applications

### Use Web-Based Database Actions if:
- ✅ You don't want to install software
- ✅ You only need it occasionally
- ✅ You're on a different computer
- ✅ You prefer web-based tools

## Troubleshooting

### "SQL Developer can't be opened because it is from an unidentified developer"
**Solution:**
1. Right-click SQL Developer
2. Choose **Open**
3. Click **Open** in the dialog
4. Or: System Preferences → Security & Privacy → Allow

### Java Not Found
**Solution:**
1. Install Java JDK from Oracle or use Homebrew:
   ```bash
   brew install openjdk@11
   ```
2. SQL Developer will prompt for Java location on first launch

### Application Won't Start
**Solution:**
1. Check Java version: `java -version`
2. Ensure JDK 11+ is installed
3. Try launching from Terminal to see error messages:
   ```bash
   /Applications/SQLDeveloper.app/Contents/MacOS/sqldeveloper
   ```

## Quick Start After Installation

1. **Launch SQL Developer**
2. **Create connection** using your wallet (see `SQL_DEVELOPER_CONNECTION_GUIDE.md`)
3. **Generate ERD** (see `GENERATE_ERD_FROM_DATABASE.md`)

## Need Help?

- **Oracle SQL Developer Documentation**: https://docs.oracle.com/en/database/oracle/sql-developer/
- **Oracle Community Forums**: https://community.oracle.com/
- **Stack Overflow**: Search for "Oracle SQL Developer" questions
