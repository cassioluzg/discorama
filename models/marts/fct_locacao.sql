with
    locacao as(
        select *
        from {{ ref('stg_erp__locacao') }}
    )

    , inventario as(
        select *
        from {{ ref('stg_erp__inventario') }}
    )

    , pagamento as(
        select *
        from {{ ref('stg_erp__pagamento') }}
    )

    , join_locacao as(
        select
            cast(locacao.locacao_id as int) as locacao_id
            , cast(inventario.filme_id as int) as filme_id
            , cast(inventario.loja_id as int) as loja_id
            , cast(locacao.cliente_id as int) as cliente_id
            , cast(locacao.funcionario_id as int) as funcionario_id
            , cast(locacao.data_locacao as date) as data_locacao
            , cast(locacao.data_retorno as date) as data_retorno
            , cast(pagamento.valor as decimal) as valor_locacao

        from locacao
        left join inventario on locacao.inventario_id = inventario.inventario_id
        left join pagamento on locacao.locacao_id = pagamento.locacao_id
    )

    , calc_locacao as(
        select
            *
            , DATE_DIFF(data_retorno, data_locacao, day) as duracao_locacao

        from join_locacao
    )

select *
from calc_locacao
