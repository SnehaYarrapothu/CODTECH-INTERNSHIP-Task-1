
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| demo               |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.00 sec)

mysql> create database Library_Management_System;
Query OK, 1 row affected (0.01 sec)

mysql> use Library_Management_System;
Database changed
mysql>  create table Books(BookID int primary key,Title varchar(100),Author varchar(100),Genre varchar(50),PublishedYear int,Quantity int);
Query OK, 0 rows affected (0.03 sec)

mysql> create table members (memberid int primary key, name varchar(100), address varchar(150), email varchar(100), phonenumber varchar(15), membershipdate date);
Query OK, 0 rows affected (0.04 sec)

mysql> create table transactions (transactionid int primary key, bookid int, memberid int, borrowdate date, returndate date, foreign key (bookid) references books(bookid), foreign key (memberid) references members(memberid));
Query OK, 0 rows affected (0.09 sec)

mysql> insert into books (bookid, title, author, genre, publishedyear, quantity) values (1, 'the great gatsby', 'f. scott fitzgerald', 'fiction', 1925, 5);
Query OK, 1 row affected (0.04 sec)

mysql> show tables;
+-------------------------------------+
| Tables_in_library_management_system |
+-------------------------------------+
| books                               |
| members                             |
| transactions                        |
+-------------------------------------+
3 rows in set (0.03 sec)

mysql> select * from Books;
+--------+------------------+---------------------+---------+---------------+----------+
| BookID | Title            | Author              | Genre   | PublishedYear | Quantity |
+--------+------------------+---------------------+---------+---------------+----------+
|      1 | the great gatsby | f. scott fitzgerald | fiction |          1925 |        5 |
+--------+------------------+---------------------+---------+---------------+----------+
1 row in set (0.01 sec)

mysql> insert into books (bookid, title, author, genre, publishedyear, quantity) values (2, '1984', 'george orwell', 'dystopian', 1949, 8), (3, 'to kill a mockingbird', 'harper lee', 'fiction', 1960, 6), (4, 'moby dick', 'herman melville', 'adventure', 1851, 4), (5, 'the catcher in the rye', 'j.d. salinger', 'fiction', 1951, 7);                              Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into members (memberid, name, address, email, phonenumber, membershipdate) values (1, 'john doe', '123 street a', 'john.doe@example.com', '1234567890', '2022-01-15'), (2, 'jane smith', '456 street b', 'jane.smith@example.com', '0987654321', '2022-03-20'), (3, 'sam wilson', '789 street c', 'sam.wilson@example.com', '1122334455', '2023-05-05'), (4, 'mary johnson', '101 street d', 'mary.johnson@example.com', '2233445566', '2023-07-10'), (5, 'peter parker', '102 street e', 'peter.parker@example.com', '3344556677', '2024-09-18');
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> insert into transactions (transactionid, bookid, memberid, borrowdate, returndate) values (1, 1, 1, '2024-10-01', '2024-10-10'), (2, 2, 2, '2024-10-05', '2024-10-15'), (3, 3, 3, '2024-10-08', '2024-10-18'), (4, 4, 4, '2024-10-10', '2024-10-20'), (5, 5, 5, '2024-10-15', '2024-10-25');
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from Books;
+--------+------------------------+---------------------+-----------+---------------+----------+
| BookID | Title                  | Author              | Genre     | PublishedYear | Quantity |
+--------+------------------------+---------------------+-----------+---------------+----------+
|      1 | the great gatsby       | f. scott fitzgerald | fiction   |          1925 |        5 |
|      2 | 1984                   | george orwell       | dystopian |          1949 |        8 |
|      3 | to kill a mockingbird  | harper lee          | fiction   |          1960 |        6 |
|      4 | moby dick              | herman melville     | adventure |          1851 |        4 |
|      5 | the catcher in the rye | j.d. salinger       | fiction   |          1951 |        7 |
+--------+------------------------+---------------------+-----------+---------------+----------+
5 rows in set (0.00 sec)

