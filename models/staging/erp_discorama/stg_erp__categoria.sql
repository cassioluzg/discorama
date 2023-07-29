with
    source_categoria as(
        select
            cast(category_id as int) as categoria_id
            , cast(name as string) as categoria_nome

        from {{ source('erp', 'category') }}

    )
select *
from source_categoria