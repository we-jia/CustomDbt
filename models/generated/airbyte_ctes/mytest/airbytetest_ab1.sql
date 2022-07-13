{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_mytest",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('mytest', '_airbyte_raw_airbytetest') }}
select
    {{ json_extract_scalar('_airbyte_data', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['name'], ['name']) }} as name,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('mytest', '_airbyte_raw_airbytetest') }} as table_alias
-- airbytetest
where 1 = 1

