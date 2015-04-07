--=============================================================================
--
-- NAME
--
-- i2b2_omop_base_data.sql
--
-- Author : Rajesh Ganta
-- Cincinnati Childrens Hospital Medical Center (CCHMC)
-- Date : 11/19/2014
--
-- SCHEMA / USER : OMOP_ETL
-- PEDSNET OMOP CDM Version : 1.0
-- Oracle Database 11g
--
-- DESCRIPTION:
-- Under OMOP_ETL schema run below insert statements.
-- Truncating tables omop_mapping, omop_tables and then loading data into these
-- tables omop_mapping and omop_tables.
--=============================================================================
SET DEFINE OFF;
TRUNCATE TABLE OMOP_MAPPING;
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PERSON', 'GENDER_CONCEPT_ID', 'OT', 'O', 8521, 
    'OTHER');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC, OBSERVATION_TYPE_CODE, OBSERVATION_TYPE_DESC)
 Values
   ('OBSERVATION', 'OBSERVATION_CONCEPT_ID', 'HT', 'Body height', 3036277, 
    'Body height', 38000280, 'Observation recorded from EHR');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC, OBSERVATION_TYPE_CODE, OBSERVATION_TYPE_DESC)
 Values
   ('OBSERVATION', 'OBSERVATION_CONCEPT_ID', 'WT', 'Body weight', 3025315, 
    'Body weight', 38000280, 'Observation recorded from EHR');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('OBSERVATION', 'UNIT_CONCEPT_ID', 'IN', 'cm', 8582, 
    'centimeter');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('OBSERVATION', 'UNIT_CONCEPT_ID', 'LBS', 'kg', 9529, 
    'kilogram');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC, OBSERVATION_TYPE_CODE, OBSERVATION_TYPE_DESC)
 Values
   ('OBSERVATION', 'OBSERVATION_CONCEPT_ID', 'DIASTOLIC', 'Diastolic blood pressure', 36356876, 
    'Diastolic blood pressure', 38000280, 'Observation recorded from EHR');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC, OBSERVATION_TYPE_CODE, OBSERVATION_TYPE_DESC)
 Values
   ('OBSERVATION', 'OBSERVATION_CONCEPT_ID', 'SYSTOLIC', 'Systolic blood pressure', 36356919, 
    'Systolic blood pressure', 38000280, 'Observation recorded from EHR');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE)
 Values
   ('OBSERVATION', 'UNIT_CONCEPT_ID', 'NULL');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC, OBSERVATION_TYPE_CODE, OBSERVATION_TYPE_DESC)
 Values
   ('OBSERVATION', 'OBSERVATION_CONCEPT_ID', 'ORIGINAL_BMI', 'Body mass index (BMI) [Ratio]', 3038553, 
    'Body mass index (BMI) [Ratio]', 38000280, 'Observation recorded from EHR');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE)
 Values
   ('PERSON', 'ETHNICITY_CONCEPT_ID', 'NULL');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PERSON', 'ETHNICITY_CONCEPT_ID', 'HISPANIC', 'Hispanic', 38003563, 
    'Hispanic or Latino');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_CODE)
 Values
   ('PERSON', 'ETHNICITY_CONCEPT_ID', 'NI', 44814650);
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PERSON', 'ETHNICITY_CONCEPT_ID', 'NOTHISPANIC', 'Not Hispanic', 38003564, 
    'Hispanic or Latino');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_CODE)
 Values
   ('PERSON', 'ETHNICITY_CONCEPT_ID', 'OT', 44814649);
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PERSON', 'ETHNICITY_CONCEPT_ID', 'PR', 'Hispanic', 0, 
    'Hispanic or Latino');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_CODE)
 Values
   ('PERSON', 'ETHNICITY_CONCEPT_ID', 'UN', 44814653);
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PERSON', 'GENDER_CONCEPT_ID', 'F', 'F', 8532, 
    'FEMALE');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PERSON', 'GENDER_CONCEPT_ID', 'M', 'M', 8507, 
    'MALE');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PERSON', 'GENDER_CONCEPT_ID', 'NI', 'U', 44814667, 
    'UNKNOWN');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PERSON', 'GENDER_CONCEPT_ID', 'UN', 'U', 8551, 
    'UNKNOWN');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PERSON', 'RACE_CONCEPT_ID', 'NULL', 'UNK', 8552, 
    'Unknown');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PERSON', 'RACE_CONCEPT_ID', 'AMER.INDIAN', 'American Indian or Alaska Native', 8657, 
    'American Indian or Alaska Native');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PERSON', 'RACE_CONCEPT_ID', 'ASIAN', 'Asian', 8515, 
    'Asian');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PERSON', 'RACE_CONCEPT_ID', 'ASIAN/PAC. ISL', 'Native Hawaiian or Other Pacific Islander', 8557, 
    'Native Hawaiian or Other Pacific Islander');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PERSON', 'RACE_CONCEPT_ID', 'BLACK', 'Black or African American', 8516, 
    'Black or African American');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PERSON', 'RACE_CONCEPT_ID', 'MULTI', 'Non-white', 44814659, 
    'Non-white');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PERSON', 'RACE_CONCEPT_ID', 'NI', 'Unknown', 44814661, 
    'Unknown');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PERSON', 'RACE_CONCEPT_ID', 'OT', 'Other Race', 8522, 
    'Other Race');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PERSON', 'RACE_CONCEPT_ID', 'REFUSED', 'Unknown', 44814660, 
    'Unknown');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PERSON', 'RACE_CONCEPT_ID', 'UNK', 'UNK', 8552, 
    'Unknown');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PERSON', 'RACE_CONCEPT_ID', 'WHITE', 'White', 8527, 
    'White');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('VISIT', 'PLACE_OF_SERVICE_CONCEPT_ID', 'ED', 'Emergency Room - Hospital', 8870, 
    'Emergency Room - Hospital');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('VISIT', 'PLACE_OF_SERVICE_CONCEPT_ID', 'IP', 'Inpatient Hospital', 8717, 
    'Inpatient Hospital');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('VISIT', 'PLACE_OF_SERVICE_CONCEPT_ID', 'OA', 'Outpatient Hospital', 8756, 
    'Outpatient Hospital');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('CONDITION_OCCURRENCE', 'CONDITION_TYPE_CONCEPT_ID', 'PDX:P', 'Primary Condition', 44786627, 
    'Primary Condition');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('CONDITION_OCCURRENCE', 'CONDITION_TYPE_CONCEPT_ID', 'PDX:OT', 'Secondary Condition', 44786629, 
    'Secondary Condition');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('PROCEDURE_OCCURRENCE', 'PROCEDURE_TYPE_CONCEPT_ID', 'ORIGPX:MAPPED', 'Mapped', 38000275, 
    'EHR order list entry');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('DEATH', 'DEATH_TYPE_CONCEPT_ID', 'Deceased', 'Deceased', 38003569, 
    'EHR record patient status "Deceased"');
