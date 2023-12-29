select * from `sale record`;
use `sale record`;

-- 1 What is our best selling product? 
create view `best selling products` as
SELECT  (price * quantity) revenue, product from `sale record`
order by (price * quantity) desc;

 -- 2 What is our total revenue?
 create view `total revenue` as
  SELECT  sum(price * quantity)as revenue from `sale record`;

--  3) What is the revenue breakdown by payment method? */
create view `payment method by revenue` as
select `payment method`, sum(price* quantity) revenue
from `sale record`
group by `payment method`;

-- 4) What payment method the customers prefer
create view `most preferred payment methods` as 
select (count(`payment method`)) numbers, `Payment Method`
from `sale record`
group by `payment method` 
order by (count(`payment method`)) desc;

-- 5) Display the trend of sale over days of the week
create view `trend of sales over the days of the week` as 
select dayname(date), sum(price * quantity)
from `sale record`
group by dayname(date);

-- 6) What month has the highest revenue
create view `Month with revenues` as
SELECT monthname(date), (price * quantity) as revenue from `sale record`
order by (price * quantity) desc;

-- 7) What is the breakdown of revenue by manager
create view `Revenue by Manager` as
select distinct(`manager`), sum(price* quantity) revenue
from `sale record`
group by `manager`;


use `sale record`;
-- 8 manager by city
create view `manager by city` as
SELECT  distinct( trim(replace(manager, "  "," "))) manager, city
 from `sale record`;


-- 9 MOST EXPENSIVE PRODUCT
create view `five most expensive productss` as
SELECT product, PRICE
from `sale record`
order by 2 desc
limit 0,5;

