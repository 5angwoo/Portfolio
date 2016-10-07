create database univdb;
use univdb;
create table board(
	id int not null primary key auto_increment,
	name varchar(20) not null,
	passwd varchar(20) not null,
	title varchar(100) null,
	email varchar(30) null,
	regdate datetime null,
	content text null
);