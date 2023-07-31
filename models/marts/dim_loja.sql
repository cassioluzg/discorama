with
    loja as(
        select *
        from {{ ref('stg_erp__loja') }}
    )

    , gerente as(
        select *
        from {{ ref('stg_erp__funcionario') }}
    )

    , endereco as(
        select *
        from {{ ref('int_endereco') }}
    )

    , join_loja as(
        select
            cast(loja.loja_id as int) as lojas_id
            , cast(loja.gerente_id as int) as gerente_id
            , cast(gerente.funcionario_nome as string) as gerente_nome
            , cast(endereco.cidade || ", " || endereco.pais as string) as localizacao

        from loja
        left join gerente on loja.gerente_id = gerente.funcionario_id
        left join endereco on loja.endereco_id = endereco.endereco_id
    )

select *
from join_loja