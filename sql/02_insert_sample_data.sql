-- =====================================================
-- Clinical Trial Data Management - Sample Data Insert
-- Inserts sample data for demonstration purposes
-- Run this after 01_create_tables.sql
-- =====================================================

-- =====================================================
-- Insert Studies
-- =====================================================
INSERT INTO study (study_name, study_number, protocol_number, study_status, start_date, end_date, description)
VALUES ('Hypertension Treatment Study', 'HT-2024-001', 'PROT-HT-001', 'ACTIVE', DATE '2024-01-15', DATE '2025-12-31', 'Phase III study evaluating new hypertension treatment');

INSERT INTO study (study_name, study_number, protocol_number, study_status, start_date, end_date, description)
VALUES ('Diabetes Management Trial', 'DM-2024-002', 'PROT-DM-002', 'ACTIVE', DATE '2024-03-01', DATE '2026-06-30', 'Long-term diabetes management and monitoring study');

COMMIT;

-- =====================================================
-- Insert Sites
-- =====================================================
INSERT INTO site (study_id, site_number, site_name, site_address, site_city, site_state, site_country, principal_investigator, site_status)
VALUES (1, '001', 'Metro Medical Center', '123 Main Street', 'Boston', 'MA', 'USA', 'Dr. Sarah Johnson', 'ACTIVE');

INSERT INTO site (study_id, site_number, site_name, site_address, site_city, site_state, site_country, principal_investigator, site_status)
VALUES (1, '002', 'Regional Health Clinic', '456 Oak Avenue', 'Chicago', 'IL', 'USA', 'Dr. Michael Chen', 'ACTIVE');

INSERT INTO site (study_id, site_number, site_name, site_address, site_city, site_state, site_country, principal_investigator, site_status)
VALUES (2, '001', 'University Medical Center', '789 Elm Street', 'New York', 'NY', 'USA', 'Dr. Emily Rodriguez', 'ACTIVE');

COMMIT;

-- =====================================================
-- Insert Subjects
-- =====================================================
INSERT INTO subject (study_id, site_id, subject_number, screening_number, randomization_number, date_of_birth, gender, enrollment_date, status)
VALUES (1, 1, '001-001', 'SCR-001', 'RAND-101', DATE '1975-05-15', 'M', DATE '2024-02-01', 'ENROLLED');

INSERT INTO subject (study_id, site_id, subject_number, screening_number, randomization_number, date_of_birth, gender, enrollment_date, status)
VALUES (1, 1, '001-002', 'SCR-002', 'RAND-102', DATE '1982-08-22', 'F', DATE '2024-02-05', 'ENROLLED');

INSERT INTO subject (study_id, site_id, subject_number, screening_number, randomization_number, date_of_birth, gender, enrollment_date, status)
VALUES (1, 2, '002-001', 'SCR-003', 'RAND-201', DATE '1968-11-10', 'M', DATE '2024-02-10', 'ENROLLED');

INSERT INTO subject (study_id, site_id, subject_number, screening_number, randomization_number, date_of_birth, gender, enrollment_date, status)
VALUES (2, 3, '001-001', 'SCR-101', 'RAND-301', DATE '1979-03-25', 'F', DATE '2024-03-15', 'ENROLLED');

INSERT INTO subject (study_id, site_id, subject_number, screening_number, randomization_number, date_of_birth, gender, enrollment_date, status)
VALUES (2, 3, '001-002', 'SCR-102', 'RAND-302', DATE '1985-07-18', 'M', DATE '2024-03-20', 'ENROLLED');

COMMIT;

-- =====================================================
-- Insert Visits
-- =====================================================
INSERT INTO visit (subject_id, visit_number, visit_name, visit_date, visit_status, visit_window_start, visit_window_end)
VALUES (1, 1, 'Screening', DATE '2024-02-01', 'COMPLETED', DATE '2024-01-25', DATE '2024-02-07');

INSERT INTO visit (subject_id, visit_number, visit_name, visit_date, visit_status, visit_window_start, visit_window_end)
VALUES (1, 2, 'Baseline', DATE '2024-02-15', 'COMPLETED', DATE '2024-02-08', DATE '2024-02-22');

