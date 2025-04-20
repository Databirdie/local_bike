select 
    store_name
    , product_name
    , product_category_name
    , brand_name
    , product_stock_quantity

from {{ ref('int_stocks_enriched') }}