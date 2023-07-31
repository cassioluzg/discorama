with
    source_locacao as(
        select
            cast(rental_id as int) as locacao_id
            , cast(inventory_id as int) as inventario_id
            , cast(customer_id as int) as cliente_id
            , cast(staff_id as int) as funcionario_id
            , cast(rental_date as date) as data_locacao
            , cast(return_date as date) as data_retorno
        
        from {{ source('erp', 'rental') }}
    )

select *
from source_locacao