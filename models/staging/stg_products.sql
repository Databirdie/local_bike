select
    product_id,
    brand_id,
    category_id,
    product_name,
    model_year,
    list_price
from {{ source('local_bike', 'products') }}