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
set linesize 160;
set pagesize 175;

PROMPT --- BECOME A PATRON ---

ACCEPT vpatronID PROMPT 'Please enter the PatronID: ';
ACCEPT vFirstName PROMPT 'Please enter First Name: ';
ACCEPT vLastName PROMPT 'Please enter Last Name: ';

INSERT INTO patron VALUES ('&vpatronID', '&vFirstName', '&vLastName');

PROMPT The following record has been added:

SET HEADING ON

SELECT patronID "Patron ID", patron.patronFirstName||' '||patron.patronLastName "Patron" FROM patron WHERE patronID = '&vpatronID';
spool off

