spool c:\Users\cpina\Desktop\libraryUserInteraction.txt

SET FEEDBACK OFF
SET HEADING OFF
SET ECHO OFF
SET VERIFY OFF
ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY';


COLUMN bookTitle HEADING "Book Title";
COLUMN categoryName HEADING "Category";
COLUMN "Author" FORMAT A18;
COLUMN "Patron" FORMAT A18;
COLUMN "Patron ID" FORMAT A10;
COLUMN "Checkout Date" FORMAT A14;

set linesize 160;
set pagesize 175;

PROMPT --- BECOME A PATRON ---

ACCEPT vpatronID PROMPT 'Please enter the PatronID: ';
ACCEPT vFirstName PROMPT 'Please enter First Name: ';
ACCEPT vLastName PROMPT 'Please enter Last Name: ';

INSERT INTO patron VALUES ('&vpatronID', '&vFirstName', '&vLastName');

PROMPT The following record has been added:

SET HEADING ON

SELECT patronID "Patron ID", patron.patronFirstName||' '||patron.patronLastName "Patron"
	FROM patron 
	WHERE patronID = '&vpatronID';

PROMPT --- LOOKUP BOOK BY TITLE ---


ACCEPT vbookTitle PROMPT 'Please enter full title of book: '; 
SELECT b.bookTitle, c.categoryName, a.authorFirstName||' '||a.authorLastName "Author"
	FROM category C, author A, book B
	WHERE c.categoryID = b.categoryID
	AND a.authorID = b.authorID
	AND b.booktitle = '&vbookTitle';

PROMPT --- LOOKUP ALL BOOKS BORROWED BY A PATRON ---


ACCEPT vPatronID PROMPT 'Please enter the Patron ID (11116): ';
SELECT book.bookTitle, patron.patronFirstName||' '||patron.patronLastName "Patron", loans.checkoutDate "Checkout Date"
	FROM book, loans, patron
	WHERE book.isbn = loans.isbn
	AND patron.patronID = loans.patronID
	AND loans.patronID = '&vPatronID';
spool off

