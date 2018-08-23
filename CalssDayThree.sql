--Having claous 

Select * from payment limit 5;

Select customer_id, SUM (amount)
From payment
Group by customer_id
HAVING SUM(amount) > 150;



select * from customer;

-- Find how many customer Id's values are more then 200;

Select store_id, count (customer_id) AS Customer_Namuber
from customer 
group by store_id
having Count (customer_id) > 200;

-- Example of Where and having in sigle query.
Select * from film;

Select rating, Round (AVG (rental_rate),2)
from film
Where rating IN ('R','PG','G')
Group by rating
Having AVG(rental_rate) >1;


-- We want to proficde platinum memebership to customer who has more then 
-- 40 transactions 

Select customer_id, count (amount)
from payment
group by customer_id
having count(amount) > 40;

Select * from payment
where customer_id = 144;

Select * from rental;


-- Film table group by = how many movies rating 
-- has AVG rental_duration more then 5 days

Select * from film;

Select rating, Round (AVG(rental_duration),2)
from film
group by rating
having AVG(rental_duration) > 5;

--1. Return the customer IDs of customers who have spent at least $110 
--with the staff member who has an ID of 2.

SELECT customer_id,SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 110;


--2.How many films begin with the letter J?

Select count(*)
from film
Where title LIKE 'J%';

--3. What customer has the highest customer ID number 
-- whose name starts with an 'E' and has an address ID lower than 500?

Select customer_id,first_name,last_name
from customer
Where first_name LIKE 'E%'
And address_id < 500
order by customer_id DESC
limit 1;