use classicmodels;

# == SELECT Statement ==
# Selecting which data

-- select * from employees;
-- select lastname from employees;

# selecting multiple columns
-- select lastName, firstName, jobTitle from employees;
-- select firstName, jobTitle, lastName from employees;

# calling expression / commands with table
-- select 1+1;
-- select NOW();
-- select concat('John',' ','Doe');
-- select employees from dual; # dummy empty table

# renaming column
-- select concat('John',' ','Doe') as name;
-- select concat('John',' ','Doe') as Name;
-- select concat('John',' ','Doe') as 'Full name';

# == ORDER BY Clause ==
# Ordering data

-- select contactLastname, contactFirstname
-- from customers
-- order by contactLastname;

-- select contactLastname, contactFirstname
-- from customers
-- order by contactLastname desc;

-- select contactLastname, contactFirstname
-- from customers
-- order by contactLastname desc, contactFirstname ASC;

# order by expression
-- select orderNumber, orderlinenumber, quantityOrdered * priceEach
-- from orderdetails
-- order by quantityOrdered * priceEach desc;

-- select orderNumber, orderlinenumber, quantityOrdered * priceEach as subTotal
-- from orderdetails
-- order by subTotal desc;

-- select field('a', 'a', 'c', 'd');
-- select field('a', 'b', 'a', 'd');

#Manually sort order by
-- select orderNumber, status
-- from orders
-- order by field(status, 'In Process', 'On Hold', 'Cancelled', 'Resolved',
-- 'Disputed','Shipped');

# NULL order by
-- select firstName, lastName, reportsTo
-- from employees
-- order by reportsTo;

-- select firstName, lastName, reportsTo
-- from employees
-- order by reportsTo desc;

# == WHERE Clause ==
# Conditions

-- select lastname, firstname, jobtitle, officeCode
-- from employees
-- where jobtitle = 'Sales Rep' and officeCode = 1;

-- select lastname, firstname, jobtitle, officeCode
-- from employees
-- where jobtitle = 'Sales Rep' or officeCode = 1
-- order by officeCode, jobTitle;

-- select lastname, firstname, officeCode
-- from employees
-- where officeCode between 1 and 3 
-- order by officeCode;

-- select lastname, firstname
-- from employees
-- where lastname like '%on'
-- order by firstname;

-- select lastname, firstname, officeCode
-- from employees
-- where officeCode in (1, 2, 3)
-- order by officeCode;

-- select lastname, firstname, reportsTo
-- from employees
-- where reportsTo is null;

-- select lastname, firstname, jobtitle
-- from employees
-- where jobtitle <> 'Sales Rep';

-- select lastname, firstname, officeCode
-- from employees
-- where officeCode > 5;

-- select lastname, firstname, officeCode
-- from employees
-- where officeCode <= 4;

# == SELECT DISTINCT Clause ==
# Removing duplicates

# Duplicate lastname
-- select lastname
-- from employees
-- order by lastname;

# select distinct lastname, removing duplicates
-- select distinct lastname
-- from employees
-- order by lastname;

-- select distinct state
-- from customers;

# select distinct by rows if multiple columns
-- select distinct state, city
-- from customers
-- where state is not null
-- order by state, city;

# == AND Operator ==
# Logic condition operator
# Operator order of operations - AND is first then OR
# If evauluating OR first, use ()

-- select customername, country, state
-- from customers
-- where country = 'USA' and state = 'CA';

-- select customername, country, state, creditlimit
-- from customers
-- where country = 'USA' and state = 'CA' and creditlimit > 100000;

# == OR Operator ==
# Logic condition operator
# Operator order of operations - AND is first then OR
# If evauluating OR first, use ()

-- select customername, country
-- from customers
-- where country = 'USA' or country = 'France';

-- select customername, country, creditlimit
-- from customers
-- where (country = 'USA' or country = 'France') and creditlimit > 100000;

# == IN Operator ==
# Advance form of OR for finding values

