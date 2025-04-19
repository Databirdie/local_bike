select
    store_id,
    store_name,
    phone as store_phone_number,
    email as store_email,
    street as store_address_street,
    city as store_address_city,
    state as store_address_state,
    zip_code as store_address_zip_code
from {{source("local_bike", 'stores')}}