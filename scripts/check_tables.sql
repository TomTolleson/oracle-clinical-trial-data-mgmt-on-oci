-- =====================================================
-- Script to Check Existing Tables Before ERD Generation
-- Run this in Oracle SQL Developer after connecting
-- =====================================================

-- 1. Check tables in your current schema
PROMPT ========================================
PROMPT Tables in Your Schema (USER_TABLES)
PROMPT ========================================
SELECT 
    table_name,
    num_rows,
    last_analyzed
FROM user_tables
ORDER BY table_name;

-- 2. Check all tables you have access to
PROMPT ========================================
PROMPT All Tables You Have Access To
PROMPT ========================================
SELECT 
    owner,
    table_name,
    num_rows
FROM all_tables
WHERE owner IN (USER, 'ADMIN')
ORDER BY owner, table_name;

-- 3. Check foreign key relationships
PROMPT ========================================
PROMPT Foreign Key Relationships
PROMPT ========================================
SELECT 
    a.table_name AS child_table,
    a.constraint_name AS fk_name,
    b.table_name AS parent_table,
    LISTAGG(ac.column_name, ', ') WITHIN GROUP (ORDER BY ac.position) AS fk_columns
FROM user_constraints a
JOIN user_constraints b ON a.r_constraint_name = b.constraint_name
LEFT JOIN user_cons_columns ac ON a.constraint_name = ac.constraint_name
WHERE a.constraint_type = 'R'
GROUP BY a.table_name, a.constraint_name, b.table_name
ORDER BY a.table_name;

-- 4. Check primary keys
PROMPT ========================================
PROMPT Primary Keys
PROMPT ========================================
SELECT 
    a.table_name,
    a.constraint_name AS pk_name,
    LISTAGG(ac.column_name, ', ') WITHIN GROUP (ORDER BY ac.position) AS pk_columns
FROM user_constraints a
LEFT JOIN user_cons_columns ac ON a.constraint_name = ac.constraint_name
WHERE a.constraint_type = 'P'
GROUP BY a.table_name, a.constraint_name
ORDER BY a.table_name;

-- 5. Get table and column details for ERD reference
PROMPT ========================================
PROMPT Table and Column Details
PROMPT ========================================
SELECT 
    t.table_name,
    c.column_name,
    c.data_type,
    c.data_length,
    c.nullable,
    c.column_id AS position
FROM user_tables t
JOIN user_tab_columns c ON t.table_name = c.table_name
ORDER BY t.table_name, c.column_id;

-- 6. Count tables per schema
PROMPT ========================================
PROMPT Table Count by Schema
PROMPT ========================================
SELECT 
    owner,
    COUNT(*) AS table_count
FROM all_tables
WHERE owner IN (USER, 'ADMIN')
GROUP BY owner
ORDER BY owner;
