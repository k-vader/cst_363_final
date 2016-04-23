spool c:\Users\cpina\Desktop\createLibraryDB.txt

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
	patronFirstName varchar(15),
	patronLastName varchar(15));


Create table Author
	(authorID char(5) primary key,
	authorFirstName varchar(15), 
	authorLastName varchar(15));


Create table Book
	(isbn char(10) primary key, 
	bookTitle char(30),
	authorId char(5), 
	categoryID char(5),
	constraint fk_authorID foreign key (authorID) references Author (authorID), 
	constraint fk_categoryID foreign key (categoryID) references Category (categoryID));

Create table Loans 
	(isbn char(10),
    checkoutDate DATE,  
	returnDate DATE, 
	patronID char(5), 
	constraint fk_patronID foreign key (patronID) references Patron (patronID),
	constraint fk_isbn foreign key (isbn) references Book (isbn),
	constraint pk_loans primary key (isbn, checkoutDate));

SPOOL OFF