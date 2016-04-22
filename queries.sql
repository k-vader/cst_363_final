PROMPT --- Print a list of all books in inventory ---;

select b.bookTitle, c.categoryName, a.authorFirstName, a.authorLastName 
	FROM category C, author A, book B
	WHERE c.categoryID = b.categoryID
	AND a.authorID = b.authorID;

PROMPT ---SHOW ALL BOOKS THAT NEED TO BE RETURNED---;
SELECT book.bookTitle, patron.patronFirstName, patron.patronLastName, loans.returnDate
	FROM book, loans, patron
	WHERE book.isbn = loans.isbn
	AND patron.patronID = loans.patronID
	AND loans.returnDate > (SELECT sysdate FROM dual);

PROMPT ---SHOW ALL BOOKS THAT HAVE NEVER BEEN CHECKED OUT---;
SELECT isbn, bookTitle
	FROM book
	WHERE isbn NOT IN (SELECT isbn FROM Loans);