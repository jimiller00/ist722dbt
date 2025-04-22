with stg_order_details as
(
    select 
        orderid,
        {{ dbt_utils.generate_surrogate_key(['productid']) }} as productkey,
        unitprice,
        quantity,
        discount,
        (Quantity*UnitPrice) as extendedprice,
        (extendedprice*Discount) as discountamount,
        (extendedprice-discountamount) as soldamount, 
    from {{source('northwind','Order_Details')}}
)
select * from stg_order_details