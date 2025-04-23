with f_sales as (
    select * from {{ ref('fact_sales') }}
),
d_product as (
    select * from {{ ref('dim_product') }}
)
select 
    d_product.*,
    f.orderid, f.quantity, f.discount, f.extendedprice, f.discountamount, f.soldamount
    from f_sales as f
    left join d_product on f.productkey = d_product.productkey