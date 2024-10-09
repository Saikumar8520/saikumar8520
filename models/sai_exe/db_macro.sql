-- Get the current environment (e.g., 'dev', 'Saikumar8520')
{% set current_env = 'Saikumar8520' %}

-- Call the macro to get the appropriate database name
{% set db_name = get_database_name(current_env) %}

-- Use the database name dynamically in the query
select *
from {{ db_name }}."DBT_SJAMPALA"."CUSTOMERS_DATA"
