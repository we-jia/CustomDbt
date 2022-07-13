{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "mytest",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('airbytetest_ab3') }}
select
    id as ID,
    name as NAME,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_airbytetest_hashid
from {{ ref('airbytetest_ab3') }}
-- airbytetest from {{ source('mytest', '_airbyte_raw_airbytetest') }}
where 1 = 1

