create database ecommerce;
use ecommerce;
create table Categories (
category_id varchar(30),
category_name varchar(30),
category_description tinytext
);

create table Products_Categories (
product_id varchar(30),
category_id varchar(30)
);

create table Products (
product_id varchar(30),
product_name varchar(30),
product_description tinytext,
product_price float,
product_status boolean
);

use ecommerce;
ALTER TABLE Products
ADD PRIMARY KEY (product_id)






