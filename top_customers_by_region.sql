-- Question: Who are the top 3 customers by number of orders in each region?
-- Approach: count orders per customer, rank within each region
--           using RANK() with PARTITION BY, then keep ranks <= 3.
-- Note: RANK() can return more than 3 rows per region when customers tie.

WITH ranked AS (SELECT region,
	   customer_id,
       COUNT(*) AS order_count,
        ROW_NUMBER() OVER (PARTITION BY region
					ORDER BY COUNT(*) DESC) AS rnk
FROM sales_analytics
GROUP BY region, customer_id)
SELECT * FROM ranked
WHERE rnk <= 3
ORDER BY region, rnk;
