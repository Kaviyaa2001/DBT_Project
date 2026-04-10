{% snapshot orders_snapshot %}
{{
    config(
        target_schema = 'snapshots',
        unique_key = 'id',
        strategy = 'check',
        check_cols = ['amount'],
        invalidate_hard_deletes=True
    )
}}

select *
from {{ source ('raw','orders') }}

{% endsnapshot %}