#!/bin/bash

# =====================================================
# Setup Project Issues Script
# Creates GitHub issues for the clinical trial data management project
# Requires: GitHub CLI (gh) installed and authenticated
# =====================================================

# Check if gh is installed
if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) is not installed."
    echo "Install it from: https://cli.github.com/"
    exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
    echo "Error: GitHub CLI is not authenticated."
    echo "Run: gh auth login"
    exit 1
fi

echo "Creating GitHub issues for clinical trial data management project..."
echo ""

# Array to store issue numbers
declare -a issue_numbers

# Issue 1: Define clinical trial data model
echo "Creating issue: Define clinical trial data model..."
if ISSUE1_OUTPUT=$(gh issue create \
  --title "Define clinical trial data model (STUDY, SITE, SUBJECT, VISIT, LAB_RESULT)" \
  --body "Design and document the core data model for clinical trial data management. This includes defining the tables (STUDY, SITE, SUBJECT, VISIT, LAB_RESULT) with their relationships, constraints, and data types. Create ERD to visualize the schema structure." \
  2>&1); then
  ISSUE1_NUM=$(echo "$ISSUE1_OUTPUT" | grep -oE 'issues/[0-9]+' | grep -oE '[0-9]+' || echo "unknown")
  issue_numbers+=("$ISSUE1_NUM")
  echo "  ✓ Created issue #$ISSUE1_NUM"
else
  echo "  ✗ Failed to create issue"
  echo "  Error: $ISSUE1_OUTPUT"
  issue_numbers+=("failed")
fi
echo ""

# Issue 2: Provision OCI Autonomous Database
echo "Creating issue: Provision OCI Always Free Autonomous Database..."
if ISSUE2_OUTPUT=$(gh issue create \
  --title "Provision OCI Always Free Autonomous Database and create schema" \
  --body "Set up Oracle Cloud Infrastructure (OCI) Always Free Autonomous Database instance. Configure wallet for secure connections, create database schema, and establish connection documentation for SQL Developer and other tools." \
  2>&1); then
  ISSUE2_NUM=$(echo "$ISSUE2_OUTPUT" | grep -oE 'issues/[0-9]+' | grep -oE '[0-9]+' || echo "unknown")
  issue_numbers+=("$ISSUE2_NUM")
  echo "  ✓ Created issue #$ISSUE2_NUM"
else
  echo "  ✗ Failed to create issue"
  echo "  Error: $ISSUE2_OUTPUT"
  issue_numbers+=("failed")
fi
echo ""

# Issue 3: Load sample data and validate queries
echo "Creating issue: Load sample clinical data and validate queries..."
if ISSUE3_OUTPUT=$(gh issue create \
  --title "Load sample clinical data and validate clinical queries" \
  --body "Insert sample data into the clinical trial tables and validate key queries including joined clinical queries (study, subject, visit, labs) and out-of-range lab results queries. Ensure data integrity and query performance." \
  2>&1); then
  ISSUE3_NUM=$(echo "$ISSUE3_OUTPUT" | grep -oE 'issues/[0-9]+' | grep -oE '[0-9]+' || echo "unknown")
  issue_numbers+=("$ISSUE3_NUM")
  echo "  ✓ Created issue #$ISSUE3_NUM"
else
  echo "  ✗ Failed to create issue"
  echo "  Error: $ISSUE3_OUTPUT"
  issue_numbers+=("failed")
fi
echo ""

# Issue 4: Add screenshots and documentation
echo "Creating issue: Add screenshots and documentation..."
if ISSUE4_OUTPUT=$(gh issue create \
  --title "Add screenshots and documentation for OCI setup and queries" \
  --body "Document the OCI setup process, database connection procedures, ERD generation, and query results. Include screenshots of the Autonomous Database, table structures, ER diagram, and key query outputs in the README." \
  2>&1); then
  ISSUE4_NUM=$(echo "$ISSUE4_OUTPUT" | grep -oE 'issues/[0-9]+' | grep -oE '[0-9]+' || echo "unknown")
  issue_numbers+=("$ISSUE4_NUM")
  echo "  ✓ Created issue #$ISSUE4_NUM"
else
  echo "  ✗ Failed to create issue"
  echo "  Error: $ISSUE4_OUTPUT"
  issue_numbers+=("failed")
fi
echo ""

# Issue 5: Document risks and next steps
echo "Creating issue: Document risks, assumptions, and next steps..."
if ISSUE5_OUTPUT=$(gh issue create \
  --title "Document risks, assumptions, and next steps" \
  --body "Identify and document project risks, assumptions, constraints, and dependencies. Define next steps for future phases including application development, advanced reporting, and integration capabilities." \
  2>&1); then
  ISSUE5_NUM=$(echo "$ISSUE5_OUTPUT" | grep -oE 'issues/[0-9]+' | grep -oE '[0-9]+' || echo "unknown")
  issue_numbers+=("$ISSUE5_NUM")
  echo "  ✓ Created issue #$ISSUE5_NUM"
else
  echo "  ✗ Failed to create issue"
  echo "  Error: $ISSUE5_OUTPUT"
  issue_numbers+=("failed")
fi
echo ""

# Summary
echo "=========================================="
echo "Summary: Created 5 GitHub issues"
echo "=========================================="
echo ""
echo "Issue numbers to add to GitHub Project board:"
echo "https://github.com/users/TomTolleson/projects/3"
echo ""
for num in "${issue_numbers[@]}"; do
  if [ "$num" != "failed" ]; then
    echo "  #$num"
  fi
done
echo ""
if [[ " ${issue_numbers[@]} " =~ " failed " ]]; then
  echo "Warning: Some issues failed to create. Check the errors above."
  echo ""
fi
echo "You can now add these issues to your project board manually."
