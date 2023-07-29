select *
from {{ source('erp', 'actor') }}