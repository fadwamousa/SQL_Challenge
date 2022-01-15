DROP TABLE IF EXISTS runners;
CREATE TABLE runners (
  "runner_id" INTEGER,
  "registration_date" DATE
);
INSERT INTO runners
  ("runner_id", "registration_date")
VALUES
  (1, '2021-01-01'),
  (2, '2021-01-03'),
  (3, '2021-01-08'),
  (4, '2021-01-15');

  DROP TABLE IF EXISTS customer_orders;
CREATE TABLE customer_orders (
  "order_id" INTEGER,
  "customer_id" INTEGER,
  "pizza_id" INTEGER,
  "exclusions" VARCHAR(4) NULL,
  "extras" VARCHAR(4) NULL,
  "order_time" DATETIME
);

INSERT INTO customer_orders
  ("order_id", "customer_id", "pizza_id", "exclusions", "extras", "order_time")
VALUES
  ('1', '101', '1', '', '', '2020-01-01 18:05:02'),
  ('2', '101', '1', '', '', '2020-01-01 19:00:52'),
  ('3', '102', '1', '', '', '2020-01-02 23:51:23'),
  ('3', '102', '2', '', NULL, '2020-01-02 23:51:23'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '2', '4', '', '2020-01-04 13:23:46'),
  ('5', '104', '1', 'null', '1', '2020-01-08 21:00:29'),
  ('6', '101', '2', 'null', 'null', '2020-01-08 21:03:13'),
  ('7', '105', '2', 'null', '1', '2020-01-08 21:20:29'),
  ('8', '102', '1', 'null', 'null', '2020-01-09 23:54:33'),
  ('9', '103', '1', '4', '1, 5', '2020-01-10 11:22:59'),
  ('10', '104', '1', 'null', 'null', '2020-01-11 18:34:49'),
  ('10', '104', '1', '2, 6', '1, 4', '2020-01-11 18:34:49');



  DROP TABLE IF EXISTS runner_orders;
CREATE TABLE runner_orders (
  "order_id" INTEGER,
  "runner_id" INTEGER,
  "pickup_time" VARCHAR(19),
  "distance" VARCHAR(7),
  "duration" VARCHAR(10),
  "cancellation" VARCHAR(23) Null
);


INSERT INTO runner_orders
  ("order_id", "runner_id", "pickup_time", "distance", "duration", "cancellation")
VALUES
  ('1', '1', '2020-01-01 18:15:34', '20km', '32 minutes', ''),
  ('2', '1', '2020-01-01 19:10:54', '20km', '27 minutes', ''),
  ('3', '1', '2020-01-03 00:12:37', '13.4km', '20 mins', NULL),
  ('4', '2', '2020-01-04 13:53:03', '23.4', '40', NULL),
  ('5', '3', '2020-01-08 21:10:57', '10', '15', NULL),
  ('6', '3', 'null', 'null', 'null', 'Restaurant Cancellation'),
  ('7', '2', '2020-01-08 21:30:45', '25km', '25mins', 'null'),
  ('8', '2', '2020-01-10 00:15:02', '23.4 km', '15 minute', 'null'),
  ('9', '2', 'null', 'null', 'null', 'Customer Cancellation'),
  ('10', '1', '2020-01-11 18:50:20', '10km', '10minutes', 'null');


  DROP TABLE IF EXISTS pizza_names;
CREATE TABLE pizza_names (
  "pizza_id" INTEGER,
  "pizza_name" TEXT
);
INSERT INTO pizza_names
  ("pizza_id", "pizza_name")
VALUES
  (1, 'Meatlovers'),
  (2, 'Vegetarian');

  DROP TABLE IF EXISTS pizza_recipes;
CREATE TABLE pizza_recipes (
  "pizza_id" INTEGER,
  "toppings" TEXT
);
INSERT INTO pizza_recipes
  ("pizza_id", "toppings")
VALUES
  (1, '1, 2, 3, 4, 5, 6, 8, 10'),
  (2, '4, 6, 7, 9, 11, 12');


DROP TABLE IF EXISTS pizza_toppings;
CREATE TABLE pizza_toppings (
  "topping_id" INTEGER,
  "topping_name" TEXT
);
INSERT INTO pizza_toppings
  ("topping_id", "topping_name")
