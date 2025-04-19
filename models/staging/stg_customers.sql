select
    customer_id,
    first_name as customer_first_name,
    last_name as customer_last_name,
    phone as customer_phone_number,
    email as customer_email,
    street as customer_address_street,
    city as customer_address_city,
    state as customer_address_state,
    zip_code as customer_address_zip_code
from {{ source('local_bike', 'customers') }}