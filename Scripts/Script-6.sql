use univdb;
create table student(
	id varchar(50) not null,
	passwd varchar(50) not null,
	name varchar(10) not null,
	joinyear varchar(10) not null,
	stunum varchar(10) not null,
	major varchar(10) not null,
	phonea varchar(10) not null,
	phoneb varchar(20) not null,
	address varchar(50) not null,
	email varchar(50) not null
);

insert into student(id, passwd, name, joinyear, stunum, major, phonea, phoneb, address, email)
values( 'gongji','young','공지영','2009','2065787','컴공','016','4562-1354','인천시','gong@hhaa.com');