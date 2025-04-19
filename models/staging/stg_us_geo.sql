select
  city as city_name,
  state_name,
  zip as zip_code,
  lat as latitude,
  lng as longitude
from {{ source("local_bike", 'us_geo')}}