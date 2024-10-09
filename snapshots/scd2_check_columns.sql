{% snapshot scd2_logic_check_cols %}
    {{
        config(
            target_schema='DBT_SJAMPALA',
            target_database='TRAINING',
            unique_key='CUSTOMER_ID',
            strategy='check',
            invalidate_hard_deletes=True,
            check_cols=['LAST_NAME','ADDRESS','COUNTRY']
        )
    }}

    select * from {{ source('TRAINING', 'CUSTOMERS_DATA') }}
 {% endsnapshot %}

 