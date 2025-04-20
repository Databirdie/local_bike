select 
    store_address_zip_code
    , store_name
    , staff_first_name||' '||staff_last_name as staff_name
    , customer_first_name||' '||customer_last_name as customer_name
    , customer_address_zip_code
    , order_id
    , product_name
    , product_category_name
    , brand_name
    , order_created_at
    , order_shipped_at
    , is_order_shipped
    , pending_order_product_quantity
    , list_price
    , discount
    , pending_order_turnover_before_discount
    , pending_order_turnover
    , order_turnover_before_discount
    , order_turnover

from {{ ref('int_orders_enriched')}}