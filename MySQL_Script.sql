USE store;
SELECT * FROM customers;
SELECT * FROM customers ORDER BY first_name;

#Create a new query to find all the customers with a birth date of > '1990-01-01'

SELECT * FROM customers 
WHERE birth_date > '1990-01-01';

#Write a query to find all customers whose first_name starts with the letter M and last_name starts with the letter A.

SELECT * FROM customers 
WHERE first_name LIKE 'M%' AND last_name LIKE 'A%';

#Write a statement to show  last_name, first_name and points In the output

SELECT last_name, first_name, points FROM customers; 

#Write a query to find the minimum and maximum points

SELECT MIN(points), MAX(points) FROM customers;

#Additional Query 1. RETURN products with quantity_in_stock equal to 70,90,26

SELECT * FROM products
WHERE quantity_in_stock IN (70,90,26);

#Additional Query 2. Select  order_id 2 from order_items table based on their total_price (quantity * unit_price) and sort them desc order

SELECT *, quantity * unit_price as total_price 
FROM order_items WHERE order_id = 2
ORDER BY total_price DESC;

#Additional Query 3. 
write a query to produce a report with customer_id, first_name, last_name, points and type. 
Type doesn't exist in customer's column. So we have to calculate this column with the values following this condition
Points less than 2,000 'Bronze'
points between 2,000 and 3,000 'Silver' and
points more than 3,000 'Gold'

SELECT customer_id, first_name, last_name, points, 'Bronze' as type
FROM customers
WHERE points > 2000
UNION
SELECT customer_id, first_name, last_name, points, 'Silver' as type
FROM customers
WHERE points between 2000 and 3000
UNION
SELECT customer_id, first_name, last_name, points, 'Gold' as type
FROM customers
WHERE points > 3000;

#primary keys 
customers(customer_id)
order_items (order_id, product_id)
order_statuses (order_status_id)
orders (order_id)
products(product_id)
shippers(shipper_id)

#foreign keys
customers  No Foreign key           
order_items (product_id from products, order_id from orders)
order_statuses   No Foreign key        
orders (shipper_id from shippers, orders_status_id from order_statuses, customer_id from customers)
products No Foreign key
shippers  No Foreign key