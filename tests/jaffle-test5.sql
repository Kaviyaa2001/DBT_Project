select *
from (
    select 
        (select sum(amount) from {{ ref('stg_payments') }}) as payments_total,
        (select sum(total_amount) from {{ ref('cust_order')}}) as customer_total
)
where payments_total != customer_total