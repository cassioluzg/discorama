with
    source_pais as(
        select
            cast(country_id as int) as pais_id
            , cast(country.country as string) as pais_nome

        from {{ source('erp', 'country') }}

    )

select *
from source_pais