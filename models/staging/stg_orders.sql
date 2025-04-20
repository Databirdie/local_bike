select
    order_id,
    customer_id,
    store_id,
    staff_id,
    order_status as order_status_id,
    case when order_status = 1 then 'shipped' else 'pending' end as order_status_name,
    order_date as order_created_at,
    required_date as order_forecast_shipping_date,
    -- dealing 'NULL' string values and replace them with a future date to keep data type consistency
    coalesce(case when shipped_date = 'NULL' then null else shipped_date end, '2500-01-01') as order_shipped_at

from {{ source('local_bike', 'orders') }}