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