-- select officeCode, city, phone, country
-- from offices
-- where country in ('USA', 'France');

-- select officeCode, city, phone, country
-- from offices
-- where country = 'USA' or country = 'France';

# == NOT IN Operator ==
# Advance form of OR for finding values

-- select officeCode, city, phone
-- from offices
-- where country not in ('USA', 'France')
-- order by city;

# == BETWEEN Operator ==
# == NOT BETWEEN Operator ==
# >= AND <= or < OR > for numbers

-- select productCode, productName, buyPrice
-- from products
-- where buyPrice between 90 and 100; -- buyPrice >= 90 AND buyPrice <= 100;

-- select productCode, productName, buyPrice
-- from products
-- where buyPrice not between 20 and 100; -- buyPrice < 20 OR buyPrice > 100;

# Casting string into date type
-- select orderNumber, requiredDate, status
-- from orders
-- where requiredDate between cast('2003-01-01' as date) and cast('2003-01-31' as date);

# == LIKE Operator ==
# pattern regex
# % any string of 0 or more char
# _ any single char

-- select employeeNumber, lastName, firstName
-- from employees
-- where firstName like 'a%';

-- select employeeNumber, lastName, firstName
-- from employees
-- where lastName like '%on';

-- select employeeNumber, lastName, firstName
-- from employees
-- where lastName like '%at%';

-- select employeeNumber, lastName, firstName
-- from employees
-- where lastName like '%on%';

-- select employeeNumber, lastName, firstName
-- from employees
-- where firstName like 'T_m';

-- select productCode, productName
-- from products
-- where productCode like '%\_20%';

# ESCAPE for different escape characters than default '\'
-- select productCode, productName
-- from products
-- where productCode like '%$_20%' escape '$';

# == LIMIT Clause ==
# limiting the amount of rows returned
# can return a certain amount of rows back with offset

-- select customerNumber, customerName, creditLimit
-- from customers
-- order by creditLimit desc
-- limit 5;

-- select customerNumber, customerName, creditLimit
-- from customers
-- order by creditLimit, customerNumber
-- limit 5;

# Pagenation, offset by pages of rows
-- select customerNumber, customerName
-- from customers
-- order by customerName
-- limit 10, 10;

-- select customerName, creditLimit
-- from customers
-- order by creditLimit desc
-- limit 1, 1;

-- select distinct state
-- from customers
-- where state is not null
-- limit 5;

# == IS NULL Operator ==
# check if null

-- select customerName, country, salesrepemployeenumber
-- from customers
-- where salesrepemployeenumber is null
-- order by customerName;

-- select customerName, country, salesrepemployeenumber
-- from customers
-- where salesrepemployeenumber is not null
-- order by customerName;

# Supposely 0000-00-00 can be returned null, but insert into project new table is giving error

# == Alias ==
# Uses ` - Tilda key not single quote '
# Renaming table and columns in readable strings and reuse in queries

-- select CONCAT_WS(', ', lastName, firstname) as `Full name`
-- from employees;

-- select CONCAT_WS(', ', lastName, firstname) `Full name`
-- from employees
-- order by `Full name`;

-- select orderNumber `Order no.`, sum(priceEach * quantityOrdered) total
-- from orderDetails
-- group by `Order no.`
-- having total > 60000;

-- select e.firstName, e.lastName
-- from employees e
-- order by e.firstName;

-- select customerName, COUNT(o.orderNumber) total
-- from customers c
-- inner join orders o on c.customerNumber = o.customerNumber
-- group by customerName
-- order by total DESC;

# == JOIN Clause ==
# joining tables to find matching data and query it

-- CREATE TABLE members (
--     member_id INT AUTO_INCREMENT,
--     name VARCHAR(100),
--     PRIMARY KEY (member_id)
-- );

-- CREATE TABLE committees (
--     committee_id INT AUTO_INCREMENT,
--     name VARCHAR(100),
--     PRIMARY KEY (committee_id)
-- );

-- INSERT INTO members(name)
-- VALUES('John'),('Jane'),('Mary'),('David'),('Amelia');

