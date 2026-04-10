select o.order_id 
from {{ ref('stg_orders2') }} o 
left join {{ ref('stg_payments') }} p 
on o.order_id = p.order_id
where p.order_id is null