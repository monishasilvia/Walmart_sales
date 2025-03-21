use walmart_db;
select count(*) from walmart;
select * from walmart limit 50;

/* Business Problem Q1: Find different payment methods, number of transactions
and quantity sold by payment method*/
select payment_method ,count(*),sum(quantity) as no_of_quantity
from walmart 
group by payment_method;

Select count(distinct branch) from walmart;

-- Q2: Identify the highest-rated category in each branch
-- Display the branch, category, and avg rating

select * from
(select branch , category ,avg(rating) as avg_rating,
rank() over(partition by branch order by avg(rating) desc) as rn
from walmart
group by branch,category)ranked
where rn =1;

select * from walmart limit 10;
-- Q3: Identify the busiest day for each branch based on the number of transactions
select date from walmart;

ALTER TABLE walmart MODIFY date DATE;

select * from (SELECT branch,dayname(STR_TO_DATE(date,'%d-%m-%Y'))as day_name,count(*) as no_of_transactions,
rank() over(partition by branch order by count(*) desc) as rn
from walmart
group by branch,day_name) as busy
where rn =1 ;

select * from walmart limit 10;
-- Q4.Calculate the total quantity of items sold per payment method

select sum(quantity),payment_method from walmart 
group by payment_method;

--  Q5: Determine the average, minimum, and maximum rating of categories for each city

Select avg(rating),min(rating),max(rating) ,city,category
from walmart 
group by city,category;

-- -- Q6: Calculate the total profit for each category

select sum(unit_price * quantity * profit_margin) as total_profit,category from walmart
group by category
order by total_profit desc;

-- q7 :Determine the most common payment method for each branch

with cte as 
(select payment_method,branch,count(*) ,
rank() over(partition by branch order by count(*) Desc) as rnk
from walmart 
group by branch, payment_method) 
select * from cte where rnk = 1;

-- Q8: Categorize sales into Morning, Afternoon, and Evening shifts
SELECT
    branch,
    case
    when hour(TIME(time)) < 12 THEN 'Morning'
    when hour(TIME(TIME)) Between 12 and 17 then 'afternoon'
    else 'evening'
    end as shifts,
    count(*) as no_0f_invoices
    from walmart
    group by branch,shifts
    order by branch,shifts desc;
    
/*Q9: Identify the 5 branches with the highest revenue decrease ratio from last year to current
year (e.g., 2022 to 2023)*/
    
WITH revenue_2022 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM walmart
    WHERE YEAR(STR_TO_DATE(date, '%d-%m-%Y')) = 2022
    GROUP BY branch
),
revenue_2023 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM walmart
    WHERE YEAR(STR_TO_DATE(date, '%d-%m-%Y')) = 2023
    GROUP BY branch
)
SELECT 
    r2022.branch,
    r2022.revenue AS last_year_revenue,
    r2023.revenue AS current_year_revenue,
    ROUND(((r2022.revenue - r2023.revenue) / r2022.revenue) * 100, 2) AS revenue_decrease_ratio
FROM revenue_2022 AS r2022
JOIN revenue_2023 AS r2023 ON r2022.branch = r2023.branch
WHERE r2022.revenue > r2023.revenue
ORDER BY revenue_decrease_ratio DESC
LIMIT 5;







