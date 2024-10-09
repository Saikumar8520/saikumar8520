
{% macro generate_profit_model(table_name) %}
    select 
    month_year,
(unit_price*sales) as profit
,(round((((sales - (quantity * unit_price)) / sales) * 100 ),2)) :: int AS  profit_p
from {{ source('TRAINING', table_name) }}
{% endmacro %}


{% macro get_database_name(environment) %}
    {% if environment == 'Saikumar8520' %}
        TRAINING
    {% elif environment == 'dev' %}
        HOCKEYDB
    {% else %}
        'DEFAULT_DB'
    {% endif %}
{% endmacro %}

