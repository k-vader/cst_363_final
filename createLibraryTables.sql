
set echo on

spool c:\Users\Ken\Desktop\createLibraryTable.txt

drop table Loans;
drop table Book;
drop table Author;
drop table Patron;
drop table Category;

Create table Category
(categoryID char(5) primary key,
categoryName char(20));

Create table Patron
(patronID char(5) primary key,
patronFirstName char(15),
patronLastName char(15));

Create table Author
(authorID char(5) primary key,
authorFirstName char(15),
authorLastName char(15));

Create table Book
(isbn char(20) primary key,
bookTitle char(30),
authorID char(5),
categoryID char(5),
constraint fk_authorID foreign key (authorID) references Author (authorID),
constraint fk_categoryID foreign key (categoryID) references Category (categoryID));

Create table Loans
(loanID char(5) primary key,
returnDate date,
patronID char(5),
isbn char(20),
constraint fk_patronID foreign key (patronID) references Patron (patronID),
constraint fk_isbn foreign key (isbn) references Book (isbn));

spool off