
CREATE TABLE cohort (
	cohort_id SERIAL NOT NULL, 
	cohort_concept_id INTEGER NOT NULL, 
	cohort_start_date TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	cohort_end_date TIMESTAMP WITHOUT TIME ZONE, 
	subject_id INTEGER NOT NULL, 
	stop_reason VARCHAR(100), 
	CONSTRAINT cohort_pkey PRIMARY KEY (cohort_id)
)

;

CREATE TABLE location (
	location_id SERIAL NOT NULL, 
	state VARCHAR(2), 
	zip VARCHAR(9), 
	location_source_value VARCHAR(300), 
	address_1 VARCHAR(100), 
	address_2 VARCHAR(100), 
	city VARCHAR(50), 
	county VARCHAR(50), 
	CONSTRAINT location_pkey PRIMARY KEY (location_id)
)

;

CREATE TABLE organization (
	organization_id SERIAL NOT NULL, 
	place_of_service_concept_id INTEGER, 
	location_id INTEGER, 
	place_of_service_source_value VARCHAR(100), 
	organization_source_value VARCHAR(50) NOT NULL, 
	CONSTRAINT organization_pkey PRIMARY KEY (organization_id), 
	CONSTRAINT organization_location_fk FOREIGN KEY(location_id) REFERENCES location (location_id), 
	UNIQUE (organization_source_value)
)

;
CREATE INDEX organization_organization_pos ON organization (organization_source_value, place_of_service_source_value);

CREATE TABLE care_site (
	care_site_id SERIAL NOT NULL, 
	place_of_service_concept_id INTEGER, 
	location_id INTEGER, 
	care_site_source_value VARCHAR(100) NOT NULL, 
	place_of_service_source_value VARCHAR(100), 
	organization_id INTEGER NOT NULL, 
	CONSTRAINT care_site_pkey PRIMARY KEY (care_site_id), 
	CONSTRAINT care_site_nkey UNIQUE (organization_id, care_site_source_value), 
	CONSTRAINT care_site_location_fk FOREIGN KEY(location_id) REFERENCES location (location_id), 
	CONSTRAINT care_site_organization_fk FOREIGN KEY(organization_id) REFERENCES organization (organization_id)
)

;

CREATE TABLE provider (
	provider_id SERIAL NOT NULL, 
	specialty_concept_id INTEGER, 
	care_site_id INTEGER NOT NULL, 
	npi VARCHAR(20), 
	dea VARCHAR(20), 
	provider_source_value VARCHAR(100) NOT NULL, 
	specialty_source_value VARCHAR(300), 
	CONSTRAINT provider_pkey PRIMARY KEY (provider_id), 
	CONSTRAINT provider_care_site_fk FOREIGN KEY(care_site_id) REFERENCES care_site (care_site_id), 
	UNIQUE (provider_source_value)
)

;

CREATE TABLE person (
	person_id SERIAL NOT NULL, 
	gender_concept_id INTEGER NOT NULL, 
	year_of_birth NUMERIC(4, 0) NOT NULL, 
	month_of_birth NUMERIC(2, 0), 
	day_of_birth NUMERIC(2, 0), 
	pn_time_of_birth TIMESTAMP WITHOUT TIME ZONE, 
	race_concept_id INTEGER, 
	ethnicity_concept_id INTEGER, 
	location_id INTEGER, 
	provider_id INTEGER, 
	care_site_id INTEGER NOT NULL, 
	pn_gestational_age NUMERIC(4, 2), 
	person_source_value VARCHAR(100) NOT NULL, 
	gender_source_value VARCHAR(50), 
	race_source_value VARCHAR(50), 
	ethnicity_source_value VARCHAR(50), 
	CONSTRAINT person_pkey PRIMARY KEY (person_id), 
	CONSTRAINT person_care_site_fk FOREIGN KEY(care_site_id) REFERENCES care_site (care_site_id), 
	CONSTRAINT person_location_fk FOREIGN KEY(location_id) REFERENCES location (location_id), 
	CONSTRAINT person_provider_fk FOREIGN KEY(provider_id) REFERENCES provider (provider_id), 
	UNIQUE (person_source_value)
)

;

CREATE TABLE visit_occurrence (
	visit_occurrence_id SERIAL NOT NULL, 
	person_id INTEGER NOT NULL, 
	visit_start_date TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	visit_end_date TIMESTAMP WITHOUT TIME ZONE, 
	provider_id INTEGER, 
	care_site_id INTEGER, 
	place_of_service_concept_id INTEGER NOT NULL, 
	place_of_service_source_value VARCHAR(100), 
	CONSTRAINT visit_occurrence_pkey PRIMARY KEY (visit_occurrence_id), 
	CONSTRAINT visit_occurrence_person_fk FOREIGN KEY(person_id) REFERENCES person (person_id)
)

;
CREATE INDEX visit_occurrence_person_date ON visit_occurrence (person_id, visit_start_date);

