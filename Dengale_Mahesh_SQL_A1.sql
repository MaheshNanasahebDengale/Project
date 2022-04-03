--Dengale Mahesh SQL-1 Assignment

-- Q.1 Do we have actors in the actor table that share the full name and if yes display those shared names.
SELECT COUNT(DISTINCT first_name || last_name) from actor


--Q.2  Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.
SELECT customer_id,staff_id,amount FROM payment
where amount <= 110 AND staff_id = 2;

--Q.3 How many films begin with the letter J?
SELECT title FROM film
WHERE title like 'J%'

--Q.4 What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?
SELECT customer_id,first_name,address_id FROM customer
 WHERE first_name like 'E%' AND address_id < 500
 ORDER BY customer_id DESC;
 
 --Q.5 How many films have the word Truman somewhere in the title?
 SELECT COUNT(title) FROM film
 WHERE title like '%Truman%'

--Q.6 Display the total amount paid by all customers in the payment table.
SELECT SUM(amount) FROM payment

--Q.7 Display the total amount paid by each customer in the payment table.
SELECT customer_id , SUM(amount) FROM payment
GROUP BY customer_id;

--Q.8 What is the highest total_payment done.
SELECT SUM(amount) FROM payment
GROUP BY customer_id
Order BY SUM(amount) DESC LIMIT 1

--Q.9 Which customers have not rented any movies so far.
SELECT customer_id FROM customer
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM rental)

--Q.10 How many payment transactions were greater than $5.00?
SELECT COUNT(amount) FROM payment
WHERE amount >5