INSERT INTO visit (subject_id, visit_number, visit_name, visit_date, visit_status, visit_window_start, visit_window_end)
VALUES (1, 3, 'Week 4', DATE '2024-03-15', 'COMPLETED', DATE '2024-03-08', DATE '2024-03-22');

INSERT INTO visit (subject_id, visit_number, visit_name, visit_date, visit_status, visit_window_start, visit_window_end)
VALUES (2, 1, 'Screening', DATE '2024-02-05', 'COMPLETED', DATE '2024-01-29', DATE '2024-02-11');

INSERT INTO visit (subject_id, visit_number, visit_name, visit_date, visit_status, visit_window_start, visit_window_end)
VALUES (2, 2, 'Baseline', DATE '2024-02-20', 'COMPLETED', DATE '2024-02-12', DATE '2024-02-27');

INSERT INTO visit (subject_id, visit_number, visit_name, visit_date, visit_status, visit_window_start, visit_window_end)
VALUES (3, 1, 'Screening', DATE '2024-02-10', 'COMPLETED', DATE '2024-02-03', DATE '2024-02-17');

INSERT INTO visit (subject_id, visit_number, visit_name, visit_date, visit_status, visit_window_start, visit_window_end)
VALUES (3, 2, 'Baseline', DATE '2024-02-25', 'COMPLETED', DATE '2024-02-18', DATE '2024-03-04');

INSERT INTO visit (subject_id, visit_number, visit_name, visit_date, visit_status, visit_window_start, visit_window_end)
VALUES (4, 1, 'Screening', DATE '2024-03-15', 'COMPLETED', DATE '2024-03-08', DATE '2024-03-22');

INSERT INTO visit (subject_id, visit_number, visit_name, visit_date, visit_status, visit_window_start, visit_window_end)
VALUES (5, 1, 'Screening', DATE '2024-03-20', 'COMPLETED', DATE '2024-03-13', DATE '2024-03-27');

COMMIT;

-- =====================================================
-- Insert Lab Results
-- =====================================================
-- Subject 1, Visit 2 (Baseline)
INSERT INTO lab_result (visit_id, test_name, test_code, test_value, test_unit, normal_range_low, normal_range_high, result_status, collection_date, result_date)
VALUES (2, 'Hemoglobin', 'HGB', 14.2, 'g/dL', 12.0, 16.0, 'NORMAL', DATE '2024-02-15', DATE '2024-02-16');

INSERT INTO lab_result (visit_id, test_name, test_code, test_value, test_unit, normal_range_low, normal_range_high, result_status, collection_date, result_date)
VALUES (2, 'White Blood Cell Count', 'WBC', 7200, 'cells/μL', 4000, 11000, 'NORMAL', DATE '2024-02-15', DATE '2024-02-16');

INSERT INTO lab_result (visit_id, test_name, test_code, test_value, test_unit, normal_range_low, normal_range_high, result_status, collection_date, result_date)
VALUES (2, 'Creatinine', 'CREAT', 1.1, 'mg/dL', 0.6, 1.2, 'NORMAL', DATE '2024-02-15', DATE '2024-02-16');

-- Subject 1, Visit 3 (Week 4)
INSERT INTO lab_result (visit_id, test_name, test_code, test_value, test_unit, normal_range_low, normal_range_high, result_status, collection_date, result_date)
VALUES (3, 'Hemoglobin', 'HGB', 13.8, 'g/dL', 12.0, 16.0, 'NORMAL', DATE '2024-03-15', DATE '2024-03-16');

INSERT INTO lab_result (visit_id, test_name, test_code, test_value, test_unit, normal_range_low, normal_range_high, result_status, collection_date, result_date)
VALUES (3, 'White Blood Cell Count', 'WBC', 8500, 'cells/μL', 4000, 11000, 'NORMAL', DATE '2024-03-15', DATE '2024-03-16');

INSERT INTO lab_result (visit_id, test_name, test_code, test_value, test_unit, normal_range_low, normal_range_high, result_status, collection_date, result_date)
VALUES (3, 'Creatinine', 'CREAT', 1.3, 'mg/dL', 0.6, 1.2, 'OUT_OF_RANGE', DATE '2024-03-15', DATE '2024-03-16');