CREATE TABLE payer_plan_period (
	payer_plan_period_id SERIAL NOT NULL, 
	person_id INTEGER NOT NULL, 
	payer_plan_period_start_date TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	payer_plan_period_end_date TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	payer_source_value VARCHAR(100), 
	plan_source_value VARCHAR(100), 
	family_source_value VARCHAR(100), 
	CONSTRAINT payer_plan_period_pkey PRIMARY KEY (payer_plan_period_id), 
	CONSTRAINT payer_plan_period_person_fk FOREIGN KEY(person_id) REFERENCES person (person_id)
)

;

CREATE TABLE drug_era (
	drug_era_id SERIAL NOT NULL, 
	person_id INTEGER NOT NULL, 
	drug_concept_id INTEGER NOT NULL, 
	drug_era_start_date TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	drug_era_end_date TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	drug_type_concept_id INTEGER NOT NULL, 
	drug_exposure_count NUMERIC(4, 0), 
	CONSTRAINT drug_era_pkey PRIMARY KEY (drug_era_id), 
	CONSTRAINT drug_era_person_fk FOREIGN KEY(person_id) REFERENCES person (person_id)
)

;

CREATE TABLE condition_era (
	condition_era_id SERIAL NOT NULL, 
	person_id INTEGER NOT NULL, 
	condition_concept_id INTEGER NOT NULL, 
	condition_era_start_date TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	condition_era_end_date TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	condition_type_concept_id INTEGER NOT NULL, 
	condition_occurrence_count NUMERIC(4, 0), 
	CONSTRAINT condition_era_pkey PRIMARY KEY (condition_era_id), 
	CONSTRAINT condition_era_person_fk FOREIGN KEY(person_id) REFERENCES person (person_id)
)

;

CREATE TABLE death (
	person_id INTEGER NOT NULL, 
	death_date TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	death_type_concept_id INTEGER NOT NULL, 
	cause_of_death_concept_id SERIAL NOT NULL, 
	cause_of_death_source_value VARCHAR(100), 
	CONSTRAINT death_pkey PRIMARY KEY (person_id, death_type_concept_id, cause_of_death_concept_id), 
	CONSTRAINT death_person_fk FOREIGN KEY(person_id) REFERENCES person (person_id)
)

;

CREATE TABLE observation_period (
	observation_period_id SERIAL NOT NULL, 
	person_id INTEGER NOT NULL, 
	observation_period_start_date TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	observation_period_end_date TIMESTAMP WITHOUT TIME ZONE, 
	CONSTRAINT observation_period_pkey PRIMARY KEY (observation_period_id), 
	CONSTRAINT observation_period_person_fk FOREIGN KEY(person_id) REFERENCES person (person_id)
)

;
CREATE INDEX observation_period_person ON observation_period (person_id, observation_period_start_date);

CREATE TABLE observation (
	observation_id SERIAL NOT NULL, 
	person_id INTEGER NOT NULL, 
	observation_concept_id INTEGER NOT NULL, 
	observation_date TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	observation_time TIMESTAMP WITHOUT TIME ZONE, 
	observation_type_concept_id INTEGER NOT NULL, 
	value_as_number NUMERIC(14, 3), 
	value_as_string VARCHAR(4000), 
	value_as_concept_id INTEGER, 
	unit_concept_id INTEGER, 
	associated_provider_id INTEGER, 
	visit_occurrence_id INTEGER, 
	relevant_condition_concept_id INTEGER, 
	observation_source_value VARCHAR(100), 
	units_source_value VARCHAR(100), 
	range_low NUMERIC(14, 3), 
	range_high NUMERIC(14, 3), 
	CONSTRAINT observation_pkey PRIMARY KEY (observation_id), 
	CONSTRAINT observation_person_fk FOREIGN KEY(person_id) REFERENCES person (person_id), 
	CONSTRAINT observation_provider_fk FOREIGN KEY(associated_provider_id) REFERENCES provider (provider_id), 
	CONSTRAINT observation_visit_fk FOREIGN KEY(visit_occurrence_id) REFERENCES visit_occurrence (visit_occurrence_id)
)

;
CREATE INDEX observation_person_idx ON observation (person_id, observation_concept_id);

CREATE TABLE condition_occurrence (
	condition_occurrence_id SERIAL NOT NULL, 
	person_id INTEGER NOT NULL, 
	condition_concept_id INTEGER NOT NULL, 
	condition_start_date TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	condition_end_date TIMESTAMP WITHOUT TIME ZONE, 
	condition_type_concept_id INTEGER NOT NULL, 
	stop_reason VARCHAR(100), 
	associated_provider_id INTEGER, 
	visit_occurrence_id INTEGER, 
	condition_source_value VARCHAR(100), 
	CONSTRAINT condition_occurrence_pkey PRIMARY KEY (condition_occurrence_id), 
	CONSTRAINT condition_occurrence_person_fk FOREIGN KEY(person_id) REFERENCES person (person_id), 
	CONSTRAINT condition_provider_fk FOREIGN KEY(associated_provider_id) REFERENCES provider (provider_id), 
	CONSTRAINT condition_visit_fk FOREIGN KEY(visit_occurrence_id) REFERENCES visit_occurrence (visit_occurrence_id)
)

