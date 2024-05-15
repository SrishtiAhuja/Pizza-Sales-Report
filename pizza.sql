create database pizza;
use pizza;

select * from p;
select sum(total_price) as total_revenue from p;
select  (sum(total_price)/ count( distinct (order_id))) as average_order from p;
select sum(quantity) as total_pSold from p;
select count(distinct order_id) as total_orders from p;
select cast(sum(quantity)/ count(distinct order_id)as decimal (10,2)) as avg_p from p;
SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS day_name, COUNT(DISTINCT order_id) AS total_orders
FROM p
GROUP BY DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y'));
SELECT HOUR(STR_TO_DATE(order_time, '%H:%i:%s')) as hours, count(distinct order_id) as total_orders
 FROM p
 group by HOUR(STR_TO_DATE(order_time, '%H:%i:%s')) order by hours;
 select sum(quantity) from p;
 select pizza_category, cast((sum(total_price)/(select sum(total_price) from p where month(str_to_date(order_date,'%d-%m-%Y'))=01 ))*100 as decimal (10,2)) as percentage_sales from p
 where month(str_to_date(order_date,'%d-%m-%Y'))=01 
 group by pizza_category;
select pizza_size, cast((sum(total_price)/(select sum(total_price) from p )*100) as decimal (10,2)) as percentage_sales
 from p where QUARTER(str_to_date(order_date,'%d-%m-%Y'))=1
 group by pizza_size;
 select pizza_category, sum(quantity) from p
 group by pizza_category;
select pizza_name, sum(quantity) from p
group by pizza_name order by sum(quantity) desc
limit 5;
select pizza_name, sum(quantity) from p
group by pizza_name order by sum(quantity) asc
limit 5;
