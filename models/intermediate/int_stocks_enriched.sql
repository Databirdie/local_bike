select 
    st.store_name
    , p.product_name
    , cat.product_category_name
    , b.brand_name
    , stock_quantity as product_stock_quantity

from {{ ref('stg_stocks') }} as sto 
left join {{ ref('stg_stores') }} as st 
    on st.store_id = sto.store_id
left join {{ ref('stg_products') }} as p 
    on p.product_id = sto.product_id
left join {{ ref('stg_categories') }} as cat 
    on cat.product_category_id = p.category_id
left join {{ ref('stg_brands') }} as b 
    on b.brand_id = p.brand_id