-- INSERT INTO committees(name)
-- VALUES('John'),('Mary'),('Amelia'),('Joe');

-- SELECT * FROM members;

-- SELECT * FROM committees;

# INNER JOIN 
# Matches data between tables and only matches
-- select m.member_id, m.name as member, c.committee_id, c.name as committee
-- from members m
-- inner join committees c on c.name = m.name;

-- select m.member_id, m.name as member, c.committee_id, c.name as committee
-- from members m
-- inner join committees c using(name);

# LEFT JOIN
# Every data in the left table (from / members) and any matches from the joining table
-- select m.member_id, m.name as member, c.committee_id, c.name as committee
-- from members m
-- left join committees c using(name)
-- where c.committee_id is null;

# RIGHT JOIN
# Every data in the right table (join / committees) and any matches from the left / from table
-- select m.member_id, m.name as member, c.committee_id, c.name as committee
-- from members m
-- right join committees c using(name)
-- where m.member_id is null;

# CROSS JOIN
# No join condition, joins tables and assign each table data to the other table data
# so both table data matches each other until exhaustion
-- select m.member_id, m.name as member, c.committee_id, c.name as committee
-- from members m
-- cross join committees c;

# == INNER JOIN Clause ==
# Matches data between tables and only matches

-- select productCode, productName, textDescription
-- from products
-- inner join productlines using(productline);

-- select orderNumber, status, sum(quantityOrdered * priceEach) total
-- from orders
-- inner join orderdetails using(orderNumber)
-- group by orderNumber;

# 3 tables
-- select orderNumber, orderDate, orderLineNumber, productName, quantityOrdered, priceEach
-- from orders
-- inner join orderdetails using(orderNumber)
-- inner join products using(productCode)
-- order by orderNumber, orderLineNumber;

# 4 tables
-- select orderNumber, orderDate, customerName, orderLineNumber, 
-- productName, quantityOrdered, priceEach
-- from orders
-- inner join orderdetails using(orderNumber)
-- inner join products using(productCode)
-- inner join customers using(customerNumber)
-- order by orderNumber, orderLineNumber;

# Inner join and operator
-- select orderNumber, productName, msrp, priceEach
-- from products p
-- inner join orderdetails o on p.productCode = o.productCode
-- and p.msrp > o.priceEach
-- where p.productCode = 'S10_1678';

# == LEFT JOIN Clause ==
# Every data in the left table (from / members) and any matches from the joining table

-- select customerNumber, customerName, orderNumber, status
-- from customers
-- left join orders using(customerNumber);

-- select customerNumber, customerName, orderNumber, status
-- from customers
-- left join orders using(customerNumber)
-- where orderNumber is null;

-- select lastName, firstName, customerName, checkNumber, amount
-- from employees
-- left join customers on employeeNumber = salesRepEmployeeNumber
-- left join payments using(customerNumber )
-- order by customerName, checkNumber;

# Difference between WHERE and ON clause
-- select orderNumber, customerNumber, productCode
-- from orders
-- left join orderDetails using(orderNumber)
-- where orderNumber = 10123;

# ON Clause same as WHERE Clause
-- select o.orderNumber, customerNumber, productCode
-- from orders o
-- left join orderDetails d on o.orderNumber = d.orderNumber 
-- and o.orderNumber = 10123;

# == RIGHT JOIN Clause ==
# Every data in the right table (join / committees) and any matches from the left / from table

-- select employeeNumber, customerNumber
-- from customers
-- right join employees on salesRepEmployeeNumber = employeeNumber
-- order by employeeNumber;

-- select employeeNumber, customerNumber
-- from customers
-- right join employees on salesRepEmployeeNumber = employeeNumber
-- where customerNumber is null
-- order by employeeNumber;

# == Self Join ==
# Join a table to itself with INNER JOIN or LEFT JOIN

