/* =========================
   SAMPLE DATA INSERTION
   ========================= */

INSERT INTO Books (Title, Author, Genre, Published_Year, Price, Stock)
VALUES
('Atomic Habits', 'James Clear', 'Self-Help', 2018, 499, 20),
('Harry Potter', 'J.K. Rowling', 'Fantasy', 1997, 799, 15),
('The Alchemist', 'Paulo Coelho', 'Fiction', 1988, 399, 25),
('Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 1997, 599, 18),
('Game of Thrones', 'George R.R. Martin', 'Fantasy', 1996, 899, 10);


INSERT INTO Customers (Name, Email, Phone, City, Country)
VALUES
('Nilesh Raut', 'nilesh@email.com', '9876543210', 'Mumbai', 'India'),
('John Smith', 'john@email.com', '9876543211', 'Toronto', 'Canada'),
('Alice Brown', 'alice@email.com', '9876543212', 'New York', 'USA');


INSERT INTO Orders (Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
VALUES
(1, 2, '2023-11-05', 2, 1598),
(2, 3, '2023-11-10', 1, 399),
(3, 5, '2023-11-15', 3, 2697);
