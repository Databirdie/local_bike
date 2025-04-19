SELECT  sto.store_name
, sto.store_address_zip_code
, sta.staff_first_name
, sta.staff_last_name
, c.customer_first_name
, c.customer_last_name
, c.customer_address_zip_code
, o.order_id
, p.product_name
, cat.product_category_name
, b.brand_name
, o.order_created_at
, o.order_shipped_at
, case when o.order_shipped_at < '2500-01-01' then true else false end as is_order_shipped
, case when o.order_shipped_at = '2500-01-01' then oi.ordered_quantity else 0 end as pending_order_item_number
, case when st.stock_quantity < oi.ordered_quantity then true else false end as is_out_of_stock_item
, oi.list_price
, case when o.order_shipped_at = '2500-01-01' then round(oi.ordered_quantity * oi.list_price,2) else 0 end as pending_order_turnover_before_discount
, case when o.order_shipped_at = '2500-01-01' then round(oi.ordered_quantity * (oi.list_price - (oi.list_price * oi.discount)),2) else 0 end as pending_order_turnover
, case when o.order_shipped_at < '2500-01-01' then round(oi.ordered_quantity * oi.list_price,2) else 0 end as order_turnover_before_discount
, case when o.order_shipped_at < '2500-01-01' then round(oi.ordered_quantity * (oi.list_price - (oi.list_price * oi.discount)),2) else 0 end as order_turnover

from  {{ ref('stg_orders') }} o 
inner join {{ ref('stg_order_items') }} as oi 
    on oi.order_id = o.order_id
inner join {{ ref('stg_stores') }} as sto 
    on sto.store_id = o.store_id 
inner join {{ ref('stg_staffs') }} as sta 
    on sta.staff_id = o.staff_id 
inner join {{ ref('stg_customers')}} as c 
    on c.customer_id = o.customer_id
inner join {{ ref('stg_products')}} as p 
    on p.product_id = oi.product_id
inner join {{ ref('stg_brands')}} as b 
    on b.brand_id = p.brand_id
inner join {{ ref('stg_categories')}} as cat 
    on cat.product_category_id = p.category_id