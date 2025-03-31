create database office;

use office

select * from [dbo].[customers]

select * from [dbo].[employees];

select * from [dbo].[offices]

select * from [dbo].[orderdetails]

select * from [dbo].[orders]

select * from [dbo].[payments]

select * from [dbo].[productlines]

select * from [dbo].[products]

create table new_office(
officeCode int Primary Key,	city text ,	phone text,
addressLine1 text,	addressLine2 text,	state text,	
country text,	postalCode text,	territory text
)

insert into new_office(
officeCode,	city,	phone,	addressLine1,
addressLine2,	state,	country,
postalCode,	territory
)
select 
officeCode,	city,	phone,	addressLine1,
addressLine2,	state,	country,
postalCode,	territory
from [dbo].[offices]

select * from new_office
----------------------------------------------------------------------------------------------

create table new_employees(
employeeNumber int Primary Key ,lastName text,	firstName text,	extension text,
email text,	officeCode int,	reportsTo int,	jobTitle text, 
foreign key (officeCode) references new_office(officeCode)
)

insert into new_employees(
employeeNumber,	lastName,	firstName,	extension,
email,	officeCode,	reportsTo,	jobTitle
)
select employeeNumber,	lastName,	firstName,	extension,
email,	officeCode,	reportsTo,	jobTitle
from [dbo].[employees]

select * from [dbo].[new_employees]
-------------------------------------------------------------------------------------------------------------------------

create table new_customers(
customerNumber int Primary Key,	customerName text,	contactLastName text,
contactFirstName text,	phone text,	addressLine1 text,	addressLine2 text,
city text,	state text,	postalCode text, country text,
salesRepEmployeeNumber int,	creditLimit int
foreign key (salesRepEmployeeNumber) references new_employees(employeeNumber)
)

drop table new_customers

insert into new_customers( 
customerNumber,	customerName,	contactLastName,
contactFirstName,	phone,	addressLine1,	addressLine2,	city,	state,
postalCode,	country,	salesRepEmployeeNumber,	creditLimit 
)
select 
customerNumber,	customerName,	contactLastName, contactFirstName,
phone,	addressLine1,	addressLine2,	city,	state,	postalCode,
country,	salesRepEmployeeNumber,	creditLimit
from [dbo].[customers]

select * from [dbo].[new_customers]
-----------------------------------------------------------------------------------------------------


create table new_orders(
orderNumber int Primary Key, orderDate date,	requiredDate date,
shippedDate date,	status text,	customerNumber int,
foreign key (customerNumber) references new_customers(customerNumber)
)

insert into new_orders(
orderNumber,	orderDate,	requiredDate,
shippedDate,	status,	customerNumber	
)
select
orderNumber,	orderDate,	requiredDate,
shippedDate,	status,	customerNumber	
from [dbo].[orders]

select * from new_orders
-------------------------------------------------------------------------------------------------------------

create table new_orderdetails(
orderNumber int not null,	productCode varchar(20) not null,	quantityOrdered int,
priceEach float,	orderLineNumber int
primary key (orderNumber, productCode)
foreign key (orderNumber) references new_orders(orderNumber)
)

insert into new_orderdetails(
orderNumber,	productCode,	quantityOrdered,
priceEach,	orderLineNumber
)
select 
orderNumber,	productCode,	quantityOrdered,
priceEach,	orderLineNumber
from [dbo].[orderdetails]

--------------------------------------------------------------

create table new_products(
productCode varchar(20) primary key, productName text, productLine varchar(20),
productScale text, productVendor text,
productDescription text, quantityInStock int, buyPrice float, MSRP float,
foreign key (productCode) references new_products(productCode)
)

insert into new_products(
productCode , productName , productLine ,
productScale , productVendor ,
productDescription , quantityInStock , buyPrice, MSRP
)
select 
productCode , productName , productLine ,
productScale , productVendor ,
productDescription , quantityInStock , buyPrice, MSRP
from products


select * from new_products
----------------------------------------------------------------------------------------
select * from [dbo].[productlines]

create table new_productlines(
productLine varchar(20) , textDescription text, 
htmlDescription text, image text
foreign key (productLine) references new_products(productLine)
)






oductCode)>1