-- =====================================================
-- Clinical Trial Data Management - Sample Queries
-- Demonstrates common query patterns for clinical data
-- =====================================================

-- =====================================================
-- Query 1: Joined Clinical Query
-- Shows study, subject, visit, and lab results together
-- This is the query shown in the "Joined Clinical Query" screenshot
-- =====================================================
SELECT 
    s.study_name,
    s.study_number,
    st.site_name,
    st.site_number,
    sub.subject_number,
    sub.screening_number,
    sub.randomization_number,
    v.visit_number,
    v.visit_name,
    v.visit_date,
    lr.test_name,
    lr.test_code,
    lr.test_value,
    lr.test_unit,
    lr.normal_range_low,
    lr.normal_range_high,
    lr.result_status,
    lr.collection_date,
    lr.result_date
FROM study s
JOIN site st ON s.study_id = st.study_id
JOIN subject sub ON st.site_id = sub.site_id AND s.study_id = sub.study_id
JOIN visit v ON sub.subject_id = v.subject_id
JOIN lab_result lr ON v.visit_id = lr.visit_id
ORDER BY 
    s.study_name,
    st.site_number,
    sub.subject_number,
    v.visit_number,
    lr.test_name;

-- =====================================================
-- Query 2: Out-of-Range Lab Results
-- Identifies lab results that fall outside normal ranges
-- This is the query shown in the "Out-of-Range Labs" screenshot
-- =====================================================
SELECT 
    s.study_name,
    st.site_name,
    sub.subject_number,
    sub.screening_number,
    v.visit_name,
    v.visit_date,
    lr.test_name,
    lr.test_code,
    lr.test_value,
    lr.test_unit,
    lr.normal_range_low,
    lr.normal_range_high,
    lr.result_status,
    CASE 
        WHEN lr.test_value < lr.normal_range_low THEN 'BELOW NORMAL'
        WHEN lr.test_value > lr.normal_range_high THEN 'ABOVE NORMAL'
        ELSE 'NORMAL'
    END AS range_status,
    ABS(lr.test_value - 
        CASE 
            WHEN lr.test_value < lr.normal_range_low THEN lr.normal_range_low
            WHEN lr.test_value > lr.normal_range_high THEN lr.normal_range_high
            ELSE lr.test_value
        END
    ) AS deviation_from_range
FROM study s
JOIN site st ON s.study_id = st.study_id
JOIN subject sub ON st.site_id = sub.site_id AND s.study_id = sub.study_id
JOIN visit v ON sub.subject_id = v.subject_id
JOIN lab_result lr ON v.visit_id = lr.visit_id
WHERE lr.result_status = 'OUT_OF_RANGE'
   OR lr.test_value < lr.normal_range_low
   OR lr.test_value > lr.normal_range_high
ORDER BY 
    s.study_name,
    sub.subject_number,
    v.visit_date,
    lr.test_name;

-- =====================================================
-- Additional Useful Queries
-- =====================================================

-- Query 3: Study Enrollment Summary
SELECT 
    s.study_name,
    COUNT(DISTINCT st.site_id) AS total_sites,
    COUNT(DISTINCT sub.subject_id) AS total_subjects,
    COUNT(DISTINCT v.visit_id) AS total_visits,
    COUNT(DISTINCT lr.lab_result_id) AS total_lab_results
FROM study s
LEFT JOIN site st ON s.study_id = st.study_id
LEFT JOIN subject sub ON st.site_id = sub.site_id AND s.study_id = sub.study_id
LEFT JOIN visit v ON sub.subject_id = v.subject_id
LEFT JOIN lab_result lr ON v.visit_id = lr.visit_id
GROUP BY s.study_name, s.study_id
ORDER BY s.study_name;

-- Query 4: Subject Visit Summary
SELECT 
    sub.subject_number,
    sub.screening_number,
    COUNT(v.visit_id) AS total_visits,
    COUNT(CASE WHEN v.visit_status = 'COMPLETED' THEN 1 END) AS completed_visits,
    COUNT(CASE WHEN v.visit_status = 'SCHEDULED' THEN 1 END) AS scheduled_visits,
    MIN(v.visit_date) AS first_visit_date,
    MAX(v.visit_date) AS last_visit_date
FROM subject sub
LEFT JOIN visit v ON sub.subject_id = v.subject_id
GROUP BY sub.subject_id, sub.subject_number, sub.screening_number
ORDER BY sub.subject_number;

-- Query 5: Lab Results by Test Type
SELECT 
    lr.test_name,
    lr.test_code,
    COUNT(*) AS total_results,
    COUNT(CASE WHEN lr.result_status = 'NORMAL' THEN 1 END) AS normal_results,
    COUNT(CASE WHEN lr.result_status = 'OUT_OF_RANGE' THEN 1 END) AS out_of_range_results,
    ROUND(AVG(lr.test_value), 2) AS avg_value,
    MIN(lr.test_value) AS min_value,
    MAX(lr.test_value) AS max_value,
    lr.test_unit
FROM lab_result lr
GROUP BY lr.test_name, lr.test_code, lr.test_unit
ORDER BY lr.test_name;

-- Query 6: Site Performance Summary
SELECT 
    s.study_name,
    st.site_name,
    st.site_number,
    COUNT(DISTINCT sub.subject_id) AS enrolled_subjects,
    COUNT(DISTINCT v.visit_id) AS total_visits,
    COUNT(DISTINCT lr.lab_result_id) AS total_lab_results,
    COUNT(DISTINCT CASE WHEN lr.result_status = 'OUT_OF_RANGE' THEN lr.lab_result_id END) AS out_of_range_results
FROM study s
JOIN site st ON s.study_id = st.study_id
LEFT JOIN subject sub ON st.site_id = sub.site_id AND s.study_id = sub.study_id
LEFT JOIN visit v ON sub.subject_id = v.subject_id
LEFT JOIN lab_result lr ON v.visit_id = lr.visit_id
GROUP BY s.study_name, st.site_id, st.site_name, st.site_number
ORDER BY s.study_name, st.site_number;

PROMPT =====================================================
PROMPT Queries available:
PROMPT   1. Joined Clinical Query (Study, Subject, Visit, Labs)
PROMPT   2. Out-of-Range Lab Results
PROMPT   3. Study Enrollment Summary
PROMPT   4. Subject Visit Summary
PROMPT   5. Lab Results by Test Type
PROMPT   6. Site Performance Summary
PROMPT =====================================================