mysql> select * from members;
+----------+--------------+--------------+--------------------------+-------------+----------------+
| memberid | name         | address      | email                    | phonenumber | membershipdate |
+----------+--------------+--------------+--------------------------+-------------+----------------+
|        1 | john doe     | 123 street a | john.doe@example.com     | 1234567890  | 2022-01-15     |
|        2 | jane smith   | 456 street b | jane.smith@example.com   | 0987654321  | 2022-03-20     |
|        3 | sam wilson   | 789 street c | sam.wilson@example.com   | 1122334455  | 2023-05-05     |
|        4 | mary johnson | 101 street d | mary.johnson@example.com | 2233445566  | 2023-07-10     |
|        5 | peter parker | 102 street e | peter.parker@example.com | 3344556677  | 2024-09-18     |
+----------+--------------+--------------+--------------------------+-------------+----------------+
5 rows in set (0.00 sec)

mysql> select * from transactions
    -> ;
+---------------+--------+----------+------------+------------+
| transactionid | bookid | memberid | borrowdate | returndate |
+---------------+--------+----------+------------+------------+
|             1 |      1 |        1 | 2024-10-01 | 2024-10-10 |
|             2 |      2 |        2 | 2024-10-05 | 2024-10-15 |
|             3 |      3 |        3 | 2024-10-08 | 2024-10-18 |
|             4 |      4 |        4 | 2024-10-10 | 2024-10-20 |
|             5 |      5 |        5 | 2024-10-15 | 2024-10-25 |
+---------------+--------+----------+------------+------------+
5 rows in set (0.00 sec)

mysql> update Books set Quantity=Quantity-1 where BookID=1;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Books;
+--------+------------------------+---------------------+-----------+---------------+----------+
| BookID | Title                  | Author              | Genre     | PublishedYear | Quantity |
+--------+------------------------+---------------------+-----------+---------------+----------+
|      1 | the great gatsby       | f. scott fitzgerald | fiction   |          1925 |        4 |
|      2 | 1984                   | george orwell       | dystopian |          1949 |        8 |
|      3 | to kill a mockingbird  | harper lee          | fiction   |          1960 |        6 |
|      4 | moby dick              | herman melville     | adventure |          1851 |        4 |
|      5 | the catcher in the rye | j.d. salinger       | fiction   |          1951 |        7 |
+--------+------------------------+---------------------+-----------+---------------+----------+
5 rows in set (0.00 sec)

mysql> delete from transactions where memberid = 2;
Query OK, 1 row affected (0.01 sec)

mysql> delete from members where memberid = 2;
Query OK, 1 row affected (0.01 sec)

mysql> delete from books where bookid = 2;
Query OK, 1 row affected (0.02 sec)

mysql> select * from Books;
+--------+------------------------+---------------------+-----------+---------------+----------+
| BookID | Title                  | Author              | Genre     | PublishedYear | Quantity |
+--------+------------------------+---------------------+-----------+---------------+----------+
|      1 | the great gatsby       | f. scott fitzgerald | fiction   |          1925 |        4 |
|      3 | to kill a mockingbird  | harper lee          | fiction   |          1960 |        6 |
|      4 | moby dick              | herman melville     | adventure |          1851 |        4 |
|      5 | the catcher in the rye | j.d. salinger       | fiction   |          1951 |        7 |
+--------+------------------------+---------------------+-----------+---------------+----------+
4 rows in set (0.00 sec)

mysql> select * from members;
+----------+--------------+--------------+--------------------------+-------------+----------------+
| memberid | name         | address      | email                    | phonenumber | membershipdate |
+----------+--------------+--------------+--------------------------+-------------+----------------+
|        1 | john doe     | 123 street a | john.doe@example.com     | 1234567890  | 2022-01-15     |
|        3 | sam wilson   | 789 street c | sam.wilson@example.com   | 1122334455  | 2023-05-05     |
|        4 | mary johnson | 101 street d | mary.johnson@example.com | 2233445566  | 2023-07-10     |
|        5 | peter parker | 102 street e | peter.parker@example.com | 3344556677  | 2024-09-18     |
+----------+--------------+--------------+--------------------------+-------------+----------------+
4 rows in set (0.00 sec)

mysql> select * from transactions;
+---------------+--------+----------+------------+------------+
| transactionid | bookid | memberid | borrowdate | returndate |
+---------------+--------+----------+------------+------------+
|             1 |      1 |        1 | 2024-10-01 | 2024-10-10 |
|             3 |      3 |        3 | 2024-10-08 | 2024-10-18 |
|             4 |      4 |        4 | 2024-10-10 | 2024-10-20 |
|             5 |      5 |        5 | 2024-10-15 | 2024-10-25 |
+---------------+--------+----------+------------+------------+
4 rows in set (0.00 sec)
