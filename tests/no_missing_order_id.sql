{% test no_missing_order_id(model, column_name, to) %}

select {{ column_name }} from {{ model }}
except distinct
select {{ column_name }} from {{ to }}

{% endtest %}