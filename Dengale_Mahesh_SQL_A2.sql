-- Dengale_Mahesh_SQl-2_Assignment

-- Q.1. My partner and I want to come by each of the stores in person and
   --meet the managers. Please send over the managers’ names at each store, with the full address of each property (street address, district, city, and country).
select staff.first_name,staff.last_name,address.address,address.district
from address
 inner join staff on address.address_id= staff.staff_id 
 inner join country on country.last_update=address.last_update;
 
 --Q.2 Showing Inventory
 select store_id,inventory_id, title,rating,rental_rate,replacement_cost,film.film_id from film
 inner join inventory on film.film_id=inventory.film_id
  order by inventory_id  limit  10;
  
  --Q.3 From the same list of films you just pulled, please roll that data up and provide a summary level overview of your inventory. We would like to know how many inventory items you have with each rating at each store.
  select  inventory.store_id,rating,count(store_id) from film 
  inner join   inventory on film.film_id=inventory.film_id
  group by rating, inventory.store_id
  order by store_id limit 10;
  
  -- Q.4. Similarly, we want to understand how diversified the inventory is in terms of replacement cost. We want to see how big of a hit it would be if a certain category of film became unpopular at a certain store. We would like to see the number of films, as well as the average replacement cost, and total replacement cost, sliced by store and film category.
  
  select inventory.store_id,category.name ,title,avg(replacement_cost) from film
 left join category on category.last_update=film.last_update
 left join inventory on inventory.film_id=film.film_id
 group by inventory.store_id,category.name, title
  
  
  --Q.5. We want to make sure you folks have a good handle on who your customers are. Please provide a list of all customer names, which store they go to, whether or not they are currently active, and their full addresses street address, city, and country.
 select first_name,last_name,store_id,active,address,city,country from customer
 left join address on address.address_id=customer.address_id
 left join country on country.last_update=customer.last_update
  left join city on city.last_update=customer.last_update
 
-- Q.6. We would like to understand how much your customers are spending with you, and also to know who your most valuable customers are. Please pull together a list of customer names, their total lifetime rentals, and the sum of all payments you have collected from them. It would be great to see this ordered on total lifetime value, with the most valuable customers at the top of the list.

select first_name, last_name, sum(amount) from customer 
left join rental on rental.customer_id=customer.customer_id
left  join payment on payment.customer_id=customer.customer_id
group by first_name,last_name
order by sum desc limit 10
  
