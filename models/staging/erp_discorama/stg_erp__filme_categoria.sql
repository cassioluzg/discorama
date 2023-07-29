with
    source_filme_caterogia as(
        select
            cast(film_id as int) as filme_id
            , cast(category_id as int) as categoria_id

        from {{ source('erp', 'film_category') }}
    )

select *
from source_filme_caterogia