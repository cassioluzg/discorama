with
    source_pagamento as(
        select
            cast(payment_id as int) as pagamento_id
            , cast(customer_id as int) as cliente_id
            , cast(staff_id as int) as funcionario_id
            , cast(rental_id as int) as locacao_id
            , cast(amount as decimal) as valor

        from {{ source('erp', 'payment') }}
    )

select *
from source_pagamento