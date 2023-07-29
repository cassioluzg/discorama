with
    source_cliente as(
        select
            cast(customer_id as int) as cliente_id
            , cast(store_id as int) as loja_id
            , cast(address_id as int) as endereco_id
            , cast(first_name || " " || last_name as string) as cliente_nome 
            , cast(active as boolean) as is_ativo

        from {{ source('erp', 'customer') }}

    )

select *
from source_cliente