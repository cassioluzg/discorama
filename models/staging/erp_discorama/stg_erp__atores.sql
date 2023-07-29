with
    source_atores as(
        select 
            cast(actor_id as int) as ator_id
            , cast(first_name || " " || last_name as string) as ator_nome

        from {{ source('erp', 'actor') }}
    )

select *
from source_atores  