# Inner join
-- select CONCAT(m.lastName, ', ', m.firstName) as Manager,
-- CONCAT(e.lastName, ', ', e.firstName) as 'Direct report'
-- from employees e
-- inner join employees m on m.employeeNumber = e.reportsTo
-- order by Manager;

# Left join
-- select ifnull(CONCAT(m.lastName, ', ', m.firstName), 'Top Manager') as 'Manager',
-- CONCAT(e.lastName, ', ', e.firstName) as 'Direct report'
-- from employees e
-- left join employees m on m.employeeNumber = e.reportsTo
-- order by manager desc;

-- select c1.city, c1.customerName, c2.customerName
-- from customers c1
-- inner join customers c2 on c1.city = c2.city and c1.customerName > c2.customerName
-- order by c1.city;

# == CROSS JOIN Clause ==
# No join condition, joins tables and assign each table data to the other table data
# so both table data matches each other until exhaustion

-- CREATE DATABASE IF NOT EXISTS salesdb;
-- USE salesdb;

-- CREATE TABLE products (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     product_name VARCHAR(100),
--     price DECIMAL(13,2 )
-- );

-- CREATE TABLE stores (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     store_name VARCHAR(100)
-- );

-- CREATE TABLE sales (
--     product_id INT,
--     store_id INT,
--     quantity DECIMAL(13 , 2 ) NOT NULL,
--     sales_date DATE NOT NULL,
--     PRIMARY KEY (product_id , store_id),
--     FOREIGN KEY (product_id)
--         REFERENCES products (id)
--         ON DELETE CASCADE ON UPDATE CASCADE,
--     FOREIGN KEY (store_id)
--         REFERENCES stores (id)
--         ON DELETE CASCADE ON UPDATE CASCADE
-- );

-- INSERT INTO products(product_name, price)
-- VALUES('iPhone', 699),
--       ('iPad',599),
--       ('Macbook Pro',1299);

-- INSERT INTO stores(store_name)
-- VALUES('North'),
--       ('South');

-- INSERT INTO sales(store_id,product_id,quantity,sales_date)
-- VALUES(1,1,20,'2017-01-02'),
--       (1,2,15,'2017-01-05'),
--       (1,3,25,'2017-01-05'),
--       (2,1,30,'2017-01-02'),
--       (2,2,35,'2017-01-05');

-- select store_name, product_name, SUM(quantity * price) as revenue
-- from sales
-- inner join products on products.id = sales.product_id
-- inner join stores on stores.id = sales.store_id
-- group by store_name, product_name;

-- select store_name, product_name
-- from stores as a
-- cross join products as b

-- select b.store_name, a.product_name, ifnull(c.revenue, 0) as revenue
-- from products as a
-- cross join stores as b
-- left join 
-- 	(select stores.id as store_id, products.id as product_id, store_name, product_name,
--     round(sum(quantity * price), 0) as revenue
--     from sales
--     inner join products on products.id = sales.product_id
--     inner join stores on stores.id = sales.store_id
--     group by stores.id, products.id, store_name , product_name) 
-- 	as c on c.store_id = b.id and c.product_id = a.id
-- order by b.store_name;

# == GROUP BY Clause ==
# group similar rows into 1 category / row
# despite what the tutorial says, this does not sort them and order by is needed

-- select status
-- from orders
-- group by status;

-- select distinct status
-- from orders;

-- select status, count(*)
-- from orders
-- group by status;

-- select status, sum(quantityOrdered * priceEach) as amount
-- from orders
-- inner join orderdetails using (orderNumber)
-- group by status;

-- select orderNumber, sum(quantityOrdered * priceEach) as total
-- from orderdetails
-- group by orderNumber;

-- select year(orderDate) as year, sum(quantityOrdered * priceEach) as total
-- from orders
-- inner join orderdetails using (orderNumber)
-- where status = 'Shipped'
-- group by year(orderDate);

-- select year(orderDate) as year, sum(quantityOrdered * priceEach) as total
-- from orders
-- inner join orderdetails using (orderNumber)
-- where status = 'Shipped'
-- group by year
-- having year > 2003;

