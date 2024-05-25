--create database
create database computer_shop

-- create table for userdata
create table userdata (
username varchar(50) NOT NULL,
allid int PRIMARY KEY identity (1000,1),
userphone int NOT NULL ,
useremail varchar(255) NOT NULL,
);

--values of userdata
insert into userdata (username,userphone,useremail) values ('omar',01700690703,'omarfaruqeanik@icloud.com'),
                                                           ('faruqe',01700690704,'omarfaruqeanik1@icloud.com'),
                                                           ('anik',01700690705,'omarfaruqeanik2@icloud.com'),
                                                           ('nafiz',01700690706,'omarfaruqeanik3@icloud.com')

                                          drop table userdata

-- create table for service provider data
create table service_provider (
allid int PRIMARY KEY IDENTITY(5000,1),
srename varchar(50)NOT NULL,
srephone int   NOT NULL,
sreemail varchar(255) NOT NULL,
);


--values of  service provider data
insert into service_provider(srename,srephone,sreemail)  values ('baker',01458490703,'a@icloud.com'),
                                                                ('jacki',01700690703,'b@icloud.com'),
                                                                ('rosee',01710690703,'c@icloud.com'),
                                                                ('nafiz',01960690703,'d@icloud.com'),
                                                                ('anika',01705858703,'e@icloud.com')


 
                                          drop table service_provider

create table receipt (
recept_id int identity(10000,1) primary key,
username varchar(50)NOT NULL,
customer_id int ,
product_model varchar (255) not null,
parts_price varchar(255),
seller_name varchar (255),
seller_id int,
); 

--values of receipt
insert into receipt values ('omar',1000,'gigabyte101',5000,'baker',5000),
                           ('faruqe',1001,'gigabyte zyprus5',85000,'jacki',5001),
						   ('anik',1002,'asusw85',7000,'rosee',5002),
						   ('nafiz',1003,'msis seris',1200,'nafiz',5003)

                      drop table receipt 
ALTER TABLE receipt
ADD FOREIGN KEY (product_model) REFERENCES computerparts(parts_model);
-- create table for computer parts
create table computerparts (
parts_id int identity (500,1),
parts_type varchar(255),
parts_model varchar (255)unique,
parts_price int NOT NULL,
price_quantity int NOT NULL,
);

--values of computer parts
insert  into computerparts values ('motherboard','gigabyte101',5000,5),
                                  ('motherboard','gigabyte zyprus5',85000,3),
                                  ('motherboard','asusw85',7000,80),
                                  ('motherboard','msis seris',1200,45),
                                  ('motherboard','rock w3',4000,23),
                                  ('motherboard','gigabyte h12',1000,4),
                                  ('motherboard','asus b34',2000,34),
                                  ('motherboard','msi k32',4560,70),
                                  ('motherboard','asrockn23',56000,10),
                                  ('motherboard','asusb45',80000,11),
                                  ('processor','intel corei9',50000,7),
                                  ('processor','intel core i9k',55000,3),
                                  ('processor','intel core i7',30000,30),
                                  ('processor','intel core i7k',45000,20),
                                  ('processor','intel core i7f',25000,10),
                                  ('processor','intel core i5',15000,40),
                                  ('processor','intel core i5k',20000,5),
                                  ('processor','intel core i5f',21000,12),
                                  ('processor','ryzen 3200',8000,9),
                                  ('processor','ryzen thread rapper',85000,1),
                                  ('ram','crosair 8GB',4500,70),
                                  ('ram','crosair 16GB',8000,30),
                                  ('ram','kingstone 8GB',5000,20),
                                  ('ram','kingstone 32GB',10000,5),
                                  ('ram','gigabyte 64GB',15000,4),
                                  ('case','gigabyte atx',3200,50),
                                  ('case','gigabyte fullatx',8200,50),
                                  ('case','asus atx',5300,50),
                                  ('case','asus fullatx',9000,50),
								  ('monitor','hp 21inch',1000,12),
								  ('monitor','hp 22inch',1500,10),
								  ('monitor','asus 24 inch',2000,5),
								  ('monitor','gigabyte 30inch',45000,2)
