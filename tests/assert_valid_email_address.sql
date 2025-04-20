select 
    customer_id
    , customer_first_name
    , customer_last_name
    , customer_address_city
from {{ ref('stg_customers')}} 
where not regexp_contains(customer_email, r"@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+")