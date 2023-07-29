with
    source_cidade as(
        select
            cast(city_id as int) as cidade_id
            , cast(country_id as int) as pais_id
            , cast(city.city as string) as cidade_nome
        
        from {{ source('erp', 'city') }}

    )

select *
from source_cidade