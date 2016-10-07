create database gboard;

use gboard;

create table guestboard(
name varchar(10),
email varchar(50),
inputdate varchar(40) primary key,
subject varchar(20),
content text);