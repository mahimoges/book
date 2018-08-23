-- How to Use AS Statment 

Select * from payment limit 5;

Select customer_id AS Customer_Number
From payment;

Select customer_id, SUM(Amount) AS Total
from payment
group by customer_id;


-- Next topic is JOINS 

Select * from customer
limit 5;

Select * from payment limit 5;

Select 
customer.customer_id,customer.first_name,customer.last_name,customer.email,
payment.amount,payment.staff_id
From customer
INNER JOIN payment ON customer.customer_id = payment.customer_id;

-- Ineer Join with group by and Where clause.
Select 
customer.customer_id,customer.first_name,customer.last_name,customer.email,
payment.amount,payment.staff_id
From customer
INNER JOIN payment ON customer.customer_id = payment.customer_id
Order by customer.first_name;

--Where clause.
Select 
customer.customer_id,customer.first_name,customer.last_name,customer.email,
payment.amount,payment.staff_id
From customer
INNER JOIN payment ON customer.customer_id = payment.customer_id
Where first_name LIKE  'M%';

--More example on INNER JOIN
--as long as cloum is present on one table as unique you dont need to mentiond the colume name.

--example 1
select *from staff limit 5;

Select payment_id,amount,first_name,last_name
From payment
INNER JOIN staff ON payment.staff_id = staff.staff_id;

--example 2

Select * from  inventory limit 5;

Select store_id,title
from inventory 
inner join film ON inventory.film_id = film.film_id;

-- How many film with store id = 1

Select store_id,title
from inventory 
inner join film ON inventory.film_id = film.film_id
where store_id = 1;

-- with count
Select store_id,count(title)
from inventory 
inner join film ON inventory.film_id = film.film_id
where store_id = 1
group by store_id;


-- with AS 
Select store_id,title As movie
from inventory 
inner join film ON inventory.film_id = film.film_id
where store_id = 1

--real world queryes
-- Home copies of of film in each film in store number one.

Select title,count(title) AS copies_at_store
From inventory 
Inner Join film ON inventory.film_id = film.film_id
Where store_id = 1
Group by title
order by title;


-- Inner join with tables
Select * from film
Inner JOIN film_actor ON film.film_id = film_actor.film_id
order by film.film_id DESC;



--More Example of Outter Join

Select film.film_id,film.title,inventory_id
from film
Left Outer Join inventory ON inventory.film_id = film.film_id
Where inventory.film_id IS null;



--UNION Clause 

-- UNION will combine two set's of queres in to single set.
-- rules of UNION Both set queries must return same number of colums
-- rules number two set queries must have same data types

Select * from actor limit 5;

Select * from customer limit 5;

Select first_name,last_name
from actor
Union
Select first_name,last_name
From customer;

--Time Stamps

--You can use methematical expression such as +,-,*,/ for time calucation
-- You can exatact day or time from timestamp
Select payment_date from payment;

Select extract (day from payment_date) from payment;

Select customer_id,extract (day from payment_date) 
from payment
order by payment_date;

-- What it higest gross month in business
Select SUM(amount),extract (month from payment_date) AS Month
from payment
group by month
order by SUM(amount) DESC
limit 1;


--Methematical Functions
-- https://www.postgresql.org/docs/current/static/functions-math.html


Select customer_id + rental_id AS new_id
from payment;

Select ||/ customer_id  AS new_id
from payment;


Select abs (amount) As new_amount
from payment;


--String fuctions 
-- https://www.postgresql.org/docs/9.1/static/functions-string.html

Select * from customer limit 5;

Select first_name || ' '||last_name AS Full_name
From customer;


Select first_name,char_length(first_name) As length
from customer;


Select upper(email)
from customer;

Select lower(last_name)
from customer;


--Subquery 
--query within query

Select * from film limit 5;

-- find AVG rental rate of of all the movies and movies are higher than rental rate;
Select AVG(rental_rate)
from film;
-- Answer is 2.98

Select rental_rate 
from film
Where rental_rate > 2.98;

Select film_id,title,rental_rate
from film
Where rental_rate > (Select AVG (rental_rate) from film)
order by film_id ASC;

--SQL always execute subquery and then main query.

--Example List of film id that return between may-29 to may-30

Select * from rental limit 5;
Select * from inventory limit 5;

Select inventory.film_id
From rental
Inner Join inventory ON inventory.inventory_id = rental.inventory_id
where return_date Between '2005-05-29' And '2005-05-30';


--Find out the film title and film_id which is returned in these dates
Select film_id,title
from film
Where film_id IN 
	(Select inventory.film_id
	From rental
	Inner Join inventory ON inventory.inventory_id = rental.inventory_id
	where return_date Between '2005-05-29' And '2005-05-30'
	order by film_id ASC);



--Self Join
--Use self join when we want to combine two or more rows for same table
--Must use AS to identify the table 

Select * from customer limit 5;

--Example where first name of someone match the last name of someone.
Select a.first_name,a.last_name,b.first_name,b.last_name
from customer AS a,customer AS b
Where a.first_name = b.last_name;


--Use of join

Select a.first_name,a.last_name,b.first_name,b.last_name
from customer AS a
Join customer AS b
ON a.first_name = b.last_name;





/*

	1. How can you retrieve all the information from the cd.facilities table?
	2. You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?
	3. How can you produce a list of facilities that charge a fee to members?
	4. How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.
	5. How can you produce a list of all facilities with the word 'Tennis' in their name?
	6. How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
	7. How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question.
	8. How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.
	9. You'd like to get the signup date of your last member. How can you retrieve this information?
	10. Produce a count of the number of facilities that have a cost to guests of 10 or more.
	11. Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table consisting of facility id and slots, sorted by the number of slots.
	12. Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and total slots, sorted by facility id.
	13. How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.
	14. How can you produce a list of the start times for bookings by members named 'David Farrell'?

*/



















