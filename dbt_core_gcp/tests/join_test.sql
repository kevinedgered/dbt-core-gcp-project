unit_tests:
  - name: test_is_join_work
    description: "Check if the JOIN works properly."
    model: gold_payments_clients
    given:
      - input: ref('silver_payments')
        rows:
          - {transaction_id: 17810, contract_id: 1022, client_id: 1, transaction_date: 2018-04-22 18:08:36 UTC, payment_amt: $9.67, payment_code: PAYMENT  }
          - {transaction_id: 17811, contract_id: 1023, client_id: 2, transaction_date: 2018-04-22 18:09:36 UTC, payment_amt: $1.67, payment_code: PAYMENT  }
          - {transaction_id: 17812, contract_id: 1024, client_id: 3, transaction_date: 2018-04-22 18:10:36 UTC, payment_amt: $91.67, payment_code: PAYMENT  }
      - input: source('demo_bronze','clients')
        rows:
          - {client_id: 1, entity_type: Hybrid Trust, entity_year_established: 2007}
    expect:
      rows:
        - {transaction_id: 17810, contract_id: 1022, client_id: 1, transaction_date: 2018-04-22 18:08:36 UTC, payment_amt: $9.67, payment_code: PAYMENT, entity_type: Hybrid Trust, entity_year_established: 2007}
        - {transaction_id: 17811, contract_id: 1023, client_id: 2, transaction_date: 2018-04-22 18:09:36 UTC, payment_amt: $1.67, payment_code: PAYMENT, entity_type: , entity_year_established:  }
        - {transaction_id: 17812, contract_id: 1024, client_id: 3, transaction_date: 2018-04-22 18:10:36 UTC, payment_amt: $91.67, payment_code: PAYMENT, entity_type: , entity_year_established:  }
