with
    filme_ator as(
        select *
        from {{ ref('stg_erp__filme_ator') }}
    )

    , ator as(
        select *
        from {{ ref('stg_erp__atores') }}
    )

    , join_ator as(
        select
            cast(filme_ator.ator_id || "-" || filme_ator.filme_id as string ) as ator_filme_id
            , cast(filme_ator.ator_id as int) as ator_id
            , cast(filme_ator.filme_id as int) as filme_id
            , cast(ator.ator_nome as string) as ator_nome

        from filme_ator
        left join ator on filme_ator.ator_id = ator.ator_id
    )

select *
from join_ator