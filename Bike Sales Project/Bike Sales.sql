use [Bike Sales];

--SHOW ENTIRE COLUMNS AND RAWS
SELECT * FROM bike_sales;

--SHOW TOTAL REVENUE
SELECT SUM(Revenue) AS Total_Revenue FROM bike_sales;

--SHOW AVERAGE ORDER VALUE
SELECT (SUM(Revenue) / COUNT (DISTINCT Sales_Order)) AS Avg_order FROM bike_sales;

--SHOW TOTAL BIKE SOLD
SELECT SUM(Order_Quantity) AS Total_bike_sold FROM bike_sales;

--SHOW TOTAL ORDERS
SELECT COUNT(DISTINCT sales_order) AS Total_Orders FROM bike_sales;

--SHOW DAILY TREND FOR TOTAL ORDERS

SELECT DATENAME(DW, date) AS order_day,  SUM(Order_Quantity) AS
total_orders FROM bike_sales
GROUP BY DATENAME(DW, date); 

-- SHOW MOST SELLING BIKES BY GENDER
SELECT Customer_gender,  CAST(SUM(order_quantity) AS DECIMAL(10,2)) AS 
Total_Quantity_Sold, 
CAST(SUM(Order_Quantity) * 100 / (SELECT SUM(order_quantity) from bike_sales)
AS DECIMAL(10,2)) AS Percentage
FROM bike_sales
GROUP BY  Customer_Gender
ORDER BY Customer_Gender; 

--SHOW DAILY TREND FOR ORDERS
SELECT day( date) AS Day_Num, SUM(Order_Quantity) AS
total_orders
FROM bike_sales
GROUP BY ( date);

--SHOW TOP 3 SELLING BIKES BY COUNTRY
SELECT top 3 Country , CAST(SUM(Order_Quantity) AS DECIMAL(10,2)) AS
total_sold FROM bike_sales
GROUP BY Country
ORDER BY  total_sold DESC;

--SHOW TOP 3 BIKE BY REVENUE
SELECT Top 5 product_description, SUM(Revenue) AS Total_Revenue
FROM bike_sales
GROUP BY Product_Description
ORDER BY Total_Revenue DESC;

--SHOW TOP 3 LEAST BIKE BY REVENUE
SELECT Top 5 product_description, SUM(Revenue) AS Total_Revenue
FROM bike_sales
GROUP BY Product_Description
ORDER BY Total_Revenue ASC;

--SHOW TOP 3 BIKE BY QUANTITY
SELECT Top 5 product_description, SUM(Order_Quantity) AS Total_Quantity
FROM bike_sales
GROUP BY Product_Description
ORDER BY Total_Quantity DESC;

--SHOW TOP 3 LEAST BIKE BY QUANTITY
SELECT Top 5 product_description, SUM(Order_Quantity) AS Total_Quantity
FROM bike_sales
GROUP BY Product_Description
ORDER BY Total_Quantity

--SHOW TOP 3 BIKE BY TOTAL ORDERS
SELECT Top 5 product_description, COUNT(DISTINCT(Sales_Order))AS Total_Quantity
FROM bike_sales
GROUP BY Product_Description
ORDER BY Total_Quantity DESC;

--SHOW TOP 3 BIKE BY TOTAL ORDERS
SELECT Top 5 product_description, COUNT(DISTINCT(Sales_Order))AS Total_Quantity
FROM bike_sales
GROUP BY Product_Description
ORDER BY Total_Quantity;