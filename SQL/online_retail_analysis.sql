create database online_retail;
use online_retail;
show tables;



-- view 1:
create view vw_customers as 
select * 
from online_retail_clean
where CustomerID is not null;


-- view 2:
create view vw_retail_sales as
select 
    InvoiceNo,
    StockCode,
    `Description`,
    Quantity,
    UnitPrice,
    InvoiceDate,
    CustomerID,
    Country,
    TotalPrice
from online_retail_clean;


-- Queries:  

-- Average Order Value:
select 
    sum(TotalPrice) / (select count(distinct InvoiceNo) from vw_retail_sales where CustomerID is not null) as AOV
from vw_retail_sales
where CustomerID is not null;


-- Monthly sales analyses:
create view vw_monthly_sales as 
select
	year(InvoiceDate) as year,
    month(InvoiceDate) as month,
    count(distinct CustomerID) as total_customers,
    count(distinct InvoiceNO) as total_orders,
    Round(sum(TotalPrice), 2) as total_revenue
    
from vw_retail_sales
where CustomerID is not null
group by 
	year(InvoiceDate),
    month(InvoiceDate)
order by year(InvoiceDate), month(InvoiceDate);


-- Top customers:
create view vw_top_customers as
select 
	CustomerID,
	count(distinct InvoiceNo) as total_orders,
    Round(sum(TotalPrice), 2) as total_spent
from vw_retail_sales
where CustomerID is not null
group by CustomerID;


select *
from vw_top_customers 
order by total_orders desc
limit 10;


-- Top Products:
create view vw_Top_Products as
select 
	`Description`,
	sum(Quantity) as total_quantity,
    round(sum(TotalPrice), 2) as total_revenue
from vw_retail_sales 
group by `Description`;
    
	
-- Country sales:
create view vw_country_sales as
select 
	Country,
	count(distinct CustomerID) as total_customers,
    count(distinct InvoiceNo) as total_orders,
    round(sum(TotalPrice), 2) as total_revenue
from vw_retail_sales
group by Country;


-- Daily sales:
select
    date(InvoiceDate) as order_date,
    round(sum(TotalPrice), 2) as total_revenue_per_day
from vw_retail_sales
group by date(InvoiceDate);


select
    date(InvoiceDate) as order_date,
    round(sum(TotalPrice), 2) as total_revenue_per_day
from vw_customers
group by date(InvoiceDate);


-- KPI:
create view vw_KPIs as
select 
	count(distinct CustomerID) as total_customers,
    count(distinct InvoiceNo) as total_orders,
    Round(sum(TotalPrice), 2) as total_revenue,
    Round(sum(TotalPrice) / count(distinct InvoiceNo), 2) as average_order_value
    
from vw_retail_sales
where CustomerID is not null;


-- Customer Segmentation:
create view vw_customer_segmentation as
select 
	CustomerID,
    Round(sum(TotalPrice), 2) as total_revenue,
    count(distinct InvoiceNo) as total_orders,
	
    case 
		when sum(TotalPrice) >= 1000 then 'High value'
        when sum(TotalPrice) >= 500 then 'Medium value'
        else 'Low value'
	end as customer_segment
    
from vw_customers
group by CustomerID;
        
        
        
        
show full tables where table_type = 'view'; 




