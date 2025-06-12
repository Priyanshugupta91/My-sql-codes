CREATE DATABASE sale_forcasting;
USE sale_forcasting;

CREATE TABLE salesman(
salesman_id INT PRIMARY KEY,
name VARCHAR(100),
city VARCHAR(50),
commission DOUBLE
);

INSERT INTO salesman
(salesman_id, name, city, commission)

VALUES
(5001, "James Hoog", "New York", 0.15),
(5002, "Nail Knite", "Paris", 0.13),
(5005, "Pit Alex", "London", 0.11),
(5006, "Mc Lyon", "Paris", 0.14),
(5003, "Lauson Hen", "", 0.12),
(5007, "Pual Adam", "Roma", 0.13);

SELECT * FROM salesman;

CREATE TABLE customer(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
city VARCHAR(50),
grade INT,
salesman_id INT
);

INSERT INTO customer
(customer_id, customer_name, city, grade, salesman_id)

VALUES
(3002, "Nick Rimando", "New York", 100, 5001),
(3005, "Graham Zusi", "California", 200, 5002),
(3001, "Nick Rimando", "London", null, null),
(3004, "Nick Rimando", "Paris", 300, 5006),
(3007, "Nick Rimando", "New York", 200, 5001),
(3009, "Nick Rimando", "Berlin", 100, null),
(3008, "Nick Rimando", "London", 300, 5002),
(3003, "Nick Rimando", "Moncow", 200, 5007);

SELECT * FROM customer;

-- updating customer_name

UPDATE customer
SET customer_name = CASE customer_id
    WHEN 3005 THEN 'Graham Zusi'
    WHEN 3001 THEN 'Brad Guzan'
    WHEN 3004 THEN 'Fabian Johns'
    WHEN 3007 THEN 'Brad Davis'
    WHEN 3009 THEN 'Geoff Camero'
    WHEN 3008 THEN 'Julian Green'
    WHEN 3003 THEN 'Jozy Altidor'
END
WHERE customer_id IN (3005, 3001, 3004, 3007, 3009, 3008, 3003);

CREATE TABLE orders(
order_no INT PRIMARY KEY,
purch_amt DOUBLE,
order_date DATE,
customer_id INT,
salesman_id INT
);

INSERT INTO orders
(order_no, purch_amt, order_date, customer_id, salesman_id)

VALUES
(70001, 150.5, '2016-10-05', 3005, 5002),
(70009, 270.65, '2016-09-10', 3001, null),
(70002, 65.26, '2016-10-05', 3002, 5001),
(70004, 110.5, '2016-08-17', 3009, null),
(70007, 948.5, '2016-09-10', 3005, 5002),
(70005, 2400.6, '2016-07-27', 3007, 5001),
(70008, 5760, '2016-09-10', 3002, 5001),
(70010, 1983.43, '2016-10-10', 3004, 5006),
(70003, 2480.4, '2016-10-10', 3009, null),
(70012, 250.45, '2016-06-27', 3008, 5002),
(70011, 75.29, '2016-08-17', 3003, 5007);

SELECT * FROM orders;

-- question 1.
SELECT name, commission
FROM salesman;

-- question 2. retrieve salesman id of all salesman from orders table without any repeats.
SELECT DISTINCT salesman_id
FROM orders;

-- question 3. display names and city of salesman, who belongs to the city paris.
SELECT name, city
FROM salesman
WHERE city = 'Paris';

-- question 4. display all the information for those customers with a grade of 200.
SELECT * FROM customer
WHERE grade = 200;

-- question 5. display the order number, order date and the purchase amount for orders which will be delivered by the salesman with ID 5001.
SELECT order_no, order_date, purch_amt
FROM orders
WHERE salesman_id = 5001;

-- question 6. display all the customers, who are either belongs to the city new york or not had a grade above 100.
SELECT *
FROM customer
WHERE city = 'New York' OR grade <= 100;

-- question 7. find those salesman with all the information who gets the commission within a range of 0.12 and 0.14.
SELECT *
FROM salesman
WHERE commission BETWEEN 0.12 AND 0.14;

-- question 8. find all those customers with all information whose names are ending with the leter 'n' 
SELECT * FROM customer
WHERE customer_name LIKE '%n';

-- question 9.find those salesman with all information whose name containing the 1st letter character is 'N' and the 4th character is 'l' and rests may be any chharacter.
SELECT *
FROM salesman
WHERE name LIKE 'N__l%';

-- question 10. find that customer with all information who does not get any grade except null.
SELECT * FROM customer
WHERE grade IS null;
