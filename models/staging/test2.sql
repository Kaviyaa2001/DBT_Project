SELECT id, customer_name , amount*2 as double_amount 
from {{ source('raw','orders') }}