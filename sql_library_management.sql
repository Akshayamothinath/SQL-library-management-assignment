CREATE DATABASE library_db;
USE library_db;

CREATE TABLE books(
book_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(100) NOT NULL,
isbn VARCHAR(20) UNIQUE,
price DECIMAL(8,2),
published_date DATE,
int_stock INT DEFAULT 1);

SHOW TABLES;
DESC books;

ALTER TABLE books RENAME COLUMN int_stock TO in_stock;

-- Q2 INSERTING DATA
INSERT INTO books(title,isbn,price,published_date,in_stock) VALUES 
('Java Programming', '9781111111111', 450.00, '2022-01-15', 10),
('Python Basics', '9782222222222', 550.00, '2021-08-20', 5),
('Database Systems', '9783333333333', 600.00, '2020-12-10', 8),
('Web Development', '9784444444444', 700.00, '2023-03-05', 12),
('Data Structures', '9785555555555', 500.00, '2021-06-18', 7);

-- Q3 RENAME A COLUMN
ALTER TABLE books RENAME COLUMN title TO book_title;

SELECT * FROM books;

-- Q4 change a columns data type
ALTER TABLE books MODIFY COLUMN price FLOAT;

-- Q5 ADDING A NEW COLUMN WITH A CONSTAINT
ALTER TABLE books ADD COLUMN author_name VARCHAR(50) NOT NULL DEFAULT'Unknown';

-- Q6 UPDATING EXISING DATA
-- SUPPOSE BOOK =500 ...10% OF 500=50 so 500-50=450.....new price=old price*0.9 beacuse 90%
SET SQL_SAFE_UPDATES = 0;
UPDATE books SET price = price * 0.9 WHERE published_date < '2020-01-01';
SET SQL_SAFE_UPDATES = 1;

-- Q7
SET SQL_SAFE_UPDATES = 0;
DELETE FROM books WHERE in_stock =0;
SET SQL_SAFE_UPDATES = 1;

-- Q8
ALTER TABLE books AUTO_INCREMENT = 101;

-- Q9
SELECT book_title,price,published_date FROM books WHERE book_title 
LIKE '%Python Basics%' AND price >500 ORDER BY price desc;

-- Q10 Create Members table
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    member_name VARCHAR(100) NOT NULL,
    join_date DATE NOT NULL DEFAULT (CURDATE())
);


INSERT INTO Members (member_name, join_date)
VALUES
('Akash', '2024-02-15'),
('Priya', '2024-08-20'),
('Ravi', '2023-11-10'),
('Sneha', '2024-05-12');

SELECT *
FROM Members
WHERE YEAR(join_date) = 2024
ORDER BY member_name ASC;