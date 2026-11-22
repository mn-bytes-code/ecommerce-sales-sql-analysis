# ecommerce-sales-sql-analysis
# E-commerce Sales SQL Analysis

Practising SQL (MySQL 8.0) on an e-commerce sales dataset.

## Queries
- `top_customers_by_region.sql`: finds the top 3 customers by
  order count in each region, using GROUP BY, window functions
  (ROW_NUMBER, PARTITION BY) and a CTE.

## What I learned
- Window functions rank rows without collapsing them, unlike GROUP BY.
- RANK() skips numbers after ties, while DENSE_RANK() does not.
- ROW_NUMBER() gives you only 3 asked rows from each region while RANK() performed on the same condition still shows multiple tied rows from each regions.
