with
    endereco as(
        select *
        from {{ ref('stg_erp__endereco') }}
    )

    , cidade as(
        select *
        from {{ ref('stg_erp__cidade') }}
    )

    , pais as(
        select *
        from {{ ref('stg_erp__pais') }}
    )

    , join_endereco as(
        select
            cast(endereco.endereco_id as int) as endereco_id
            , cast(endereco.cidade_id as int) as cidade_id
            , cast(cidade.pais_id as int) as pais_id
            , cast(endereco.endereco_rua as string) as rua
            , cast(endereco.endereco_bairro as string) as bairro
            , cast(cidade.cidade_nome as string) as cidade
            , cast(pais.pais_nome as string) as pais

        from endereco
        left join cidade on endereco.cidade_id = cidade.cidade_id
        left join pais on cidade.pais_id = pais.pais_id
    )

select *
from join_endereco