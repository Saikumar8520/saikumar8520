{{
    config(
        materialized='incremental',
        unique_key='ID'
    )
}}

select 	ID ::NUMBER(38,0) as id,
	NAME:: VARCHAR(255) as name ,
	POSITION ::VARCHAR(255)AS POSITION ,
	DEPARTMENT ::VARCHAR(255) AS DEPARTMENT,
	SALARY ::NUMBER(38,0) AS SALARY,
	RECEIVED_AT ::TIMESTAMP_ltz(9) AS UPDATED_AT
    from {{source('prod','employee_details')}}

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where UPDATED_AT > (select max(UPDATED_AT) from {{ this }}) 
{% endif %}