-- Question: Who are the top 3 customers by number of orders in each region?
-- Approach: count orders per customer, number them within each region
--           using ROW_NUMBER() with PARTITION BY, then keep numbers <= 3.
-- Note: ROW_NUMBER() always returns exactly 3 rows per region. If customers
--       tie on order count, which one appears is arbitrary. RANK() would
--       keep all tied customers instead.

WITH ranked AS (
    SELECT region,
           customer_id,
           COUNT(*) AS order_count,
           ROW_NUMBER() OVER (PARTITION BY region
                              ORDER BY COUNT(*) DESC) AS rnk
    FROM sales_analytics
    GROUP BY region, customer_id
)
SELECT * FROM ranked
WHERE rnk <= 3
ORDER BY region, rnk;
