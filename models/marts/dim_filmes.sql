with 
    filme as (
        select *
        from {{ ref('stg_erp__filme') }}
    )

    , filme_categoria as(
        select *
        from {{ ref('stg_erp__filme_categoria') }}
    )

    , categoria as(
        select *
        from {{ ref('stg_erp__categoria') }}
    )

    , join_filme as(
        select
            cast(filme.filme_id as int ) as filme_id
            , cast(filme_categoria.categoria_id  as int ) as categoria_id
            , cast(filme.filme_nome as string ) as nome_filme
            , cast(categoria.categoria_nome as string ) as categoria_filme
            , cast(filme.avalicao as string ) as avaliacao
            , cast(filme.ano_lancamento as int ) as ano_lancamento
            , cast(filme.locacao_valor as decimal ) as valor_locacao
            , cast(filme.custo_reposicao as decimal ) as custo_reposicao

        from filme
        left join filme_categoria on filme.filme_id = filme_categoria.filme_id
        left join categoria on filme_categoria.categoria_id = categoria.categoria_id
    )

select *
from join_filme