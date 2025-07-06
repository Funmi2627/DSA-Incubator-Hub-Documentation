

select * from [dbo].[KMS Sql Case Study]

------Analysis 1------- Which product category had the highest sales
select Product_Category, sum(sales) as [Total Sales]
from [dbo].[KMS Sql Case Study]
group by Product_Category
order by [Total Sales] desc
------Technonogy has the highest sales------ 


select * from [dbo].[KMS Sql Case Study]

----- Analysis 2 What are the Top 3 and Bottom 3 regions in terms of sales?------

select top 3 region, sum(sales) as [Total Sales]
	from [dbo].[KMS Sql Case Study]
group by region
order by [Total Sales] desc
---West, Ontario and Prane are the top 3 regions in terms of sales-----

-----Bottom 3---------
SELECT TOP 3 Region, SUM(Sales) AS [Total Sales]
FROM [dbo].[KMS Sql Case Study]
GROUP BY Region
ORDER BY [Total Sales] ASC
----Nunavut,Northwest Territories and Yukon are the Bottom 3 regions in terms of sales------

------ANALYSIS 3 What were the total sales of appliances in Ontario
SELECT 
    SUM(Sales) AS [Total Sales]
FROM 
    [dbo].[KMS Sql Case Study]
WHERE 
    Product_Sub_Category = 'Appliances'
    AND Region = 'Ontario'
-------The total sales of appliances in Ontario is 202346.84


----Analysis 4 Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers------
select top 10 Customer_Name,shipping_cost, Discount, Unit_price, SUM(Order_quantity) as [Total_Order_Quantity]
	from[dbo].[KMS Sql Case Study]
GROUP BY Customer_Name,shipping_cost, Discount, Unit_price
ORDER BY [Total_Order_Quantity] ASC

----If some of these customers are inactive, run win-back campaigns with compelling offers.
----Offer exclusive deals or discounts on products they've purchased before.
----Introduce volume-based pricing or bundled offers to encourage larger orders.
----Provide loyalty points or rewards for repeat purchases.


----ANALYSIS 5 KMS incurred the most shipping cost using which shipping method-----
SELECT Ship_Mode, SUM([Shipping_cost]) AS [Total_shipping_cost]
	FROM [dbo].[KMS Sql Case Study]
GROUP BY Ship_Mode
ORDER BY [Total_shipping_cost] desc

----ANALYSIS 6 Who are the most valuable customers, and what products or services do they typically purchase?------
SELECT TOP 10 Customer_segment, product_sub_category, Customer_name, SUM([Sales]) AS [Total_sales]
FROM [dbo].[KMS Sql Case Study]
GROUP BY Customer_segment, product_sub_category, Customer_name
ORDER BY [Total_sales] desc

-----ANSALYSIS 7 Which small business customer had the highest sales? ---------
SELECT TOP 1 customer_name, sum(sales) as [Highest sales]
FROM [dbo].[KMS Sql Case Study]
Group by Customer_name
ORDER BY [Highest Sales] DESC 

-----ANALYSIS 8 Which Corporate Customer placed the most number of orders in 2009 – 2012?
SELECT top 1
    Customer_Name,
    COUNT(Order_ID) AS [Number Of Orders]
FROM 
    [dbo].[KMS Sql Case Study]
WHERE 
    Customer_Segment = 'Corporate'
    AND Order_Date BETWEEN '2009-01-01' AND '2012-12-31'
GROUP BY 
    Customer_Name
ORDER BY 
    [Number Of Orders] DESC
-----Adam Hart is the coperate customer that placed the most number of orders in 2009-2012------


-----ANALYSIS 9 Which consumer customer was the most profitable one------

SELECT TOP 1 
    Customer_Name,
    SUM(Profit) AS [Total Profit]
FROM 
    [dbo].[KMS Sql Case Study]
WHERE 
    Customer_Segment = 'Consumer'
GROUP BY 
    Customer_Name
ORDER BY 
    [Total Profit] DESC
-----Emily Phan is the most profitable consumer customer-----

select * from [dbo].[KMS Sql Case Study]
-------ANALYSIS 10 Which customer returned items, and what segment do they belong to-------
select *from (
	select [Order_ID],Customer_Segment,Product_Sub_Category,Customer_Name 
	from [dbo].[KMS Sql Case Study] as Customer)
join (
select [Order_ID], [Status]
	from [dbo].[KMS Sql Case Study])[Order_Status] as Returned
on Customer.[Order_ID] = Returned.[Order_ID]
order by [customer_Name] asc)






