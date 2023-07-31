with
    source_func as(
        select
            cast(staff_id as int) as funcionario_id
            , cast(store_id as int) as loja_id
            , cast(first_name || " " || last_name as string) as funcionario_nome
        
        from {{ source('erp', 'staff') }}
        where active = true
    )

select *
from source_func