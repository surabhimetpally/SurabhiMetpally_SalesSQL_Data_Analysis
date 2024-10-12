-- Name: Surabhi Metpally
-- Assignment 2

USE sales;

-- a.	What is the best customer in terms of the one who has ordered the most total units (quantity)?
SELECT Customer_ID, Customer_Name, 
SUM(`order`.Quantity) AS Total_Units_Ordered
FROM customer
JOIN `order` ON Customer_ID = `order`.CustomerID
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Units_Ordered DESC
LIMIT 1;

-- b.	What are sums of quantities of the orders each customer in from VA? Include a rollup of total quantities?
SELECT Customer_ID, Customer_Name, 
SUM(`order`.Quantity) AS Total_Quantity
FROM customer
JOIN `order` ON Customer_ID = `order`.CustomerID
WHERE Customer_State = 'VA'
GROUP BY Customer_ID, Customer_Name
WITH ROLLUP;

-- c.	Who are the top ten customers in total revenue (unit price * quantiy)?
SELECT Customer_ID, Customer_Name, 
SUM(`order`.Quantity * product.Product_Unit_Price) AS Total_Revenue
FROM customer
JOIN `order` ON customer.Customer_ID = `order`.CustomerID
JOIN product ON `order`.ProductID = product.Product_ID
GROUP BY customer.Customer_ID, customer.Customer_Name
ORDER BY Total_Revenue DESC
LIMIT 10;

-- d.	What are the revenues by state with rollup?
SELECT Customer_State, 
SUM(`order`.Quantity * Product_Unit_Price) AS Total_Revenue
FROM customer
JOIN `order` ON Customer_ID = `order`.CustomerID
JOIN product ON `order`.ProductID = product.Product_ID
GROUP BY Customer_State WITH ROLLUP;

-- e.	What is the count of customers in these data?
SELECT COUNT(DISTINCT Customer_ID) AS Customer_Count
FROM customer;

-- f.	Use the LIKE statement and a wildcard character to select all customers whose last name begins with the letter q or the letter s. Alphbetize the results.
SELECT Customer_Name
FROM customer
WHERE Customer_Name LIKE 'Q%' OR Customer_Name LIKE 'S%'
ORDER BY Customer_Name ASC;

-- g.	Use a regular expression to select all fields in the customer table where the city name begins with A, B, or C.
SELECT *
FROM customer
WHERE customer.Customer_City REGEXP '^[ABC]';

-- h.	Use the GROUP BY and SUM statements to list aggregated sums of order amounts based on the customer id. Sort the results in descending order by the sum of the payment amounts. Which customer had the smallest amount?
SELECT Customer_ID, Customer_Name, 
SUM(`order`.Quantity * product.Product_Unit_Price) AS Total_Amount
FROM customer
JOIN `order` ON customer.Customer_ID = `order`.CustomerID
JOIN product ON `order`.ProductID = product.Product_ID
GROUP BY customer.Customer_ID, customer.Customer_Name
ORDER BY Total_Amount ASC
LIMIT 1;

-- i.	Copy the code from the query above and add a condition to the GROUP BY clause to list only the total amounts greater than $100,000. Which customer had the largest total amount?
SELECT Customer_ID, Customer_Name, 
SUM(`order`.Quantity * product.Product_Unit_Price) AS Total_Amount
FROM customer
JOIN `order` ON customer.Customer_ID = `order`.CustomerID
JOIN product ON `order`.ProductID = product.Product_ID
GROUP BY Customer_ID, Customer_Name
HAVING Total_Amount > 100000
ORDER BY Total_Amount DESC
LIMIT 1;

-- j.	What is the aggregate count of the number of orders in this database?
SELECT COUNT(*) AS Total_Orders
FROM `order`;

-- k.	What is the most popular product ordered, in terms of quantity?
SELECT Product_ID, Product_Name, 
SUM(`order`.Quantity) AS Total_Quantity_Ordered
FROM product
JOIN `order` ON product.Product_ID = `order`.ProductID
GROUP BY product.Product_ID, product.Product_Name
ORDER BY Total_Quantity_Ordered DESC
LIMIT 1;

-- l.	What is the average order revenue by customer? 
SELECT Customer_ID, Customer_Name, 
AVG(`order`.Quantity * Product_Unit_Price) AS Average_Revenue
FROM customer
JOIN `order` ON Customer_ID = `order`.CustomerID
JOIN product ON `order`.ProductID = Product_ID
GROUP BY Customer_ID, Customer_Name;


-- 12. a. How many orders were placed from each city?
SELECT Customer_City, 
COUNT(*) AS Total_Orders
FROM customer
JOIN `order` ON Customer_ID = `order`.CustomerID
GROUP BY Customer_City;

-- 12. b. What is the total revenue generated from all orders?
SELECT SUM(`order`.Quantity * Product_Unit_Price) AS Total_Revenue
FROM `order`
JOIN product ON `order`.ProductID = Product_ID;

-- 12. c. Which products have not been ordered at all?
SELECT Product_ID, Product_Name
FROM product
WHERE Product_ID NOT IN (SELECT `order`.ProductID FROM `order`);




