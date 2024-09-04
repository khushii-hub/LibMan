-- Create the Database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Create the Books Table
CREATE TABLE Books (
    isbn VARCHAR(13) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    isAvailable BOOLEAN DEFAULT TRUE
);

-- Create the Members Table
CREATE TABLE Members (
    memberId VARCHAR(10) PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create the BorrowedBooks Table
CREATE TABLE BorrowedBooks (
    memberId VARCHAR(10),
    isbn VARCHAR(13),
    borrowDate DATE,
    returnDate DATE,
    FOREIGN KEY (memberId) REFERENCES Members(memberId),
    FOREIGN KEY (isbn) REFERENCES Books(isbn)
);

-- Insert Data into Books Table
INSERT INTO Books (isbn, title, author) VALUES 
('1234567890', 'The Great Gatsby', 'F. Scott Fitzgerald'),
('0987654321', '1984', 'George Orwell'),
('1122334455', 'To Kill a Mockingbird', 'Harper Lee');

-- Insert Data into Members Table
INSERT INTO Members (memberId, name) VALUES 
('M001', 'Alice'),
('M002', 'Bob');

-- Find All Available Books
SELECT * FROM Books WHERE isAvailable = TRUE;

-- Borrow a Book (Update Availability and Record in BorrowedBooks)
UPDATE Books 
SET isAvailable = FALSE 
WHERE isbn = '1234567890';

INSERT INTO BorrowedBooks (memberId, isbn, borrowDate) 
VALUES ('M001', '1234567890', CURDATE());

-- Return a Book (Update Availability and Record Return Date)
UPDATE Books 
SET isAvailable = TRUE 
WHERE isbn = '1234567890';

UPDATE BorrowedBooks 
SET returnDate = CURDATE() 
WHERE isbn = '1234567890' AND memberId = 'M001' AND returnDate IS NULL;

-- List All Borrowed Books by a Member
SELECT b.isbn, b.title, bb.borrowDate 
FROM Books b
JOIN BorrowedBooks bb ON b.isbn = bb.isbn
WHERE bb.memberId = 'M001' AND bb.returnDate IS NULL;
