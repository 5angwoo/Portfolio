
create table member(
userid 		varchar(16) not null primary key,
username 	varchar(12) not null,
password 	varchar(12) not null,
securitynum 	varchar(14) not null,
email 		varchar(50),
zipcode		varchar(7),
address1	varchar(100),
address2	varchar(100),
phone		varchar(13),
regedit		varchar(50)
);