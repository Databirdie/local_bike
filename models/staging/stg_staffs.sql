select
    staff_id,
    store_id, 
    case when manager_id = 'NULL' then '0' else manager_id end as manager_id,
    first_name as staff_first_name,
    last_name as staff_last_name,
    email as staff_email,
    phone as staff_phone_number,
    active as is_active_staff
from {{source("local_bike", 'staffs')}}