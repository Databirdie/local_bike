select
    staff_id,
    store_id, 
    -- deal 'NULL' string values and replace by integer to keep data type consistency
    cast(if(manager_id = 'NULL','-1',manager_id) as integer) as manager_id,
    coalesce(first_name, 'Unknown') as staff_first_name,
    coalesce(last_name, 'Unknown') as staff_last_name,
    coalesce(email, 'Unknown') as staff_email,
    coalesce(phone, 'Unknown') as staff_phone_number,
    active as is_active_staff
from {{source("local_bike", 'staffs')}}