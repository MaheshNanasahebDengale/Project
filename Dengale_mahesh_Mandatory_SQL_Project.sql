--Q.1 How can you retrieve all the information from the cd.facilities table?
select * from cd.facilities;

--here we get all information using select and *.

--Q.2 You want to print out a list of all of the facilities and their cost to
--members. How would you retrieve a list of only facility names and costs?

select name,membercost from cd.facilities

--here i use select clause for getting information.

--Q.3 How can you produce a list of facilities that charge a fee to members?
select  from cd.facilities
where membercost > 0
order by facid asc;

--first we  select cd.facilities table and use where cluse to get membercost greter than 0.

--

--Q.4 How can you produce a list of facilities that charge a fee to members, 
--and that fee is less than 1/50th of the monthly maintenance cost? 
--Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.
select facid,name,membercost,monthlymaintenance from cd.facilities
where membercost =35;

--here i use all reqired culumns and use where clause.

--Q.5 How can you produce a list of all facilities with the word 'Tennis' in their name?
select * from cd.facilities
where name  like '%Tennis%'

--here i use where and "like"  for searching tennis.

--Q.6 How can you retrieve the details of facilities with ID 1 and 5? 
--Try to do it without using the OR operator.
select * from cd.facilities
where facid in (1,5)

--here i use in function to get result.


--Q.7 How can you produce a list of members who joined after the start of September 2012? 
--Return the memid, surname, firstname, and joindate of the members in question
select memid,surname,firstname,joindate from cd.members
where joindate between '2012-09-01' and '2012-09-27'

--we use all nessesary column and use 'between' to get all members list who joined in sep 2012.


--Q.8 How can you produce an ordered list of the first 10 surnames in the members table?
 --The list must not contain duplicate
 select distinct(surname) from cd.members
 order by surname limit 10

--first select surname column and use distinct for no duplicate values.


--Q.9  You'd like to get the signup date of your last member. How can you retrieve this information?
select max(joindate) as signup_date from cd.members

--here we use max function to get highest date.


--Q.10 Produce a count of the number of facilities that have a cost to guests of 10 or more.
select count(*) from cd.facilities
where guestcost > 10;

--using count function on facilities table and taking condiction as > 10.


--Q.11 Produce a list of the total number of slots booked per facility in the month of September 2012.
   --Produce an output table consisting of facility id and slots, sorted by the number of slots.
SELECT facid, SUM(slots) AS Total_Slots FROM cd.bookings
WHERE cd.bookings.starttime BETWEEN '2012-09-01' AND '2012-09-30'
GROUP by facid
ORDER BY SUM(slots);

--first we select facid and use sum on slots. use where clause as we know and use between clause .


--Q.12 Produce a list of facilities with more than 1000 slots booked. 
 --Produce an output table consisting of facility id and total slots, sorted by facility id.
 SELECT facid, SUM(slots) AS Total_Number_of_Slots
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid;

--selcting facid, use sum on slots because in second part of question we need total slots and use having
--for get condition as >1000


--Q.13 How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'?
 --Return a list of start time and facility name pairings, ordered by the time
SELECT starttime, name
FROM cd.bookings
INNER JOIN cd.facilities ON cd.facilities.facid = cd.bookings.facid
WHERE name LIKE '%Tennis Court%' AND starttime BETWEEN '2012-09-21 00:00:00' AND '2012-09-21 23:59:59' 
ORDER BY starttime;

--first select starttime from cd.bookings.taking inner join on bookings and facilities as facid as common 
--column. here we use like for getting only result for tennis court and use between for given date and 
-- ordering by starttime.


--Q.14 How can you produce a list of the start times for bookings by members named 'David Farrell'
SELECT starttime FROM cd.bookings
INNER JOIN cd.members ON cd.members.memid = cd.bookings.memid
WHERE surname LIKE '%Farrell%' AND firstname LIKE '%David%'  
ORDER BY starttime;

--first get all information about table cd.bookings then analysing table select starttime column.
--tek inner join because the name is in members table and starttime is avalable in bookings table.
--then i find given name using like clause.

--The teachers table should have columns for teacher_id, 
 --first_name, last_name, homeroom_number, department, email, and phone.

--For SQL DATABASE 
---Creating tables.
  
  Create table teacher (
  
     teacher_id integer primary key not null, 
	  first_name varchar(50) not null,
	  last_name varchar(50) not null,
	  homeroom_number integer unique not null,
	  department varchar(50),
	  email varchar(250),
      phone varchar(20) 
	  
	 )

insert into teacher(teacher_id,first_name,last_name,homeroom_number,department,email,phone)
values (1,'Jonas','Salk',5,'Biology','jsalk@school.org',7775554321)

-- for student 

create table  student(

   
     student_id integer primary key not null, 
	  first_name varchar(50) not null,
	  last_name varchar(50) not null,
	  homeroom_number integer unique not null,
	  phone varchar(20),
      email varchar(250),
	  graduation_year varchar(250)
)


insert into student(student_id,first_name,last_name,homeroom_number,phone,email,graduation_year)
values (1,'Mark','Watney',5,7775551234,NULL,2035)