-- Subject 2, Visit 2 (Baseline)
INSERT INTO lab_result (visit_id, test_name, test_code, test_value, test_unit, normal_range_low, normal_range_high, result_status, collection_date, result_date)
VALUES (5, 'Hemoglobin', 'HGB', 11.5, 'g/dL', 12.0, 16.0, 'OUT_OF_RANGE', DATE '2024-02-20', DATE '2024-02-21');

INSERT INTO lab_result (visit_id, test_name, test_code, test_value, test_unit, normal_range_low, normal_range_high, result_status, collection_date, result_date)
VALUES (5, 'White Blood Cell Count', 'WBC', 5200, 'cells/μL', 4000, 11000, 'NORMAL', DATE '2024-02-20', DATE '2024-02-21');

INSERT INTO lab_result (visit_id, test_name, test_code, test_value, test_unit, normal_range_low, normal_range_high, result_status, collection_date, result_date)
VALUES (5, 'Creatinine', 'CREAT', 0.9, 'mg/dL', 0.6, 1.2, 'NORMAL', DATE '2024-02-20', DATE '2024-02-21');

-- Subject 3, Visit 2 (Baseline)
INSERT INTO lab_result (visit_id, test_name, test_code, test_value, test_unit, normal_range_low, normal_range_high, result_status, collection_date, result_date)
VALUES (7, 'Hemoglobin', 'HGB', 15.5, 'g/dL', 12.0, 16.0, 'NORMAL', DATE '2024-02-25', DATE '2024-02-26');

INSERT INTO lab_result (visit_id, test_name, test_code, test_value, test_unit, normal_range_low, normal_range_high, result_status, collection_date, result_date)
VALUES (7, 'White Blood Cell Count', 'WBC', 12500, 'cells/μL', 4000, 11000, 'OUT_OF_RANGE', DATE '2024-02-25', DATE '2024-02-26');

INSERT INTO lab_result (visit_id, test_name, test_code, test_value, test_unit, normal_range_low, normal_range_high, result_status, collection_date, result_date)
VALUES (7, 'Creatinine', 'CREAT', 1.0, 'mg/dL', 0.6, 1.2, 'NORMAL', DATE '2024-02-25', DATE '2024-02-26');

-- Subject 4, Visit 1 (Screening)
INSERT INTO lab_result (visit_id, test_name, test_code, test_value, test_unit, normal_range_low, normal_range_high, result_status, collection_date, result_date)
VALUES (8, 'Hemoglobin A1c', 'HBA1C', 7.2, '%', 4.0, 6.5, 'OUT_OF_RANGE', DATE '2024-03-15', DATE '2024-03-16');

INSERT INTO lab_result (visit_id, test_name, test_code, test_value, test_unit, normal_range_low, normal_range_high, result_status, collection_date, result_date)
VALUES (8, 'Fasting Glucose', 'GLUC', 145, 'mg/dL', 70, 100, 'OUT_OF_RANGE', DATE '2024-03-15', DATE '2024-03-16');

-- Subject 5, Visit 1 (Screening)
INSERT INTO lab_result (visit_id, test_name, test_code, test_value, test_unit, normal_range_low, normal_range_high, result_status, collection_date, result_date)
VALUES (9, 'Hemoglobin A1c', 'HBA1C', 6.8, '%', 4.0, 6.5, 'OUT_OF_RANGE', DATE '2024-03-20', DATE '2024-03-21');

INSERT INTO lab_result (visit_id, test_name, test_code, test_value, test_unit, normal_range_low, normal_range_high, result_status, collection_date, result_date)
VALUES (9, 'Fasting Glucose', 'GLUC', 112, 'mg/dL', 70, 100, 'OUT_OF_RANGE', DATE '2024-03-20', DATE '2024-03-21');

COMMIT;

PROMPT =====================================================
PROMPT Sample data inserted successfully!
PROMPT =====================================================
PROMPT Inserted:
PROMPT   - 2 Studies
PROMPT   - 3 Sites
PROMPT   - 5 Subjects
PROMPT   - 9 Visits
PROMPT   - 15 Lab Results
PROMPT =====================================================
