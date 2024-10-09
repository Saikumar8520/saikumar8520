{% snapshot scd2_logic %}
    {{
        config(
            target_schema='DBT_SJAMPALA',
            target_database='TRAINING',
            unique_key='CUSTOMER_ID',
            strategy='timestamp',
            invalidate_hard_deletes=True,
            updated_at='EFECTIVE_DATE'
        )
    }}

    select * from {{ source('TRAINING', 'CUSTOMERS_DATA') }}
 {% endsnapshot %}