VALUES
  (1, 'Bacon'),
  (2, 'BBQ Sauce'),
  (3, 'Beef'),
  (4, 'Cheese'),
  (5, 'Chicken'),
  (6, 'Mushrooms'),
  (7, 'Onions'),
  (8, 'Pepperoni'),
  (9, 'Peppers'),
  (10, 'Salami'),
  (11, 'Tomatoes'),
  (12, 'Tomato Sauce');
  
  SELECT * 
  FROM customer_orders 
  
  SELECT * 
  FROM runner_orders 
  -------------------------------------------------------------------------------------------
  SELECT * 
  FROM runners 
  
  SELECT * 
  FROM pizza_names 
  
  SELECT * 
  FROM pizza_recipes 

  SELECT * 
  FROM pizza_toppings 
  
GO
with Customer_Orders_CTE as 
(
SELECT order_id, customer_id, pizza_id,
        CASE WHEN exclusions = '' THEN NULL 
		WHEN exclusions = 'null'  THEN NULL ELSE exclusions END as exclusions,
        CASE WHEN extras = ''     THEN NULL 
		WHEN extras = 'null'      THEN NULL ELSE extras END as extras,
        order_time
    FROM customer_orders
)
--select * from Customer_Orders_CTE
  -- 1. How many pizzas were ordered?

 -----select count(pizza_id) as Pizza_Items_count,order_id from Customer_Orders_CTE
  ----group by order_id

-----------------------------------------------------------------------------------------
 -- 2. How many unique customer orders were made?
      select count(DISTINCT order_id) as ORDERS_COUNTS,customer_id from Customer_Orders_CTE
      group by customer_id

GO
 WITH runner_orders_CTE AS 
(
    SELECT order_id, runner_id,
        CAST(CASE WHEN pickup_time = 'null' THEN NULL ELSE pickup_time END AS datetime) AS pickup_time,
        CASE WHEN distance = '' THEN NULL WHEN distance = 'null' THEN NULL ELSE distance END as distance,
        CASE WHEN duration = '' THEN NULL WHEN duration = 'null' THEN NULL ELSE duration END as duration,
        CASE WHEN cancellation = '' THEN NULL WHEN cancellation = 'null' THEN NULL ELSE cancellation END as cancellation
    FROM runner_orders
)


 -- 3. How many successful orders were delivered by each runner?
 select runner_id,count(distinct order_id) as Order_number
 from runner_orders_cte
 where cancellation is null
 group by runner_id

/*SELECT order_id,runner_id,pickup_time,
       CAST(REPLACE(distance,'Km','') as decimal) as distance,
	   cast(replace(replace(replace(duration, 'minutes', ''), 'mins', ''), 'minute', '') as int) as duration
	   
FROM runner_orders_CTE;*/
--------------------------------------------------------------------------------------------------
 --4. How many of each type of pizza was delivered?
 GO

  WITH runner_orders_CTE AS 
(
    SELECT order_id, runner_id,
        CAST(CASE WHEN pickup_time = 'null' THEN NULL ELSE pickup_time END AS datetime) AS pickup_time,
        CASE WHEN distance = '' THEN NULL WHEN distance = 'null' THEN NULL ELSE distance END as distance,
        CASE WHEN duration = '' THEN NULL WHEN duration = 'null' THEN NULL ELSE duration END as duration,
        CASE WHEN cancellation = '' THEN NULL WHEN cancellation = 'null' THEN NULL ELSE cancellation END as cancellation
    FROM runner_orders
) ,
 Customer_Orders_CTE as 
(
SELECT order_id, customer_id, pizza_id,
        CASE WHEN exclusions = '' THEN NULL 
		WHEN exclusions = 'null'  THEN NULL ELSE exclusions END as exclusions,
        CASE WHEN extras = ''     THEN NULL 
		WHEN extras = 'null'      THEN NULL ELSE extras END as extras,
        order_time
    FROM customer_orders
)
SELECT pizza_id, COUNT(c.order_id) AS pizza_delivered
 FROM Customer_Orders_CTE c
 LEFT JOIN runner_orders_CTE r
 ON c.order_id = r.order_id
 WHERE cancellation IS NULL
 GROUP BY pizza_id
 ------------------------------------------------------------------------
  --5. How many Vegetarian and Meatlovers were ordered by each customer?
  GO
  with Customer_Orders_CTE as 
(
SELECT order_id, customer_id, pizza_id,
        CASE WHEN exclusions = '' THEN NULL 
		WHEN exclusions = 'null'  THEN NULL ELSE exclusions END as exclusions,
        CASE WHEN extras = ''     THEN NULL 
		WHEN extras = 'null'      THEN NULL ELSE extras END as extras,
        order_time
    FROM customer_orders
)

  SELECT customer_id ,
         cast(pizza_name as varchar(125)) as PizzaName ,
         count(Customer_Orders_CTE.pizza_id) as Number_Pizza 
  FROM pizza_names inner join 
  Customer_Orders_CTE on Customer_Orders_CTE.pizza_id = pizza_names.pizza_id
  group by customer_id,cast(pizza_name as varchar(125))

  ------------------------------------------------------------------------
  -- 6. What was the maximum number of pizzas delivered in a single order?
  GO
    with Customer_Orders_CTE as 
