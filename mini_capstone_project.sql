create table supplies (
  
    supplies_id varchar(10) primary key not null,
	supplies_name varchar(50) not null,
	other_supplies_details varchar(50)


)

insert into supplies (supplies_id,supplies_name,other_supplies_details)
values ('S1','Sun-marketing',''),
       ('S2','Yolk-agencis',''),
	   ('S3','Nagappa-Enterprises',''),
	   ('S4','M.P-Enterprises',''),
	   ('S5','VP-Marketing','')
	   
	  select * from supplies 
	  
	  
create table customer(

    customer_id integer primary key not null,
	customer_name varchar(250) not null,
	customer_phone bigint  ,
	email varchar(50),
	other_customer_details varchar(250)
   )
   
 insert into customer(customer_id,customer_name,customer_phone,email,other_customer_details)
 values  (1,'Aditi Shukla',9999991234,'aditi@gmail.com',Null),
		 (2,'Mohan Verma',9999994321,'mohan@gmail.com','Businessperson'),
		 (3,'Kumar Patel',9999992134,'kumar6@gmail.com','Sportsman'),
		 (4,'Krushna Ghule',7775553214,'krish7@gmail.com','comedian'),
		 (5,'Mahesh Naik',5557771243,'maheshn@gmail.com','Teacher')
		 
		select * from customer
		
		
create table products(
   product_id varchar(200) primary key not null,
	product_type_code varchar(200),
    supplies_id integer  references  supplies(supplies_id) ,
	product_price integer,
	other_product_info varchar(200)
    )	
	
	insert into products(product_id,product_type_code,supplies_id,product_price,other_product_info)
	values ('AT211','P0012','S1',1200,'Good'),
	       ('AU982','P0043','S2',2200,'Good'),
		   ('BC103','P0064','S3',2350,'Good'),
		   ('BN434','P0073','S4',2215,'Good'),
		   ('CB145','P0014','S5',2510,'Good')
		 
		 select * from products
		 
create table customer_orders_products(
        order_id int primary key not null,
	    product_id varchar references products(product_id),
	    quantity int,
	    comments varchar)	
		
	insert into customer_orders_products(order_id,product_id,quantity,comments)		
	values (5,'AT211',11,'packed'),
	       (3,'AU982',13,'in progress'),
		   (1,'BC103',16,'packed'),
		   (9,'BN434',12,'packed'),
		   (6,'CB145',10,'packing')
		   
		   select * from  customer_orders_products
		   
		   
create table customer_orders(
     
        order_id int primary key not null,
	    customer_id int references customer(customer_id),
	    customer_payment_method_id varchar ,
	    order_status_code varchar,
	    date_order_placed varchar,
	    date_order_paid varchar,
	    date_order_price varchar,
	    other_product_details varchar
)		   

  insert into customer_orders(order_id,customer_id,customer_payment_method_id,order_status_code,
							 date_order_placed,date_order_paid,date_order_price,other_product_details)
							 
		values (5,1,'online','shipped','2022-01-16','2022-01-16','','Books'),
		       (3,2,'online','shipped','2022-01-17','2022-01-17','','TV'),
			   (1,3,'online','partially shipped','2022-02-01','2022-01-01','','vegetable'),
			   (9,4,'online','shipped','2022-02-16','2022-02-16','','cofee'),
			   (6,5,'online','shipped','2022-01-12','2022-01-12','','CD')
		   
		   select * from customer_orders
		   

create table customer_orders_delivery(

        order_id int references customer_orders(order_id),
	    date_reported varchar primary key not null,
	    delivery_status_code varchar 
)
		   
	insert into customer_orders_delivery(order_id,date_reported, delivery_status_code)	   
	values (5,'2022-03-11','delivered'),
	       (3,'2022-03-09','delivered'),
		   (1,'2022-03-07','delivered'),
		   (9,'2022-03-10','delivered'),
		   (6,'2022-03-13','delivered')
		   
		   select * from customer_orders_delivery
		   
		   
create table addresses(
    address_id int primary key not null,          
	line_1_number_building varchar,
	line_2_number_street varchar,
	line_3_area_locality varchar,
	city varchar,
	zip_postcode int,
	state_province_country varchar,
	iso_country_code varchar,
	other_address_details varchar

)		   
		   
	insert into  addresses(address_id,line_1_number_building ,line_2_number_street,line_3_area_locality,
						  city,zip_postcode,state_province_country,iso_country_code,other_address_details)	
		values (1,'B-3','H-1','West','Pune',400123,'Maharashtra','IND',''),
		       (2,'B-5','H-2','North','Delhi',400321,'Delhi','IND',''),
			   (3,'B-4','H-3','West','Mumbai',400213,'Maharashtra','IND',''),
			   (4,'B-1','H-4','South','Chennai',400666,'Tamilnadu','IND',''),
			   (5,'B-2','H-5','West','Nashik',400333,'Maharashtra','IND','')
			   
			   select * from addresses
			   

create table customer_addresses(
  
        customer_id int references customer(customer_id),
	    address_id int references addresses(address_id),
	    date_from varchar primary key not null,
	    address_type_code varchar,
	    date_to varchar
)

insert into customer_addresses(customer_id,address_id,date_from,address_type_code,date_to)
    values (1,1,'2022-01-01','Home','2022-01-12'),
	       (2,2,'2022-01-05','Office','2022-01-07'),
		   (3,3,'2022-01-02','Restaurants','2022-02-21'),
		   (4,4,'2022-02-18','Home','2022-02-23'),
		   (5,5,'2022-03-09','Office','2022-03-10')
		   
		   select * from customer_addresses
	--above i updated two rows after inserting  therefor they shows duplicate keys while running above code	

create table Ref_Address_Types(

         address_type_code varchar   primary key not null,
	     address_type_description varchar
)

 insert into Ref_Address_Types( address_type_code, address_type_description)
  values ('Home','B-3,Pune 400123'),
         ('Office','B-5,Delhi 400321'),
		 ('Restaurants','B-4,Mumbai 400213'),
		 ('school','B-1,Chennai 400666'),
		 ('Bank','B-2,Nashik 400333') 
		 
		 select * from Ref_Address_Types