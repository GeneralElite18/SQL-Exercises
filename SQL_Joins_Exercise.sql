/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT categories.Name, products.Name 
FROM products
INNER JOIN categories ON products.CategoryID = categories.CategoryID AND products.CategoryID = 1;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating
FROM products
INNER JOIN reviews ON products.ProductID = reviews.ProductID WHERE reviews.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT sales.EmployeeID, FirstName, LastName, SUM(Quantity)
FROM sales
INNER JOIN employees ON sales.EmployeeID = employees.EmployeeID
GROUP BY sales.EmployeeID
HAVING SUM(Quantity) = (
SELECT SUM(Quantity)
FROM sales
GROUP BY sales.EmployeeID
ORDER BY SUM(Quantity) DESC
LIMIT 1);



/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name AS 'Department Name', categories.Name AS 'Category Name'
FROM departments
INNER JOIN categories ON categories.DepartmentID = departments.DepartmentID
WHERE categories.Name = 'Appliances' OR categories.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name, SUM(sales.Quantity), SUM(sales.PricePerUnit * sales.Quantity)
FROM sales
INNER JOIN products ON products.ProductID = sales.ProductID 
WHERE products.Name = 'Eagles: Hotel California';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT Name, Reviewer, Rating, Comment
FROM reviews
INNER JOIN products ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 1 AND Name = "Visio TV";

-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */

SELECT sales.EmployeeID, FirstName, LastName, Name, SUM(Quantity)
FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products ON sales.ProductID = products.ProductID
GROUP BY sales.EmployeeID, sales.ProductID;