(
SELECT order_id, customer_id, pizza_id,
        CASE WHEN exclusions = '' THEN NULL 
		WHEN exclusions = 'null'  THEN NULL ELSE exclusions END as exclusions,
        CASE WHEN extras = ''     THEN NULL 
		WHEN extras = 'null'      THEN NULL ELSE extras END as extras,
        order_time
    FROM customer_orders
),Number_of_Pizza as (
  select count(*) Number_Pizza ,order_id-- ,
         --DENSE_RANK() over(partition by Customer_Orders_CTE.order_id order by count(*) DESC) as DR
  from Customer_Orders_CTE
  group by Customer_Orders_CTE.order_id
  )
  select MAX(Number_Pizza) as the_max  from Number_of_Pizza
  ----------------------------------------------------------------------------------------
  -- 7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
  GO
    with Customer_Orders_CTE as 
(
SELECT order_id, customer_id, pizza_id,
        CASE WHEN exclusions = '' THEN NULL 
		WHEN exclusions = 'null'  THEN NULL ELSE exclusions END as exclusions,
        CASE WHEN extras = ''     THEN NULL 
		WHEN extras = 'null'      THEN NULL ELSE extras END as extras,
        order_time
    FROM customer_orders
)
select 
count(case when exclusions is NOT NULL and extras is NOT NULL THEN order_id ELSE NULL END ) as No_Change,
count(case when exclusions is null and extras is null then order_id else null end) as Change
FROM Customer_Orders_CTE


-- 8. How many pizzas were delivered that had both exclusions and extras?

GO
    with Customer_Orders_CTE as 
(
SELECT order_id, customer_id, pizza_id,
        CASE WHEN exclusions = '' THEN NULL 
		WHEN exclusions = 'null'  THEN NULL ELSE exclusions END as exclusions,
        CASE WHEN extras = ''     THEN NULL 
		WHEN extras = 'null'      THEN NULL ELSE extras END as extras,
        order_time
    FROM customer_orders
)
SELECT COUNT(CASE WHEN c.exclusions IS NOT NULL AND c.extras IS NOT NULL THEN c.order_id ELSE NULL END) AS both_change
FROM Customer_Orders_CTE c 

-- 9. What was the total volume of pizzas ordered for each hour of the day?

GO
    with Customer_Orders_CTE as 
(
SELECT order_id, customer_id, pizza_id,
        CASE WHEN exclusions = '' THEN NULL 
		WHEN exclusions = 'null'  THEN NULL ELSE exclusions END as exclusions,
        CASE WHEN extras = ''     THEN NULL 
		WHEN extras = 'null'      THEN NULL ELSE extras END as extras,
        order_time
    FROM customer_orders
)
select count(order_id) Numbers_Orders,datepart(hour,order_time) as Hour_date from Customer_Orders_CTE
group by datepart(hour,order_time)

-- 10. What was the volume of orders for each day of the week? 

GO
    with Customer_Orders_CTE as 
(
SELECT order_id, customer_id, pizza_id,
        CASE WHEN exclusions = '' THEN NULL 
		WHEN exclusions = 'null'  THEN NULL ELSE exclusions END as exclusions,
        CASE WHEN extras = ''     THEN NULL 
		WHEN extras = 'null'      THEN NULL ELSE extras END as extras,
        order_time
    FROM customer_orders
)
select count(order_id) Numbers_Orders,datepart(WEEKDAY,order_time) as Day_Week from Customer_Orders_CTE
group by datepart(WEEKDAY,order_time)
--------------------------------------------------------------------------------------------------------
-- 1. How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)

select * from runners

select count(runner_id) as Runner_count , DATEPART(WEEKDAY,registration_date) as Week_Day from runners
group by  DATEPART(WEEKDAY,registration_date)


-- 2. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?

SELECT ro.runner_id , AVG(ro.pickup_time - c.order_time) AS avg_difference  --Extract mins from both and subtract and then Took AVG
FROM customer_orders2 c
JOIN runner_orders2 ro
ON c.order_id = ro.order_id
WHERE ro.cancellation IS NULL 
GROUP BY 1