-- select year(orderDate) as year, count(orderNumber)
-- from orders
-- group by year;

# same as select distinct without group by
-- select state
-- from customers
-- group by state;

-- select distinct state
-- from customers;

-- select distinct state
-- from customers
-- order by state;

# == HAVING Clause ==
# Filters for group by clause

-- select ordernumber, SUM(quantityOrdered) AS itemsCount, 
-- SUM(priceeach*quantityOrdered) AS total
-- from orderdetails
-- group by ordernumber
-- having total > 10000 and itemsCount > 600;

-- select ordernumber, status, SUM(priceeach*quantityOrdered) AS total
-- from orderdetails 
-- inner join orders using(ordernumber)
-- group by ordernumber, status
-- having total > 15000 and status = 'Shipped';

# == ROLLUP ==
# Another group by filter by aggretating data

-- CREATE TABLE sales
-- SELECT
--     productLine,
--     YEAR(orderDate) orderYear,
--     SUM(quantityOrdered * priceEach) orderValue
-- FROM
--     orderDetails
--         INNER JOIN
--     orders USING (orderNumber)
--         INNER JOIN
--     products USING (productCode)
-- GROUP BY
--     productLine ,
--     YEAR(orderDate);
    
-- SELECT * FROM sales;

-- select productline, SUM(orderValue) totalOrderValue
-- from sales
-- group by productline;

-- select SUM(orderValue) totalOrderValue
-- from sales;

-- select productline, SUM(orderValue) totalOrderValue
-- from sales
-- group by productline
-- union all
-- select null, SUM(orderValue) totalOrderValue
-- from sales;

# shorten union all with rollup
-- select productline, SUM(orderValue) totalOrderValue
-- from sales
-- group by productline with rollup;

-- select productline, orderYear, SUM(orderValue) totalOrderValue
-- from sales
-- group by productline, orderYear with rollup;

-- select orderYear, productline, SUM(orderValue) totalOrderValue
-- from sales
-- group by orderYear, productline with rollup;

-- select orderYear, productline, SUM(orderValue) totalOrderValue, grouping(orderYear),
-- grouping(productline)
-- from sales
-- group by orderYear, productline with rollup;

-- select 
-- 	if(grouping(orderYear), 'All Years', orderYear) orderYear, 
--     if(grouping(productline), 'All Product Lines', productline) productline, 
--     SUM(orderValue) totalOrderValue
-- from sales
-- group by orderYear, productline with rollup;

# == Subquery ==
# nested queries, doesn't return tables, mostly WHERE

-- select lastName, firstName
-- from employees
-- where officeCode in 
-- (select officeCode
--  from offices
--  where country = 'USA');

-- select customerNumber, checkNumber, amount
-- from payments
-- where amount = (select max(amount) from payments);

-- select customerNumber, checkNumber, amount
-- from payments
-- where amount > (select avg(amount) from payments);

-- select customerName
-- from customers
-- where customerNumber not in (select distinct customerNumber from orders);

-- select max(items), min(items), floor(avg(items))
-- from 
-- (select orderNumber, count(orderNumber) as items
--  from orderdetails
--  group by orderNumber) as lineitems;

-- select productname, buyprice
-- from products p1
-- where buyprice > 
-- (select avg(buyprice)
--  from products
--  where productline = p1.productline);

-- select orderNumber, sum(priceEach * quantityOrdered) total
-- from orderdetails
-- inner join orders using(orderNumber)
-- group by orderNumber
-- having sum(priceEach * quantityOrdered) > 60000;

-- select customerNumber, customerName
-- from customers c1
-- where exists
-- (select orderNumber, sum(priceEach * quantityOrdered)
--  from orderdetails
--  inner join orders using(orderNumber)
--  where customerNumber = c1.customerNumber
--  group by orderNumber
--  having sum(priceEach * quantityOrdered) > 60000);

# == Derived Table ==
# Muzt have alias, in FROM, temporary tables, returns a table

