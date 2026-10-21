
-- Total Revenue
select Round(SUM(total_price), 2) as Total_Revenue
from pizza_sales

-- Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value 
FROM pizza_sales
 
-- Total Pizza Sold
 select sum(quantity) as Total_Pizza_Sold
 FROM pizza_sales

 -- Total Orders
 SELECT Count(distinct order_id) as Total_Orders
 FROM pizza_sales
 
 select * from pizza_sales

 -- Averages Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales

-- Daily Trend for Total Orders
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

SELECT DATENAME(WEEKDAY, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
from pizza_sales
Group By DATENAME(WEEKDAY, order_date) 

-- Hourly Trend For Total Orders
SELECT DATEPART(HOUR, order_time) AS orders_hours , COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)
 
 -- Percentage of Sales by Pizza Category
 SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as Total_Revenue, 
 CAST(SUM(total_price)* 100 / (SELECT SUM(total_price) FROM pizza_sales) 
 AS DECIMAL(10,2)) as PCT
 FROM pizza_sales
 GROUP BY pizza_category

 -- Percentage of Sales by Pizza Size
 SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as Total_Revenue, 
 CAST(SUM(total_price)* 100 / (SELECT SUM(total_price) FROM pizza_sales) 
 AS DECIMAL(10,2)) as PCT
 FROM pizza_sales
 GROUP BY pizza_size
 ORDER BY pizza_size

 -- Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
Group by pizza_category

-- Top 5   Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_sold
FROM pizza_sales
GROUP BY pizza_name
Order by Total_Pizza_sold DESC

-- Worst 5 Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_sold
FROM pizza_sales
GROUP BY pizza_name
Order by Total_Pizza_sold ASC