Insert into OMOP_MAPPING
   (DESTINATION_TABLE, DESTINATION_COLUMN, SOURCE_VALUE, DESTINATION_VALUE, DESTINATION_CODE, 
    DESTINATION_DESC)
 Values
   ('DEATH', 'DEATH_TYPE_CONCEPT_ID', 'Not Recorded', 'Deceased', 38003569, 
    'EHR record patient status "Deceased"');
COMMIT;
TRUNCATE TABLE OMOP_TABLES;
Insert into OMOP_TABLES
   (TABLE_NAME)
 Values
   ('CARE_SITE');
Insert into OMOP_TABLES
   (TABLE_NAME)
 Values
   ('COHORT');
Insert into OMOP_TABLES
   (TABLE_NAME)
 Values
   ('CONDITION_ERA');
Insert into OMOP_TABLES
   (TABLE_NAME)
 Values
   ('CONDITION_OCCURRENCE');
Insert into OMOP_TABLES
   (TABLE_NAME)
 Values
   ('DEATH');
Insert into OMOP_TABLES
   (TABLE_NAME)
 Values
   ('DRUG_COST');
Insert into OMOP_TABLES
   (TABLE_NAME)
 Values
   ('DRUG_ERA');
Insert into OMOP_TABLES
   (TABLE_NAME)
 Values
   ('DRUG_EXPOSURE');
Insert into OMOP_TABLES
   (TABLE_NAME)
 Values
   ('LOCATION');
Insert into OMOP_TABLES
   (TABLE_NAME)
 Values
   ('OBSERVATION');
Insert into OMOP_TABLES
   (TABLE_NAME)
 Values
   ('OBSERVATION_PERIOD');
Insert into OMOP_TABLES
   (TABLE_NAME)
 Values
   ('ORGANIZATION');
Insert into OMOP_TABLES
   (TABLE_NAME)
 Values
   ('PAYER_PLAN_PERIOD');
Insert into OMOP_TABLES
   (TABLE_NAME)
 Values
   ('PERSON');
Insert into OMOP_TABLES
   (TABLE_NAME)
 Values
   ('PROCEDURE_COST');
Insert into OMOP_TABLES
   (TABLE_NAME)
 Values
   ('PROCEDURE_OCCURRENCE');
Insert into OMOP_TABLES
   (TABLE_NAME)
 Values
   ('PROVIDER');
Insert into OMOP_TABLES
   (TABLE_NAME)
 Values
   ('VISIT_OCCURRENCE');
COMMIT;
