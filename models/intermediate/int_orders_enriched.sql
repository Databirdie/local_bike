SELECT  o.store_id
, o.staff_id
, o.customer_id
, o.order_id
, o.order_status_id
, oi.product_id
, o.order_created_at
, o.order_shipped_at
, case when o.order_shipped_at < '2500-01-01' then true else false end as is_order_shipped
, case when o.order_shipped_at = '2500-01-01' then oi.quantity else 0 end as pending_order_item_number
, st.stock_quantity as available_quantity
, case when st.stock_quantity < oi.quantity then true else false end as is_out_of_stock_item
, oi.list_price
, case when o.order_shipped_at = '2500-01-01' then round(oi.quantity * oi.list_price,2) else 0 end as pending_order_turnover_before_discount
, case when o.order_shipped_at = '2500-01-01' then round(oi.quantity * (oi.list_price - (oi.list_price * oi.discount)),2) else 0 end as pending_order_turnover
, case when o.order_shipped_at < '2500-01-01' then round(oi.quantity * oi.list_price,2) else 0 end as order_turnover_before_discount
, case when o.order_shipped_at < '2500-01-01' then round(oi.quantity * (oi.list_price - (oi.list_price * oi.discount)),2) else 0 end as order_turnover

from  {{ ref('stg_orders') }} o 
inner join {{ ref('stg_order_items') }} oi on oi.order_id = o.order_id
inner join {{ ref('stg_stocks') }} st on st.store_id = o.store_id and st.product_id = oi.product_id