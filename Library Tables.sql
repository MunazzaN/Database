create schema lms;



create table library_member(member_id int primary key,first_name varchar(25),last_name varchar(25),email_address varchar(35),phone_number bigint,membership_level varchar(10),address_id int,foreign key(address_id) references address(address_id));
create table address(address_id int primary key,line1 varchar(30),line2 varchar(30),city varchar(20),state char(2),zip int);
create table checkout(id int primary key,isbn bigint,member_id int,checkout_date datetime,due_date datetime,is_returned boolean,foreign key(isbn) references book_isbn(isbn),foreign key(member_id) references library_member(member_id));
create table book_isbn(isbn bigint primary key,book_id int,foreign key(book_id) references book(book_id)) ;
create table book(book_id int primary key,title varchar(45),author_name varchar(50), year_published int,quantity int);





insert into book values(1,"Introduction to Java","Ganesh",2012,30);
insert into book values(2,"Numpy and Pandas","Divya",2010,30);
insert into book values(3,"Convolutional Neural Networks","Aishwarya",2011,30);
insert into book values(4,"Django MVT Frame work","Kumar",2014,30);
insert into book values(5,"Introuction to Flask Web Development","Shiva",2016,30);
insert into book values(6,"Graph Neural Networks","Shivani",2013,30);

-- inserting into  table book_isbn
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,1);
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,2);
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,3);
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,4);
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,5);
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,6);
--
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,6);
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,5);
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,4);
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,3);
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,2);
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,1);
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,1);
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,2);
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,3);
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,4);
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,5);
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,6);
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,1);
insert into book_isbn(SELECT FLOOR(1000000000000 + RAND() * 9000000000000) AS random_isbn,2);

--
insert into address values(11,"2206 west hickory","david street","denton",'TX',76201);
insert into address values(12,"1174 UC Denton","south bonnie brae street","denton",'TX',76202);
insert into address values(13,"1706 wood hill apartments","teasley lane","denton",'TX',76205);
insert into address values(14,"1555 Oaks Of Denton ","Fry Street","denton",'TX',76203);
insert into address values(15,"East Park Apartments","Welch Street","denton",'TX',76204);
insert into address values(16,"621 The Beverley At Denton","West University Drive","denton",'TX',76206);


--

insert into library_member values(401,"Aishwarya","Maroju","aishwaryamaroju5@gmail.com",4697020642,"silver",11);
insert into library_member values(402,"Nagasri","Maroju","nagasrimaroju5@gmail.com",4697020111,"silver",11);
insert into library_member values(403,"ramya","Ananthoju","ramyaananthoju15@gmail.com",4697020222,"gold",12);
insert into library_member values(404,"Kiran","Mandadi","kiranmandadi45@gmail.com",4697020333,"platinum",13);
insert into library_member values(405,"Vaishnav","Varma","vaishnavvarma77@gmail.com",4697020444,"platinum",14);
insert into library_member values(406,"Sridevi","Reddy","sridevireddy99@gmail.com",4697020555,"silver",15);
insert into library_member values(407,"Bhumi","Chowdary","bhumichowdary66@gmail.com",4697020666,"gold",16);
insert into library_member values(408,"Manish","Mallela","manasamallela89@gmail.com",4697020777,"silver",14);
insert into library_member values(409,"kavya","Mallela","kavyamallela55@gmail.com",4697020888,"platinum",14);
insert into library_member values(410,"Srinidhi","Ananthoju","sreenidhiananthoju333@gmail.com",4697020999,"silver",12);
-- Today's Assignment

-- find the member by name and mobile_number
SELECT *
FROM library_member
WHERE first_name = 'Aishwarya' 
    AND last_name = 'Maroju' 
    AND phone_number = 4697020642;
    
    -- display all the members
    
    select * from library_member;
    
    -- list all the books a member has checked out
    SELECT b.title, b.author_name, b.year_published
FROM library_member m
JOIN checkout c ON m.member_id = c.member_id
JOIN book_isbn bi ON c.isbn = bi.isbn
JOIN book b ON bi.book_id = b.book_id
WHERE m.first_name = 'Aishwarya' 
    AND m.last_name = 'Maroju';
    
    -- checkout a book for a given member and given book
    select * from checkout;
    select * from book_isbn;
    insert into checkout values(711,9002985256726,401,now()-15,now()-2,0);





 -- checkout a book for a given member and given book
select * from book;




-- given book='Introuction to Flask Web Development' book id=5
-- given member ="Aishwarya" member id=401
 select isbn from book_isbn where book_id=5;
 
 insert into checkout values(710,9315260938662,401,DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY),DATE_ADD(CURRENT_DATE(), INTERVAL 15 DAY),0);
-- list avaialble books and quantity that can be checked out
SELECT 
    b.book_id,
    b.title,
    b.author_name,
    b.year_published,
    b.quantity - COALESCE(SUM(CASE WHEN c.is_returned = FALSE THEN 1 ELSE 0 END), 0) AS available_quantity
FROM 
    book b
LEFT JOIN 
    book_isbn bi ON b.book_id = bi.book_id
LEFT JOIN 
    checkout c ON bi.isbn = c.isbn
GROUP BY 
    b.book_id, b.title, b.author_name, b.year_published, b.quantity;
    
select * from checkout;
-- list all the checkouts that are due in fifteen days
SELECT *
FROM checkout
WHERE DATEDIFF(due_date, CURRENT_DATE()) =15;

--  list all the checkouts that are over due 
select * from checkout;
update checkout set due_date=DATE_SUB(NOW(), INTERVAL 20 DAY),checkout_date=DATE_SUB(NOW(), INTERVAL 2 DAY) where id=702;
SELECT *
FROM checkout
WHERE due_date < CURRENT_DATE();


-- list all the books that are checked out today
SELECT DISTINCT b.*,c.*
FROM book b
JOIN book_isbn bi ON b.book_id = bi.book_id
JOIN checkout c ON bi.isbn = c.isbn
WHERE DATE(c.checkout_date) = CURDATE();

-- select * from checkout;
-- update checkout set checkout_date=now() where id=701;


-- -- create a book
-- display all isbns and their checkout status along with book information ( tital, author etc,.)

SELECT bi.isbn, b.title, b.author_name, b.year_published, b.quantity,
       CASE WHEN c.is_returned = FALSE THEN 'Checked Out' ELSE 'Available' END AS checkout_status
FROM book b
JOIN book_isbn bi ON b.book_id = bi.book_id
LEFT JOIN checkout c ON bi.isbn = c.isbn;








