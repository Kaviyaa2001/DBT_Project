SELECT 
    id as customer_id,
    first_name,
    last_name
FROM {{ source ('raw','customers') }}
