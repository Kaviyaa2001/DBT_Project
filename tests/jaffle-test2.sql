select *
from {{ ref('stg_payments') }}
where amount <=0 or amount > 10000