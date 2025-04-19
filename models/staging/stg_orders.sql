select
    order_id,
    customer_id,
    store_id,
    staff_id,
    order_status as order_status_id,
    case when order_status = 1 then 'shipped' else 'pending' end as order_status_name,
    order_date as order_created_at,
    required_date as order_forecast_shipping_date,
    case when shipped_date = 'NULL' then '2500-01-01' else shipped_date end as order_shipped_at

from {{ source('local_bike', 'orders') }}