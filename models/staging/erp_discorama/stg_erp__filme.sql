with
    source_filme as(
        select
            cast(film_id as int) as filme_id
            , cast(title as string) as filme_nome
            , cast(release_year as integer) as ano_lancamento
            , cast(rental_duration as integer) as locacao_duracao
            , cast(rental_rate as decimal) as locacao_valor
            , cast(replacement_cost as decimal) as custo_reposicao
            , cast(rating as string) as avalicao

        from {{ source('erp', 'film') }}
    )

select *
from source_filme