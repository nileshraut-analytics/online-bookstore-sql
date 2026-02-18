/* =========================
   BASIC QUERIES
   ========================= */

-- View all records
SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- Retrieve all books in Fiction genre
SELECT * FROM Books
WHERE Genre = 'Fiction';

-- Books published after 1950
SELECT * FROM Books
WHERE Published_Year > 1950
ORDER BY Published_Year;

-- Customers from Canada
SELECT * FROM Customers
WHERE Country = 'Canada';

-- Orders placed in November 2023
SELECT * FROM Orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

-- Total stock available
SELECT SUM(Stock) AS Total_Stock
FROM Books;

-- Most expensive book
SELECT * FROM Books
ORDER BY Price DESC
LIMIT 1;

-- Customers who ordered more than 1 quantity
SELECT c.Name, c.City, c.Country, o.Quantity
FROM Customers c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
WHERE o.Quantity > 1;

-- Orders exceeding $20
SELECT * FROM Orders
WHERE Total_Amount > 20
ORDER BY Total_Amount;

-- List all genres
SELECT DISTINCT Genre
FROM Books;

-- Book with lowest stock
SELECT * FROM Books
ORDER BY Stock
LIMIT 1;

-- Total revenue
SELECT SUM(Total_Amount) AS Total_Revenue
FROM Orders;


/* =========================
   ADVANCED BUSINESS QUERIES
   ========================= */

-- Total books sold per genre
SELECT b.Genre, SUM(o.Quantity) AS Total_Quantity_Sold
FROM Orders o
JOIN Books b
ON o.Book_ID = b.Book_ID
GROUP BY b.Genre;

-- Average price of Fantasy books
SELECT AVG(Price) AS Average_Price
FROM Books
WHERE Genre = 'Fantasy';

-- Customers placing large quantity orders
SELECT c.Name, o.Quantity
FROM Customers c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
WHERE o.Quantity >= 2
ORDER BY o.Quantity DESC;

-- Most frequently ordered book
SELECT o.Book_ID, b.Title, COUNT(o.Order_ID) AS Most_Ordered
FROM Orders o
JOIN Books b
ON o.Book_ID = b.Book_ID
GROUP BY o.Book_ID, b.Title
ORDER BY Most_Ordered DESC
LIMIT 1;

-- Top 3 most expensive Fantasy books
SELECT Title, Genre, Price
FROM Books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3;

-- Total books sold per author
SELECT b.Author, SUM(o.Quantity) AS Total_Books_Sold
FROM Orders o
JOIN Books b
ON o.Book_ID = b.Book_ID
GROUP BY b.Author;

-- Cities with high-spending customers
SELECT DISTINCT c.City
FROM Customers c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
WHERE o.Total_Amount > 30;

-- Customer who spent the most
SELECT c.Name, SUM(o.Total_Amount) AS Total_Spent
FROM Customers c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Name
ORDER BY Total_Spent DESC
LIMIT 1;

-- Remaining stock after fulfilling orders
SELECT 
    b.Book_ID,
    b.Title,
    b.Stock,
    COALESCE(SUM(o.Quantity), 0) AS Ordered_Quantity,
    b.Stock - COALESCE(SUM(o.Quantity), 0) AS Remaining_Stock
FROM Books b
LEFT JOIN Orders o
ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID;
