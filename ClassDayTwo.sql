
-- ASC and DESC example

Select * from customer;

Select * from customer
order by customer_id ASC;

Select * from customer
order by first_name DESC, customer_id ASC;

-- More example for Oreder by

Select * from film;

Select film_id, rental_rate, title 
from film
order by title ASC;


-- find out title by film_id?
Select film_id, title
From film
order by film_id DESC;

-- Question
-- get the customer id numbers form highesdt payment amount only 10 rows

select * from payment;

Select customer_id,amount
From payment
Order by amount DESC
limit 10;


select * from film;

select title, film_id,rental_rate 
From film
Order by film_id <= 10
limit 5;


---   Using Between, IN, and LIKE

Select * from payment 
Limit 5;

Select customer_id,amount
From payment 
Where amount Between 3 And 7;

Select customer_id,amount
From payment 
Where amount not Between 3 And 7;

Select amount, payment_date,customer_id,amount
from payment
where customer_id between 341 and 343 ;


-- IN key word 

Select * from customer limit 5;

Select * from customer
Where first_name IN ('Mary','Linda','Barbara','xay');

Select * from rental;

-- find the customer_id,renatl-id and rental date where customeer id 1 & 2
-- filter them in rental-date desc order


Select customer_id,rental_id,rental_date
from rental
where customer_id not IN (1,2)
Order by rental_date Desc;

Select * from payment
Where amount IN (7.99,2.99) 
And rental_id Not IN (2,1);


-- LIKE useing 

Select * from customer;

Select first_name,last_name
from customer
Where first_name not LIKE 'P%';

Select first_name,last_name
from customer
Where last_name LIKE 'M%';


Select first_name,last_name
from customer
Where last_name not LIKE '%er%';


Select first_name,last_name
From customer
where first_name like '__an%';


--How many payment trnascation are gretere then 5 $

Select count (amount)
from payment
Where amount > 5;


-- Hom many actore have first names ster with P
--table actor 

Select * from address;

--How many unique disctisct our custome form 

Select count (distinct (district))
from address;

Select  distinct district
from address;


--How many film are rated R and replacement cosut is 5 and 15;
-- table film;

Select count (*)
from film
Where rating = 'R'
And replacement_cost between 5 and 15;

--How many film has Truman in there title.
-- film table

Select * from film
Where title Like '%Truman%' ;

--Topic to learn next 
-- MIN,MAX,AVG,SUM

Select count (*) from payment;

Select AVG(amount) from payment;
Select MIN(amount) from payment;
Select MAX(amount) from payment;
Select SUM(amount) from payment;

Select AVG(amount) from payment;

Select Round (AVG(amount),2)
From payment;

--Let's Use GROUP BY

Select * from payment limit 5;

Select staff_id
From payment
Group by staff_id;

Select staff_id, SUM(amount)
from payment
Group by staff_id;

Select staff_id, Round (Avg(amount), 3)
from payment
Group by staff_id;

--Find out how customer id who spend highst money by DESC order

Select customer_id , SUM(amount)
From payment
Group by customer_id
Order by SUM(amount) DESC;


Select * from payment;

--We want to give bonus to staff member who sales hight sales.


Select staff_id, SUM(amount)
From payment
Group by staff_id;



-- we want to know avg moive replacement cost and total by rating.
--table film.

select * from film;

Select rating, AVG(replacement_cost),SUM(replacement_cost)
from film
group by rating;


-- 4. We want to send the money for top five customer who paid highest with customer IDs
-- Payment table
-- find customer id who spend highest amount with us

Select customer_id,SUM(amount)
from payment
group by customer_id
order by SUM(amount) DESC
limit 5;









