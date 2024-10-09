with invalid_records as (
    select *
    from {{ ref("null_handling") }}  -- Replace model_name with the actual model being tested
    where {{ PLAYERID }} = ''  -- This checks for empty strings
)

select count(*) as count_of_empty_strings
from invalid_records