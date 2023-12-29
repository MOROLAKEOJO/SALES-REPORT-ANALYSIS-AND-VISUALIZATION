select * from `sale record`;
use `sale record`;

-- 1 What is our best selling product? 
create view `best selling product` as
select product, total_revenue
from(SELECT product, (price * quantity) total_revenue 
from `sale record`
group by product, TOTAL_REVENUE) as subquery
order by total_revenue desc;


 -- 2 What is our total revenue
 create view `total revenue` as
  SELECT  sum(price * quantity)as revenue from `sale record`;


--  3) What is the revenue breakdown by payment method? */
create view `payment method by revenue` as
select `payment method`, sum(price* quantity) total_revenue
from `sale record`
group by `payment method`;


-- 4) What payment method the customers prefer
create view `most preferred payment method` as
select `Payment Method`, (count(`payment method`)) count
from `sale record`
group by `payment method`
order by (count(`payment method`)) desc;


-- 5) Display the trend of sale over days of the week
create view `trends of sales over the days of the week` as
select dayname(date),product, sum(price * quantity) total_revenue
from `sale record`
group by dayname(date), product;


-- 6) What month has the highest revenue
create view `Months with revenues generated` as
select `date`, total_revenue
from(SELECT monthname(`date`) `date`, sum(price * quantity) as total_revenue 
from `sale record`
group by monthname(`date`)) as subquery
order by total_revenue desc;


-- 7) What is the breakdown of revenue by manager
create view `Revenue by Manager` as
select distinct(manager), total_revenue
from (select regexp_replace(manager, '\s+', ' ') manager, sum(price * quantity) total_revenue
from `sale record`
group by manager ) subquery
order by total_revenue desc;


use `sale record`;
-- 8 manager by city
create view `manager by city` as
SELECT city, count(manager) count 
from `sale record`
group by city ;


-- 9 MOST EXPENSIVE PRODUCT
create view `five most expensive productss` as
SELECT distinct(product), PRICE
from `sale record`
order by 2 desc
limit 0,5;

