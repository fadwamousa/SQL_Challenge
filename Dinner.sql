  ---- 1. What is the total amount each customer spent at the restaurant?--

  select * from members

  select * from menu

  select * from sales


  select sum(menu.price) as Total_Amount , customer_id
  from menu inner join sales
  on menu.product_id = sales.product_id
  group by customer_id

  -------------------------------------------------------------------------

    -- 2. How many days has each customer visited the restaurant?--

 select customer_id , count(distinct order_date) as Days from sales
 group by customer_id
 ----------------------------------------------------------------------------------
  -- 3. What was the first item from the menu purchased by each customer?
  GO 
  WITH Items as (
  select product_name , customer_id , order_date
        , DENSE_RANK() over (partition by customer_id order by order_date asc) as DR
  from menu 
  inner join sales
  on sales.product_id = menu.product_id
  ) select product_name , customer_id , order_date from Items where DR = 1

  -- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

  select product_name , count(sales.order_date) as ItemsCount  from sales 
  inner join menu 
  on menu.product_id = sales.product_id
  group by product_name


  SELECT * FROM (
  select product_name , 
         --count(sales.product_id) as ItemsCount , 
         DENSE_RANK() over (ORDER BY count(sales.product_id) desc) as DR
  from sales 
  inner join menu 
  on menu.product_id = sales.product_id
    group by product_name) as X
  where DR = 1



  --------- Identifying how many times it was purchased by all the customers--------------------------

  select count(sales.product_id) as count_of_item_purchased,product_name from sales
  inner join menu
  on menu.product_id = sales.product_id
  group by product_name
  order by count_of_item_purchased DESC

   -- 5. Which item was the most popular for each customer?


   GO

   WITH Items AS (
   SELECT count(sales.product_id) as Items_Count, product_name
           ,
		  DENSE_RANK() OVER (order by count(sales.product_id) DESC) as DR
   FROM sales
   inner join menu
   on menu.product_id = sales.product_id
   GROUP BY customer_id,product_name
   )
   select DISTINCT *
   from Items
   where DR =1


   -- 6. Which item was purchased first by the customer after they became a member?

WITH first_order AS 
(
   select product_name,members.customer_id ,
   DENSE_RANK() over(partition by members.customer_id order by order_date asc) as DR
   from sales
   inner join menu on menu.product_id = sales.product_id
   inner join members
   on members.customer_id = sales.customer_id
   where order_date >= join_date 
   --group by members.customer_id
)
select * from first_order where DR = 1

-- 7. Which item was purchased just before the customer became a member?


WITH first_order AS 
(
   select product_name,members.customer_id ,
   DENSE_RANK() over(partition by members.customer_id order by order_date DESC) as DR
   from sales
   inner join menu on menu.product_id = sales.product_id
   inner join members
   on members.customer_id = sales.customer_id
   where order_date < join_date 

)
select * from first_order where DR = 1

       -- 8. What is the total items and amount spent for each member before they became a member?


	     select sum(menu.price) as Total_Amount , count(distinct sales.product_id) as Total_items , members.customer_id
		 from menu
		 inner join sales
		 on sales.product_id = menu.product_id
		 inner join members 
		 on members.customer_id = sales.customer_id
		 where order_date < join_date
		 group by members.customer_id



		




