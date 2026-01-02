version: 2

models:
  - name: stg_gz_product
    description: "Staging model for product data."
    columns:
      - name: products_id
        description: "Primary key of product table."
        tests:
          - not_null
          - unique
