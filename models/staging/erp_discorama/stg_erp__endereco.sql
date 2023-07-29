with 
    source_endereco as(
        select
            cast(address_id as int) as endereco_id
            , cast(city_id as int) as cidade_id
            , cast(address.address as string) as endereco_rua
            , cast(district as string) as endereco_bairro

        from {{ source('erp', 'address') }}

    )

select *
from source_endereco