{% test not_contain_dollar_sign(model, column_name) %}

    select *
    from {{ model }}
    where {{ column_name }} NOT LIKE '%$%'

{% endtest %}