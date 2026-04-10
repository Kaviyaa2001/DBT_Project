SELECT 
    customer_name,
    SUM(amount) AS total_amount,
    COUNT(*) as total_orders
FROM {{ source('raw','orders') }}
GROUP BY customer_name