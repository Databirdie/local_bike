select 
    category_id as product_category_id,
    category_name as product_category_name
from {{ source('local_bike', 'categories') }}