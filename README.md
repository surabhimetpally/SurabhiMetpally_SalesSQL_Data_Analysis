# Sales Data Analysis Project
<img width="632" alt="Screenshot 2024-10-12 at 7 27 10 PM" src="https://github.com/user-attachments/assets/e92673d1-c8d0-4299-8212-ad391ab370c5">

## About
This project focuses on the analysis of sales data using MySQL Workbench. The primary objective is to create a SALE schema, define relationships among tables, and manipulate data to extract meaningful insights regarding customer behavior, order patterns, and product performance.

## Purposes of the Project
The main goal of this project is to understand the sales dynamics by analyzing various factors influencing sales across customers, products, and locations.

### Data Analysis:
The project involves importing data from CSV files into a MySQL database, creating a schema, and defining relationships between tables.

1. **Analysis of the ERD:**
    - I thoroughly examined the Entity-Relationship Diagram (ERD) to understand the relationships between entities such as customers, orders, and products.
    - I identified primary keys (PK) for each table to ensure data integrity and established foreign keys (FK) to define relationships. For example, the Order table references the Customer and Product tables, ensuring each order is associated with a specific customer and product.
    - The relationships were clearly defined, allowing for efficient data retrieval and analysis through SQL queries.

## About the Data
The dataset used in this project is sourced from three CSV files, which contain transaction data. Each table in the SALE schema captures different aspects of the sales process. The tables are:

- **Customer Table:** Information about customers, including demographics and identifiers.
- **Order Table:** Records of sales transactions, linking customers and products.
- **Product Table:** Details about the products being sold.

### Table Structure
- **Customer Table**
    - `Customer_ID` (Primary Key)
    - `Customer_Name`
    - `Customer_City`
    - `Customer_State`
    - `Customer_Zip_Code`

- **Order Table**
    - `Order_ID` (Primary Key)
    - `ProductID` (Foreign Key)
    - `Quantity`
    - `Unit_Price`
    - `Unit_Cost`
    - `CustomerID` (Foreign Key)
    - `SalesRep_ID`

- **Product Table**
    - `Product_ID` (Primary Key)
    - `Product_Name`
    - `Product_Desc`
    - `Product_Unit_Price`
    - `Product_Reorder_Level`
    - `Product_Lead_Time`
    - `Product_Qty_On_Hand`
    - `Supplier_ID`

### Business Rules
- Each customer is uniquely identified by their `CustomerID`.
- An order can only be associated with one customer, identified by the `CustomerID` in the Order table.
- A product can be ordered multiple times, as indicated by the relationship between Order and Product.
- Each product has a defined `ProductUnitPrice`. This price remains constant for all orders unless explicitly changed.
- The `ProductQuantityOnHand` attribute indicates the number of units of a product currently available in stock.

## Business Questions Answered
-  What is the best customer in terms of the one who has ordered the most total units (quantity)?
- What are the sums of quantities of the orders for each customer in VA? Include a rollup of total quantities.
- Who are the top ten customers in total revenue (unit price * quantity)?
- What are the revenues by state with rollup?
- What is the count of customers in this data?
f. Use the `LIKE` statement and a wildcard character to select all customers whose last name begins with the letter Q or S. Alphabetize the results.
g. Use a regular expression to select all fields in the customer table where the city name begins with A, B, or C.
h. Use the `GROUP BY` and `SUM` statements to list aggregated sums of order amounts based on the customer ID. Sort the results in descending order by the sum of the payment amounts. Which customer had the smallest amount?
i. Add a condition to the `GROUP BY` clause to list only the total amounts greater than $100,000. Which customer had the largest total amount?
j. What is the aggregate count of the number of orders in this database?
k. What is the most popular product ordered, in terms of quantity?
l. What is the average order revenue by customer?