;

CREATE TABLE procedure_occurrence (
	procedure_occurrence_id SERIAL NOT NULL, 
	person_id INTEGER NOT NULL, 
	procedure_concept_id INTEGER NOT NULL, 
	procedure_date TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	procedure_type_concept_id INTEGER NOT NULL, 
	associated_provider_id INTEGER, 
	visit_occurrence_id INTEGER, 
	relevant_condition_concept_id INTEGER, 
	procedure_source_value VARCHAR(100), 
	CONSTRAINT procedure_occurrence_pkey PRIMARY KEY (procedure_occurrence_id), 
	CONSTRAINT procedure_occurrence_person_fk FOREIGN KEY(person_id) REFERENCES person (person_id), 
	CONSTRAINT procedure_provider_fk FOREIGN KEY(associated_provider_id) REFERENCES provider (provider_id), 
	CONSTRAINT procedure_visit_fk FOREIGN KEY(visit_occurrence_id) REFERENCES visit_occurrence (visit_occurrence_id)
)

;

CREATE TABLE drug_exposure (
	drug_exposure_id SERIAL NOT NULL, 
	person_id INTEGER NOT NULL, 
	drug_concept_id INTEGER NOT NULL, 
	drug_exposure_start_date TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	drug_exposure_end_date TIMESTAMP WITHOUT TIME ZONE, 
	drug_type_concept_id INTEGER NOT NULL, 
	stop_reason VARCHAR(100), 
	refills NUMERIC(3, 0), 
	quantity NUMERIC(4, 0), 
	days_supply NUMERIC(4, 0), 
	sig VARCHAR(500), 
	prescribing_provider_id INTEGER, 
	visit_occurrence_id INTEGER, 
	relevant_condition_concept_id INTEGER, 
	drug_source_value VARCHAR(100), 
	CONSTRAINT drug_exposure_pkey PRIMARY KEY (drug_exposure_id), 
	CONSTRAINT drug_exposure_person_fk FOREIGN KEY(person_id) REFERENCES person (person_id), 
	CONSTRAINT drug_exposure_provider_fk FOREIGN KEY(prescribing_provider_id) REFERENCES provider (provider_id), 
	CONSTRAINT drug_visit_fk FOREIGN KEY(visit_occurrence_id) REFERENCES visit_occurrence (visit_occurrence_id)
)

;

CREATE TABLE drug_cost (
	drug_cost_id SERIAL NOT NULL, 
	drug_exposure_id INTEGER NOT NULL, 
	paid_copay NUMERIC(8, 2), 
	paid_coinsurance NUMERIC(8, 2), 
	paid_toward_deductible NUMERIC(8, 2), 
	paid_by_payer NUMERIC(8, 2), 
	paid_by_coordination_benefits NUMERIC(8, 2), 
	total_out_of_pocket NUMERIC(8, 2), 
	total_paid NUMERIC(8, 2), 
	ingredient_cost NUMERIC(8, 2), 
	dispensing_fee NUMERIC(8, 2), 
	average_wholesale_price NUMERIC(8, 2), 
	payer_plan_period_id INTEGER, 
	CONSTRAINT drug_cost_pkey PRIMARY KEY (drug_cost_id), 
	CONSTRAINT drug_cost_drug_exposure_fk FOREIGN KEY(drug_exposure_id) REFERENCES drug_exposure (drug_exposure_id), 
	CONSTRAINT drug_cost_payer_plan_period_fk FOREIGN KEY(payer_plan_period_id) REFERENCES payer_plan_period (payer_plan_period_id)
)

;

CREATE TABLE procedure_cost (
	procedure_cost_id SERIAL NOT NULL, 
	procedure_occurrence_id INTEGER NOT NULL, 
	paid_copay NUMERIC(8, 2), 
	paid_coinsurance NUMERIC(8, 2), 
	paid_toward_deductible NUMERIC(8, 2), 
	paid_by_payer NUMERIC(8, 2), 
	paid_by_coordination_benefits NUMERIC(8, 2), 
	total_out_of_pocket NUMERIC(8, 2), 
	total_paid NUMERIC(8, 2), 
	disease_class_concept_id INTEGER, 
	revenue_code_concept_id INTEGER, 
	payer_plan_period_id INTEGER, 
	disease_class_source_value VARCHAR(100), 
	revenue_code_source_value VARCHAR(100), 
	CONSTRAINT procedure_cost_pkey PRIMARY KEY (procedure_cost_id), 
	CONSTRAINT procedure_cost_payer_plan_fk FOREIGN KEY(payer_plan_period_id) REFERENCES payer_plan_period (payer_plan_period_id), 
	CONSTRAINT procedure_cost_procedure_fk FOREIGN KEY(procedure_occurrence_id) REFERENCES procedure_occurrence (procedure_occurrence_id)
)

;