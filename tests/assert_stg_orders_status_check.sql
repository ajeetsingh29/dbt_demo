
with 
orders as (
    select * from {{ ref('stg_orders') }}

)


select
    status,count(*) as order_status_count from orders 
where status not  in ( 'completed'
                ,'shipped'
                ,'returned'
                ,'return_pending'
                ,'placed')
      group by status 
      having order_status_count > 0          
