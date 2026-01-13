# oracle-clinical-trial-data-mgmt-on-oci
Implementation of a cloud solution on Oracle Cloud Infrastructure (OCI) to support clinical trial data capture and reporting, inspired by Oracle Clinical / Remote Data Capture.

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
