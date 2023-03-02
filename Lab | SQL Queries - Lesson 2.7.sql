-- Lab | SQL Join (Part I)
-- In this lab, you will be using the Sakila database of movie rentals.

USE sakila;

-- Instructions

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT * FROM film_category;
SELECT * FROM category; #category_id

SELECT DISTINCT c.name, COUNT(f.film_id) AS tot_films
FROM category c JOIN film_category f #tables to join
ON c.category_id = f.category_id #columns to join
GROUP BY c.name
ORDER BY tot_films desc;


-- 2. Display the total amount rung up (?) by each staff member in August of 2005.
#rung up = total sales !

SELECT * FROM staff;
SELECT * FROM payment; #amount #staff_id

SELECT s.staff_id, COUNT(p.amount) AS total_amount
FROM staff s JOIN payment p
ON s.staff_id = p.staff_id
WHERE DATE_FORMAT(p.payment_date,'%Y-%m') = '2005-08'
GROUP BY s.staff_id
ORDER BY total_amount DESC;

-- 3. Which actor has appeared in the most films?
SELECT * FROM actor;
SELECT * FROM film_actor; #actor_id

SELECT DISTINCT actor.actor_id, actor.first_name, actor.last_name, COUNT(film_actor.film_id) AS appearances
FROM actor JOIN film_actor
ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY appearances
LIMIT 1;

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT * FROM customer LIMIT 10;
SELECT * FROM rental LIMIT 10; #customer_id. 

SELECT customer.customer_id, count(rental.rental_id) total_films_rented
FROM customer JOIN rental
ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id
ORDER BY total_films_rented desc
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT * FROM staff;
SELECT * FROM address; #addresss_id

SELECT staff.first_name, staff.last_name, address.address
FROM staff JOIN address
ON staff.address_id = address.address_id;

-- 6. List each film and the number of actors who are listed for that film.
SELECT * FROM film LIMIT 10;
SELECT * FROM film_actor; #film_id

SELECT film.title, COUNT(film_actor.actor_id) AS actors_listed
FROM film JOIN film_actor
ON film.film_id = film_actor.film_id
GROUP BY film.title
ORDER BY actors_listed desc;


-- 7. Using the tables payment and customer and the JOIN command,
# list the total paid by each customer.
# List the customers alphabetically by last name.

SELECT * FROM payment;
SELECT * FROM customer; #customer_id

SELECT customer.customer_id, sum(payment.amount) as tot_amount
FROM customer JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY tot_amount desc;

-- 8. List number of films per category.
SELECT * FROM film;
SELECT * FROM film_category; #film_id / category_id
SELECT * FROM category; #category_id

SELECT f.title, c.name AS cat_name.    #category_id from category not shown
FROM film f
JOIN film_category m ON f.film_id = m.film_id
JOIN category c ON m.category_id = c.category_id
ORDER BY cat_name;
