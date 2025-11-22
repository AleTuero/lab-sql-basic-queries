#Check

USE sakila;

SHOW FULL TABLES;

SELECT count(*) FROM film;

SELECT COUNT(*) FROM film_text;

# Display all available tables in the Sakila database.
SHOW FULL TABLES;

# Retrieve all the data from the tables actor, film and customer.
SELECT * FROM actor, film, customer;

/*Retrieve the following columns from their respective tables:
	- 3.1 Titles of all films from the `film` table
	- 3.2 List of languages used in films, with the column aliased as `language` from the `language` table
	- 3.3 List of first names of all employees from the `staff` table*/

SELECT title FROM film;
SELECT f.title, l.name as language
FROM sakila.film f inner join sakila.language l on f.language_id = l.language_id;

SELECT first_name FROM staff;

# Retrieve unique release years.
SELECT distinct release_year FROM film;

/* Counting records for database insights:

5.1 Determine the number of stores that the company has.
5.2 Determine the number of employees that the company has.
5.3 Determine how many films are available for rent and how many have been rented.
5.4 Determine the number of distinct last names of the actors in the database.*/

SELECT count(*) FROM store;

SELECT count(*) FROM staff;

SELECT
    (SELECT COUNT(*) 
     FROM inventory)                      AS films_available_for_rent,
    (SELECT COUNT(DISTINCT inventory_id)  
     FROM rental)                         AS films_rented;
     
SELECT count(distinct last_name) FROM actor;

# Retrieve the 10 longest films.
SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;

/*Use filtering techniques in order to:

Retrieve all actors with the first name "SCARLETT".*/

SELECT * 
FROM actor
WHERE first_name  = "SCARLETT";

/*7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.*/

/* 7.2 Hint: use LIKE operator. More information here.
7.3 Determine the number of films that include Behind the Scenes content*/

SELECT * 
FROM film
WHERE title  like '%ARMAGEDDON%' AND length > 100;

SELECT COUNT(*)
FROM film
WHERE special_features LIKE '%Behind the Scenes%';
