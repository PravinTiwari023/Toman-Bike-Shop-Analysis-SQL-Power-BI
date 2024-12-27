CREATE DATABASE bike_data;

WITH cte as (
SELECT * FROM [dbo].[bike_share_yr_0]
UNION ALL
SELECT * FROM [dbo].[bike_share_yr_1])

SELECT 
dteday, season, a.yr, weekday, hr, rider_type, riders, price, COGS,
riders*price as revenue,
riders*price-COGS as profit
FROM cte a
LEFT JOIN cost_table b
ON a.yr = b.yr;

-- Step 1: Check current data in the COGS column
SELECT * FROM [dbo].[cost_table];