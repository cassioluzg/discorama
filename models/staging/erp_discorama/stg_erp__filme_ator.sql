with
    source_filme_ator as(
        select
            cast(actor_id as int) as ator_id
            , cast(film_id as int) as filme_id
        
        from {{ source('erp', 'film_actor') }}
    )

select *
from source_filme_ator