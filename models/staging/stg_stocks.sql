select 
    store_id,
    product_id,
    quantity as stock_quantity
from {{source("local_bike", 'stocks')}}