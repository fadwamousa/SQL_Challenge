DROP TABLE IF EXISTS plans;
CREATE TABLE plans (
  plan_id INTEGER,
  plan_name VARCHAR(13),
  price DECIMAL(5,2)
);

INSERT INTO plans
  (plan_id, plan_name, price)
VALUES
  ('0', 'trial', '0'),
  ('1', 'basic monthly', '9.90'),
  ('2', 'pro monthly', '19.90'),
  ('3', 'pro annual', '199'),
  ('4', 'churn', null);


DROP TABLE IF EXISTS subscriptions;
CREATE TABLE subscriptions (
  customer_id INTEGER,
  plan_id INTEGER,
  start_date DATE
);


 select * from subscriptions
 INSERT INTO subscriptions
  (customer_id, plan_id, start_date)
VALUES
  ('1', '0', '2020-08-01'),
  ('1', '1', '2020-08-08'),
  ('2', '0', '2020-09-20'),
  ('2', '3', '2020-09-27'),
  ('3', '0', '2020-01-13'),
  ('3', '1', '2020-01-20'),
  ('4', '0', '2020-01-17'),
  ('4', '1', '2020-01-24'),
  ('4', '4', '2020-04-21'),
  ('5', '0', '2020-08-03'),
  ('5', '1', '2020-08-10'),
  ('6', '0', '2020-12-23'),
  ('6', '1', '2020-12-30'),
  ('6', '4', '2021-02-26'),
  ('7', '0', '2020-02-05'),
  ('7', '1', '2020-02-12'),
  ('7', '2', '2020-05-22'),
  ('8', '0', '2020-06-11'),
  ('8', '1', '2020-06-18'),
  ('8', '2', '2020-08-03'),
  ('9', '0', '2020-12-07'),
  ('9', '3', '2020-12-14'),
  ('10', '0', '2020-09-19'),
  ('10', '2', '2020-09-26'),
  ('11', '0', '2020-11-19'),
  ('11', '4', '2020-11-26'),
  ('12', '0', '2020-09-22'),
  ('12', '1', '2020-09-29'),
  ('13', '0', '2020-12-15'),
  ('13', '1', '2020-12-22'),
  ('13', '2', '2021-03-29'),
  ('14', '0', '2020-09-22'),
  ('14', '1', '2020-09-29'),
  ('15', '0', '2020-03-17'),
  ('15', '2', '2020-03-24'),
  ('15', '4', '2020-04-29'),
  ('16', '0', '2020-05-31'),
  ('16', '1', '2020-06-07'),
  ('16', '3', '2020-10-21'),
  ('17', '0', '2020-07-27'),
  ('17', '1', '2020-08-03'),
  ('17', '3', '2020-12-11'),
  ('18', '0', '2020-07-06'),
  ('18', '2', '2020-07-13'),
  ('19', '0', '2020-06-22'),
  ('19', '2', '2020-06-29'),
  ('19', '3', '2020-08-29'),
  ('20', '0', '2020-04-08'),
  ('20', '1', '2020-04-15'),
  ('20', '3', '2020-06-05'),
  ('21', '0', '2020-02-04'),
  ('21', '1', '2020-02-11'),
  ('21', '2', '2020-06-03'),
  ('21', '4', '2020-09-27'),
  ('22', '0', '2020-01-10'),
  ('22', '2', '2020-01-17'),
  ('23', '0', '2020-05-13'),
  ('23', '3', '2020-05-20'),
  ('24', '0', '2020-11-10'),
  ('24', '2', '2020-11-17'),
  ('24', '3', '2021-04-17'),
  ('25', '0', '2020-05-10'),
  ('25', '1', '2020-05-17'),
  ('25', '2', '2020-06-16'),
  ('26', '0', '2020-12-08'),
  ('26', '2', '2020-12-15'),
  ('27', '0', '2020-08-24'),
  ('27', '2', '2020-08-31'),
  ('28', '0', '2020-06-30'),
  ('28', '3', '2020-07-07'),
  ('29', '0', '2020-01-23'),
  ('29', '2', '2020-01-30'),
  ('30', '0', '2020-04-29'),
  ('30', '1', '2020-05-06'),
  ('31', '0', '2020-06-22'),
  ('31', '2', '2020-06-29'),
  ('31', '3', '2020-11-29'),
  ('32', '0', '2020-06-12'),
  ('32', '1', '2020-06-19'),
  ('32', '2', '2020-07-18'),
  ('33', '0', '2020-09-03'),
  ('33', '2', '2020-09-10'),
  ('33', '4', '2021-02-05'),
  ('34', '0', '2020-12-20'),
  ('34', '1', '2020-12-27'),
  ('34', '2', '2021-03-26'),
  ('35', '0', '2020-09-03'),
  ('35', '2', '2020-09-10'),
  ('36', '0', '2020-02-25'),
  ('36', '2', '2020-03-03'),
  ('37', '0', '2020-08-05'),
  ('37', '1', '2020-08-12'),
  ('37', '2', '2020-11-11'),
  ('38', '0', '2020-10-02'),
  ('38', '2', '2020-10-09'),
  ('38', '3', '2020-11-09'),
  ('39', '0', '2020-05-28'),
  ('39', '1', '2020-06-04'),
  ('39', '2', '2020-08-25'),
  ('39', '4', '2020-09-10'),
  ('40', '0', '2020-01-22'),
  ('40', '1', '2020-01-29'),
  ('40', '2', '2020-03-25'),
  ('41', '0', '2020-05-16'),
  ('41', '2', '2020-05-23'),
  ('42', '0', '2020-10-27'),
  ('42', '1', '2020-11-03'),
  ('42', '2', '2021-04-28'),
  ('43', '0', '2020-08-13'),
  ('43', '1', '2020-08-20'),
  ('43', '2', '2020-12-18'),
  ('44', '0', '2020-03-17'),
  ('44', '3', '2020-03-24'),
  ('45', '0', '2020-02-11'),
  ('45', '1', '2020-02-18'),
  ('45', '2', '2020-08-12'),
  ('46', '0', '2020-04-19'),
  ('46', '1', '2020-04-26'),
  ('46', '2', '2020-07-06'),
  ('46', '3', '2020-08-06'),
  ('47', '0', '2020-06-06'),
  ('47', '1', '2020-06-13'),
  ('47', '3', '2020-10-26'),
  ('48', '0', '2020-01-11'),
  ('48', '1', '2020-01-18'),
  ('48', '4', '2020-06-01'),
  ('49', '0', '2020-04-24'),
  ('49', '2', '2020-05-01'),
  ('49', '3', '2020-08-01'),
  ('50', '0', '2020-07-21'),
  ('50', '2', '2020-07-28'),
  ('51', '0', '2020-01-19'),
  ('51', '1', '2020-01-26'),
  ('51', '3', '2020-03-09'),
  ('51', '4', '2021-03-09'),
  ('52', '0', '2020-05-31'),
  ('52', '1', '2020-06-07'),
  ('52', '4', '2020-07-05'),
  ('53', '0', '2020-01-18'),
  ('53', '1', '2020-01-25'),
  ('54', '0', '2020-05-23'),
  ('54', '2', '2020-05-30'),
  ('55', '0', '2020-10-22'),
  ('55', '1', '2020-10-29'),
  ('55', '3', '2021-03-01'),
  ('56', '0', '2020-01-03'),
  ('56', '3', '2020-01-10'),
  ('57', '0', '2020-03-03'),
  ('57', '2', '2020-03-10'),
  ('58', '0', '2020-07-04'),
  ('58', '1', '2020-07-11'),
  ('58', '3', '2020-09-24'),
  ('59', '0', '2020-10-30'),
  ('59', '1', '2020-11-06'),
  ('59', '4', '2021-04-29'),
  ('60', '0', '2020-06-17'),
  ('60', '1', '2020-06-24'),
  ('61', '0', '2020-08-31'),
  ('61', '1', '2020-09-07'),
  ('61', '3', '2021-02-13'),
  ('62', '0', '2020-10-12'),
  ('62', '1', '2020-10-19'),
  ('62', '2', '2021-01-02'),
  ('62', '4', '2021-02-23'),
  ('63', '0', '2020-05-28'),
  ('63', '1', '2020-06-04'),
  ('63', '4', '2020-06-18'),
  ('64', '0', '2020-03-08'),
  ('64', '1', '2020-03-15'),
  ('64', '2', '2020-04-03'),
  ('64', '4', '2020-04-27'),
  ('65', '0', '2020-05-12'),
  ('65', '1', '2020-05-19'),
  ('65', '2', '2020-10-09'),
  ('66', '0', '2020-07-30'),
  ('66', '1', '2020-08-06'),
  ('66', '3', '2020-10-04'),
  ('67', '0', '2020-08-14'),
  ('67', '2', '2020-08-21'),
  ('68', '0', '2020-04-10'),
  ('68', '3', '2020-04-17'),
  ('69', '0', '2020-03-07'),
  ('69', '1', '2020-03-14'),
  ('69', '2', '2020-04-14');

  SELECT *
  FROM plans 
  
  SELECT * 
  FROM subscriptions 

    -- How many customers has Foodie-Fi ever had?
	SELECT COUNT(distinct customer_id) As Total_Customers
    FROM subscriptions s

	
  SELECT datepart(month, start_date) as Month_Date,
 count(CASE WHEN plan_id = 0 THEN plan_id ELSE NULL END) AS count_of_trial
 FROM subscriptions
 GROUP BY datepart(month, start_date)
 ORDER BY 1

 select count(DISTINCT case when year(start_date) = 2020 THEN customer_id ELSE NULL END) as '2020',
        count(DISTINCT case when year(start_date) = 2021 THEN customer_id ELSE NULL END) as '2021'
 from subscriptions

-- What is the customer count and percentage of customers who have 
-- churned rounded to 1 decimal place?
go
WITH CTE AS 
(
SELECT COUNT(distinct s.customer_id) AS total_customer_count,
COUNT(distinct CASE WHEN p.plan_id = 4 THEN customer_id ELSE NULL END) AS churned_count
FROM subscriptions s 
LEFT JOIN plans p
ON s.plan_id = p.plan_id
) 
SELECT *, 
ROUND(CAST(CTE.churned_count as numeric)/ CAST(CTE.total_customer_count as numeric) * 100,1) 
AS percentage
FROM CTE 

   --------------------------------------------------------------------------------------------
   