-- select productCode, round(sum(quantityOrdered * priceEach)) sales
-- from orderdetails
-- inner join orders using(orderNumber)
-- where year(shippedDate) = 2003
-- group by productCode
-- order by sales desc
-- limit 5;

# Use above table as a derived table below
-- select productName, sales
-- from
-- 	(select productCode, round(sum(quantityOrdered * priceEach)) sales
-- 	from orderdetails
-- 	inner join orders using(orderNumber)
-- 	where year(shippedDate) = 2003
-- 	group by productCode
-- 	order by sales desc
-- 	limit 5) top5products2003
-- inner join products using(productCode);

-- select customerNumber, round(sum(quantityOrdered * priceEach)) sales,
-- (case
--  when sum(quantityOrdered * priceEach) < 10000 THEN 'Silver'
--  when sum(quantityOrdered * priceEach) BETWEEN 10000 AND 100000 THEN 'Gold'
--  when sum(quantityOrdered * priceEach) > 100000 THEN 'Platinum'
--  end) customerGroup
-- from orderdetails
-- inner join orders using(orderNumber)
-- where year(shippedDate) = 2003
-- group by customerNumber;

# Use above table as a derived table below
-- select customerGroup, count(cg.customerGroup) AS groupCount
-- from
-- 	(select customerNumber, round(sum(quantityOrdered * priceEach)) sales,
-- 		(case
-- 		 when sum(quantityOrdered * priceEach) < 10000 THEN 'Silver'
-- 		 when sum(quantityOrdered * priceEach) BETWEEN 10000 AND 100000 THEN 'Gold'
-- 		 when sum(quantityOrdered * priceEach) > 100000 THEN 'Platinum'
-- 		 end) customerGroup
-- 	from orderdetails
-- 	inner join orders using(orderNumber)
-- 	where year(shippedDate) = 2003
-- 	group by customerNumber) cg
-- group by cg.customerGroup;

# == EXISTS Operator ==
# primarily WHERE, determines if exists or not

-- select customerNumber, customerName
-- from customers
-- where exists
-- 	(select 1
--     from orders
--     where orders.customernumber = customers.customernumber);

-- select customerNumber, customerName
-- from customers
-- where not exists
-- 	(select 1
--     from orders
--     where orders.customernumber = customers.customernumber);

-- select employeenumber, firstname, lastname, extension
-- from employees
-- where exists
-- 	(select 1
--     from offices
--     where city = 'San Francisco' AND offices.officeCode = employees.officeCode);
    
## UPDATE EXISTS ##
-- update employees
-- set extension = concat(extension, '1')
-- where exists
-- 	(select 1
--     from offices
--     where city = 'San Francisco' AND offices.officeCode = employees.officeCode);
--     
-- select employeenumber, firstname, lastname, extension
-- from employees
-- where exists
-- 	(select 1
--     from offices
--     where city = 'San Francisco' AND offices.officeCode = employees.officeCode);
## UPDATE EXISTS END ##

## INSERT INTO ##
-- create table customers_archive
-- like customers;

-- insert into customers_archive
-- select *
-- from customers
-- where not exists
-- 	(select 1
--     from orders
--     where orders.customernumber = customers.customernumber);

-- select * from customers_archive;
## INSERT INTO END ##

-- delete from customers
-- where exists
-- 	(select 1
--     from customers_archive a
--     where a.customernumber = customers.customernumber);

## IN vs EXISTS Performance ##
-- select customerNumber, customerName
-- from customers
-- where customerNumber in
-- 	(select customerNumber from orders);
--     
-- explain select customerNumber, customerName
-- from customers
-- where exists
-- 	(select 1
--     from orders
--     where orders.customernumber = customers.customerNumber);

-- select employeenumber, firstname, lastname
-- from employees
-- where officeCode in	
-- 	(select officeCode
--     from offices
--     where offices.city = 'San Francisco');
## IN vs EXISTS Performance END ##

# == Common Table Expression - CTE ==


