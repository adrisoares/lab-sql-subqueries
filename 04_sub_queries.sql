/* Challenge_Write SQL queries to perform the following tasks using the Sakila database:

1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system */
SELECT COUNT(inventory_id) AS copies_of_movie
FROM sakila.inventory
INNER JOIN (
			SELECT film_id, title
			FROM sakila.film
			WHERE title LIKE "%Hunchback Impossible%") AS movie
ON sakila.inventory.film_id = movie.film_id;    ## If it could be better, YES! But not today!

/* 2. List all films whose length is longer than the average length of all the films in the Sakila database*/
SELECT title, description, length
FROM sakila.film 
WHERE length > (SELECT ROUND(AVG(length)) FROM sakila.film);

/* 3. Use a subquery to display all actors who appear in the film "Alone Trip" */
SELECT CONCAT(first_name," ", last_name) AS full_name
FROM sakila.actor
INNER JOIN (
			SELECT actor_id, film_id
			FROM sakila.film_actor
			WHERE film_id = (SELECT film_id
							FROM sakila.film
							WHERE title LIKE "%alone trip%")) AS ids
ON sakila.actor.actor_id = ids.actor_id;


/* BONUS: #### GOOD FOR A RAINY DAY, BUT NOT TODAY! ######

Sales have been lagging among young families, and you want to target family movies for a promotion.
Identify all movies categorized as family films.*/




/* Retrieve the name and email of customers from Canada using both subqueries and joins. To use joins, you will need to identify
the relevant tables and their primary and foreign keys.*/




/* Determine which films were starred by the most prolific actor in the Sakila database. A prolific actor is defined as 
the actor who has acted in the most number of films. First, you will need to find the most prolific actor and then use that 
actor_id to find the different films that he or she starred in.*/




/* Find the films rented by the most profitable customer in the Sakila database. You can use the customer and payment tables 
to find the most profitable customer, i.e., the customer who has made the largest sum of payments.*/




/* Retrieve the client_id and the total_amount_spent of those clients who spent more than the average of 
the total_amount spent by each client. You can use subqueries to accomplish this */