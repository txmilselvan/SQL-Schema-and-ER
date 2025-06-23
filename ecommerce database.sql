create database ecommerce
use ecommerce

create table users(
user_id int AUTO_INCREMENT primary key,
first_name varchar(100) not null,
last_name varchar(100) not null,
user_email varchar(255) unique not null,
created_at TIMESTAMP default current_timestamp
);


create table catagories(
catagory_id int AUTO_INCREMENT primary key,
name varchar(100) not null
);

create table product(
product_id int auto_increment PRIMARY KEY,
catagory_id int not null,
name varchar(100) not null,
price decimal(10,2) not null,
stock int not null default 0,
created_at timestamp default current_timestamp,
foreign key(catagory_id) references catagories(catagory_id)
);

create table orders(
order_id int auto_increment primary key,
user_id int not null,
order_date timestamp default current_timestamp,
total_amount decimal(10,2) not null,
foreign key(user_id) references users(user_id)
);

create table order_item(
order_item_id int auto_increment primary key,
order_id int not null,
product_id int not null,
quantity int not null,
price decimal(10,2) not null,
foreign key(order_id) references orders(order_id),
foreign key(product_id) references product(product_id)
);

CREATE TABLE addresses (
  address_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  street VARCHAR(255),
  city VARCHAR(100),
  state VARCHAR(100),
  zip VARCHAR(20),
  country VARCHAR(100),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

ALTER TABLE orders
  ADD COLUMN billing_address_id INT,
  ADD COLUMN shipping_address_id INT,
  ADD FOREIGN KEY (billing_address_id) REFERENCES addresses(address_id),
  ADD FOREIGN KEY (shipping_address_id) REFERENCES addresses(address_id);