drop table computerparts
----show table data
select * from userdata
select * from service_provider
select * from computerparts
select * from receipt

--Query
--Where
SELECT * FROM userdata WHERE username = 'omar'
--WHERE NOT
SELECT * FROM userdata WHERE NOT username = 'omar'
--WHERE GETHER THEN
SELECT * FROM computerparts WHERE parts_price >= 21000
--WHERE AND
SELECT * FROM computerparts WHERE (parts_model = 'gigabyte101' AND parts_price = 5000)
--WHERE OR
SELECT * FROM computerparts WHERE (parts_model = 'gigabyte101' OR parts_price < 90000)
--WHERE <>
SELECT * FROM computerparts WHERE parts_price <> 5000




--Assending Order
SELECT * FROM computerparts ORDER BY parts_model ASC
--Dessending Order
SELECT * FROM computerparts ORDER BY parts_price DESC
--Minimum
SELECT MIN(parts_price) as minimum_price
FROM computerparts
--Miximum
SELECT MAX(parts_price) as maximum_price
FROM computerparts
--Count
SELECT COUNT(parts_type) as total
FROM computerparts
--count query where and
SELECT COUNT(parts_type) as companyname
FROM computerparts WHERE parts_type ='motherboard' AND parts_model = 'gigabyte101'
--group by
SELECT COUNT(parts_type) AS total,parts_type
from computerparts
GROUP BY parts_type
ORDER BY parts_type DESC
--sum
select sum(parts_id) as id from computerparts
--average
select avg(parts_id) as average from computerparts
--First Have Like
select * from computerparts where parts_model like 'g%';
--Last Have Like
select * from computerparts where parts_model like '%1';
--Middle have Like
select * from computerparts where parts_model like '%i%';

select * from computerparts where parts_model like '_i%';

select * from computerparts where parts_model like '__b%';

select * from computerparts where parts_model like 'g__%';

select * from computerparts where parts_model like 'a%s';

select * from computerparts where parts_model Not like 'a%';

select * from computerparts where parts_model Not like '_a%';

select * from computerparts where parts_model like 'a%' or parts_model like '%a';

-- IN operation
---------------------------------------------------------------------------------------------------------
SELECT * FROM userdata
WHERE username IN ('omar', 'nafiz');

SELECT * FROM userdata
WHERE username NOT IN ('omar', 'nafiz');




--Between
SELECT * FROM computerparts
WHERE parts_price Between 5000 AND 85000

SELECT * FROM computerparts
WHERE parts_price Between 5000 AND 85000
order by parts_price
--having
SELECT COUNT(price_quantity) as total,price_quantity
FROM computerparts
GROUP BY price_quantity
HAVING COUNT(price_quantity) > 3;

--INNER Join
SELECT *
FROM receipt
INNER JOIN service_provider
ON receipt.seller_id = service_provider.allid;


--right Join
SELECT *
FROM receipt
right JOIN service_provider
ON receipt.seller_id = service_provider.allid;


--left Join
----------------------------------------------------------------------------------------------------------
SELECT *
FROM receipt
left JOIN service_provider
ON receipt.seller_id = service_provider.allid;


--full Join
SELECT *
FROM receipt
full  JOIN service_provider
ON receipt.seller_id = service_provider.allid;


--self join
SELECT A.username AS Customer, B.username AS customer_name
FROM receipt A, receipt B
WHERE A.username <> B.username

--seller id 5000
--seller 5000
--sold a product gigabyte..101
--what is the mobile number of the buyer

select srephone , srename from  service_provider
inner join receipt  on service_provider.allid =  receipt.seller_id where product_model= 'gigabyte101' and seller_id = 5000

select  service_provider.allid from service_provider inner join receipt on service_provider.allid = receipt.seller_id where username = 'omar'































































































drop table computerparts