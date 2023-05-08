 select  Distinct  state FROM sales.customers


 select  * 
 from sales.customers where state = 'CA'
 order by customer_id DESC;


 select  city ,count (*) from sales.customers
 where state = 'CA'
 group by city 
 order by city;


 select city ,count(*) from sales.customers 
 where state = 'TX'
 group by city
 having count(*) >10
 order by city;


 SELECT city, first_name ,last_name
 from sales.customers
 order by city Desc ,
 first_name ASC;

  SELECT city,state, first_name ,last_name
 from sales.customers
 order by state DESC;
 ;
SELECT first_name ,last_name
 from sales.customers
 order by LEN(first_name) ASC;

 select * from production.products;

 select product_name ,list_price 
 from production.products
 order by list_price
 offset  0 rows
 fetch next 10 rows only ;


select  top 10 product_name ,list_price from production.products
order by  list_price desc;

select  top 1 percent product_name ,list_price from production.products
order by  list_price desc;


 /*Using TOP WITH TIES to include rows that match the values in the last row*/

 select  top 4  with TIES  product_name ,list_price from production.products
order by  list_price DESC;

select distinct city, state from sales.customers;

select product_id,product_name,category_id
from production.products
where category_id =1;


select product_id,product_name,category_id,model_year
from production.products
where category_id =6 and model_year =2018;

select product_id,
product_name,
category_id,
model_year,
list_price
from production.products
where category_id =6 and model_year =2017
order by list_price desc;

select product_id,
product_name,
category_id,
model_year,
list_price
from production.products
where list_price >4000 OR model_year =2017;

select product_id,
product_name,
category_id,
model_year,
list_price
from production.products
where product_name  LIKE 'Su%';

select product_id,
product_name,
category_id,
model_year,
list_price
from production.products
where list_price between 3000 and 6000
order by list_price DESC

select product_id,
product_name,
category_id,
model_year,
list_price
from production.products
where list_price IN (5999.99,299.99,489.99);

select first_name , last_name, phone
From sales.customers
where phone IS NULL
order by first_name , last_name ;

select first_name , last_name, phone
From sales.customers
where phone IS NOT NULL
order by first_name , last_name ;


select * from production.products
Where list_price >400 AND brand_id =1;

select * from production.products
Where (list_price Between 400 and 500) AND model_year =2018;

select * from production.products
where (brand_id =8 OR brand_id= 9) AND list_price =1549.00;




select first_name + last_name AS fullName from sales.customers;

select category_id 'product_id' from production.categories;

select category_name 'product_name' 
from production.categories
order by category_name;

select product_name, category_id, list_price  from production.products
order by list_price;

select * from production.categories;

select product_name, category_name, list_price  from production.products p
inner join production.categories c on p.category_id = c.category_id
order by product_name DESC;
 
select   product_name , order_id from production.products p
left join sales.order_items o on p.product_id = o.product_id
where order_id IS null;
order by order_id;
select* from sales.order_items;
select * from sales.orders


select product_name, category_name,brand_name, list_price  from production.products p
inner join production.categories c on p.category_id = c.category_id
inner join production.brands b on  b.brand_id = p.brand_id;

select * from production.products;

Select*  from sales.order_items;
select* from sales.orders;

select  p.product_name,o.order_id , i.item_id ,o.order_date
from production.products p
left join sales.order_items i on  i.product_id = p.product_id

left join sales.orders o
on o.order_id = i.order_id
order by order_id;

select product_name,order_id 
from production.products p 
left join sales.order_items i On  i.product_id = p.product_id
 where order_id =100;



 select product_name ,order_id from sales.order_items i 
 right join production.products p on i.product_id = p.product_id
 where order_id = 50
 order by order_id;

select  product_id, product_name ,store_id , 0 As Quantity from production.products
cross join sales.stores
order by store_id,
         product_name;

select * from sales.stores;

select customer_id, year(order_date) order_year from sales.orders
where customer_id IN (1,2)
order by customer_id;

select customer_id, year(order_date) order_year from sales.orders
where customer_id IN (1,2)
group by customer_id,year(order_date)
order by customer_id;


select* from sales.orders;
 
select customer_id,year(order_date) order_year, count(order_id) orderplaced from sales.orders
where customer_id  in(1,2)
group by customer_id, year(order_date)
order by customer_id;

select * from production.products;

select* from production.brands;

select brand_name , Max(list_price) Max_price , Min(list_price) Min_price from production.products p
INNER JOIN production.brands b on b.brand_id = p.brand_id
where model_year =2018
group by brand_name
order by brand_name;

select brand_name , Avg(list_price) AvgPrice from production.products p
INNER JOIN production.brands b on b.brand_id = p.brand_id
where model_year =2018
group by brand_name
order by brand_name;





