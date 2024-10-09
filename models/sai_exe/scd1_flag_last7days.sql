{{
    config(
        materialized='incremental',
        unique_key='ID'
    )
}}

select 	distinct ID ::NUMBER(38,0) as id,
	NAME:: VARCHAR(255) as name ,
	POSITION ::VARCHAR(255)AS POSITION ,
	DEPARTMENT ::VARCHAR(255) AS DEPARTMENT,
	SALARY ::NUMBER(38,0) AS SALARY,
	RECEIVED_AT ::TIMESTAMP_ltz(9) AS UPDATED_AT,
    ACTIVE_FLAG :: varchar(1) ACTIVE_FLAG

    from {{source('prod','employee_details')}}

{% if is_incremental() %}
    where UPDATED_AT > (select dateadd(day, -7, max(UPDATED_AT)) from {{ this }}) and ACTIVE_FLAG='Y'
{% endif %}
