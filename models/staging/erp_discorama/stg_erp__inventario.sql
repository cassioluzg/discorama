with
    source_inventario as(
        select
            cast(inventory_id as int) as inventario_id
            , cast(film_id as int) as filme_id
            , cast(store_id as int) as loja_id
        
        from {{ source('erp', 'inventory') }}
    )

select *
from source_inventario