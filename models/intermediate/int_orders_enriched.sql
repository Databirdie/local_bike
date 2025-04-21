with order_items as (
    select 
    order_id
    , product_id
    , item_id
    , ordered_quantity as ordered_item_quantity
    , round(ordered_quantity * list_price,2) as order_item_turnover_before_discount
    , round(ordered_quantity * (list_price - (list_price * discount)),2) as order_item_turnover_after_discount
    from {{ ref('stg_order_items') }}
)
select  
    o.store_id
    , coalesce(sto.store_name, 'Unknown') as store_name
    , sto.store_address_zip_code
    , o.staff_id
    , coalesce(sta.staff_first_name, 'Unknown') as staff_first_name
    , coalesce(sta.staff_last_name, 'Unknown') as staff_last_name
    , o.customer_id
    , coalesce(c.customer_first_name, 'Unknown') as customer_first_name
    , coalesce(c.customer_last_name, 'Unknown') as customer_last_name
    , c.customer_address_zip_code
    , o.order_id
    , oi.product_id
    , coalesce(p.product_name, 'Unknown') as product_name
    , coalesce(cat.product_category_name, 'Unknown') as product_category_name
    , coalesce(b.brand_name, 'Unknown') as brand_name
    , o.order_created_at
    , o.order_shipped_at
    , case when o.order_shipped_at < '2500-01-01' then true else false end as is_order_shipped
    , sum(case when o.order_shipped_at < '2500-01-01' then oi.ordered_item_quantity else 0 end) as shipped_order_product_quantity
    , sum(case when o.order_shipped_at = '2500-01-01' then oi.ordered_item_quantity else 0 end) as pending_order_product_quantity
    , sum(case when o.order_shipped_at = '2500-01-01' then oi.order_item_turnover_before_discount else 0 end) as pending_order_turnover_before_discount
    , sum(case when o.order_shipped_at = '2500-01-01' then oi.order_item_turnover_after_discount else 0 end) as pending_order_turnover
    , sum(case when o.order_shipped_at < '2500-01-01' then oi.order_item_turnover_before_discount else 0 end) as order_turnover_before_discount
    , sum(case when o.order_shipped_at < '2500-01-01' then oi.order_item_turnover_after_discount else 0 end) as order_turnover

from  order_items as oi

inner join {{ ref('stg_orders') }} as o 
    on o.order_id = oi.order_id

left join {{ ref('stg_stores') }} as sto 
    on sto.store_id = o.store_id 

left join {{ ref('stg_staffs') }} as sta 
    on sta.staff_id = o.staff_id 

left join {{ ref('stg_customers')}} as c 
    on c.customer_id = o.customer_id

left join {{ ref('stg_products')}} as p 
    on p.product_id = oi.product_id

left join {{ ref('stg_brands')}} as b 
    on b.brand_id = p.brand_id

left join {{ ref('stg_categories')}} as cat 
    on cat.product_category_id = p.category_id

group by all