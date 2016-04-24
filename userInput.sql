/* Display all book info **/
prompt `Here is a list of books in our library`;
SELECT * 
FROM Book;

/* Query for book by title */
accept bookInput prompt 'Please enter full title of book: ';
SELECT * 
FROM Book 
WHERE bookTitle='&bookInput';

/* Look up loan status by ISBN */
accept isbnInput prompt 'Please enter the ISBN to see if anyone else has it checked out, 0 means available: ';

SELECT COUNT(isbn)
FROM Loans
WHERE EXISTS (
    SELECT isbn
    FROM Book
	WHERE Loans.isbn = '&isbnInput'
	);
	
/* Insert some data */
accept userISBNInput prompt 'Please enter ISBN to insert: ';
accept userTitleInput prompt 'Please enter book title: ';
accept authorIDInput prompt 'Please enter author ID: ';
accept categoryIDInput prompt 'Please enter category ID: ';
INSERT INTO Book VALUES ('&userISBNInput', '&userTitleInput', '&authorIDInput', '&categoryIDInput');

/* Display prompt and title */
prompt 'Thank you for adding this book: ';
prompt 'Title: &userTitleInput';

/* Display author */
SELECT 'Author: ', authorFirstName, authorLastName
FROM Author
JOIN Book
ON Book.authorID = Author.authorID
WHERE Book.isbn = '&userISBNInput';

/* Display category name */
SELECT 'Category: ', categoryName
FROM Category
JOIN Book
ON Book.categoryID = Category.categoryID
WHERE Category.categoryID = '&categoryIDInput'
AND ROWNUM = 1;