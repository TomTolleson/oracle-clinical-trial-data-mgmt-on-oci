# oracle-clinical-trial-data-mgmt-on-oci

![Oracle](https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![Oracle Cloud](https://img.shields.io/badge/Oracle%20Cloud-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![OCI](https://img.shields.io/badge/OCI-Autonomous%20Database-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Developer-4479A1?style=for-the-badge&logo=oracle&logoColor=white)
![Clinical Trials](https://img.shields.io/badge/Clinical%20Trials-Data%20Management-0066CC?style=for-the-badge)
![Database](https://img.shields.io/badge/Database-Oracle%20Database-F80000?style=for-the-badge&logo=oracle&logoColor=white)

Implementation of a cloud solution on Oracle Cloud Infrastructure (OCI) to support clinical trial data capture and reporting, inspired by Oracle Clinical / Remote Data Capture.

**Oracle Cloud Infrastructure (OCI) | Clinical Trial Data Management | Oracle Autonomous Database | Clinical Data Management (CDM) | CTMS | Clinical Research Database | Regulatory Compliance | Data Integrity | IBM Oracle Cloud Solutions**

## Metadata & Keywords

**Technologies:** Oracle Cloud Infrastructure (OCI), Oracle Autonomous Database, Oracle SQL Developer, Oracle Database, SQL, PL/SQL, Clinical Data Management

**Domains:** Clinical Trials, Clinical Data Management (CDM), Electronic Data Capture (EDC), Clinical Research, Regulatory Reporting, Lab Data Management, Site Management, Subject Tracking

**Use Cases:** Clinical Trial Data Management, CTMS (Clinical Trial Management System), Oracle Clinical, Remote Data Capture, Clinical Database Design, Regulatory Compliance, Data Integrity

**Target Audience:** Clinical Data Managers, Oracle Cloud Architects, Database Administrators, Clinical Research Professionals, IBM Oracle Consultants, Oracle Cloud Implementation Teams

**Recommended GitHub Topics:** `oracle`, `oracle-cloud`, `oci`, `oracle-autonomous-database`, `clinical-trials`, `clinical-data-management`, `cdm`, `ctms`, `clinical-research`, `oracle-sql`, `database-design`, `clinical-database`, `regulatory-compliance`, `data-integrity`, `ibm`, `oracle-cloud-infrastructure`, `sql-developer`, `clinical-trial-management`, `edc`, `electronic-data-capture`

> 💡 **Tip:** Add these topics to your repository via GitHub's web interface (Settings → Topics) to improve discoverability in searches by IBM, Oracle Cloud professionals, and Clinical Data Managers.

## Screenshots

### OCI Autonomous Database

![OCI Autonomous DB Available](screenshots/DBName_Available.png)

### Clinical Schema Tables

![Clinical Tables](screenshots/TableNames.png)

### ER Diagram

![ER Diagram](screenshots/ERD.png)

### Joined Clinical Query

![Joined Clinical Query](screenshots/Joined_Query.png)

### Out-of-Range Lab Results

![Out-of-Range Labs](screenshots/OutOfRangeLabs.png)

## Project Management

This repository is managed using a [GitHub Project board (Kanban)](https://github.com/users/TomTolleson/projects/3):

- Columns: Backlog → In Progress → In Review → Done
- Work items: requirements definition, OCI setup, data modeling, test queries, documentation

The board demonstrates how Oracle Cloud implementation work can be broken into epics and tracked through to completion, similar to enterprise Oracle Cloud project delivery practices.

## SQL Scripts

The `sql/` directory contains scripts to set up and query the clinical trial database:

- **`01_create_tables.sql`** - Creates the core database tables (STUDY, SITE, SUBJECT, VISIT, LAB_RESULT) with proper relationships, constraints, indexes, and comments. Run this first to set up the database schema.

- **`02_insert_sample_data.sql`** - Inserts sample data including 2 studies, 3 sites, 5 subjects, 9 visits, and 15 lab results. This provides test data for querying and demonstrates the data model with realistic clinical trial information.

- **`03_queries.sql`** - Contains demonstration queries including the joined clinical query (showing study, subject, visit, and lab results together) and the out-of-range labs query (identifying lab values outside normal ranges). Also includes additional useful queries for enrollment summaries, visit tracking, and site performance.
