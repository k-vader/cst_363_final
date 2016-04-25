spool c:\Users\cpina\Desktop\libraryQueries.txt

SET FEEDBACK OFF;
ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY';


COLUMN bookTitle HEADING "Book Title";
COLUMN categoryName HEADING "Category";
COLUMN "Patron ID" FORMAT A10;

COLUMN "Author" FORMAT A18;
COLUMN "Patron" FORMAT A18;
COLUMN "Return Date" FORMAT A12;
set linesize 160;
set pagesize 175;

PROMPT --- LIST OF ALL BOOKS IN INVENTORY ---;
SELECT b.bookTitle, c.categoryName, a.authorFirstName||' '||a.authorLastName "Author"
	FROM category C, author A, book B
	WHERE c.categoryID = b.categoryID
	AND a.authorID = b.authorID;
PROMPT
PROMPT
PROMPT
PROMPT ---BOOKS THAT NEED TO BE RETURNED---;
SELECT book.bookTitle, patron.patronFirstName||' '||patron.patronLastName "Patron", loans.returnDate "Return Date"
	FROM book, loans, patron
	WHERE book.isbn = loans.isbn
	AND patron.patronID = loans.patronID
	AND loans.returnDate > (SELECT sysdate FROM dual);
PROMPT
PROMPT
PROMPT
PROMPT ---BOOKS THAT HAVE NEVER BEEN CHECKED OUT---;
SELECT isbn, bookTitle
	FROM book
	WHERE isbn NOT IN (SELECT isbn FROM Loans);

spool off