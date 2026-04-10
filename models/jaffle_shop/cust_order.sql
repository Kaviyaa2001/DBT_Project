{{ config(materialized='table') }}
 
with customers as (
    select * from {{ ref('stg_customers') }}
),
 
orders as (
    select * from {{ ref('stg_orders2') }}
),
 
payments as (
    select * from {{ ref('stg_payments') }}
),
 
customer_orders as (
    select
        customer_id,
        count(order_id) as total_orders
    from orders
    group by customer_id
),
 
customer_payments as (
    select
        o.customer_id,
        sum(p.amount) as total_amount
    from orders o
    left join payments p
        on o.order_id = p.order_id
    group by o.customer_id
)
 
select
    c.customer_id,
    c.first_name,
    c.last_name,
    co.total_orders,
    cp.total_amount
from customers c
left join customer_orders co using (customer_id)
left join customer_payments cp using (customer_id)
 