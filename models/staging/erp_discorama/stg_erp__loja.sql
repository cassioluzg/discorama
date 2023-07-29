with
    source_loja as(
        select
            cast(store_id as int) as loja_id
            , cast(manager_staff_id as int) as gerente_id
            , cast(address_id as int) as endereco_id

        from {{ source('erp', 'store') }}
    )

select * from
source_loja