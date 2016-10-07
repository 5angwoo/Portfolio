use studydb;
create table members(
	mno integer not null comment '회원일련번호',
	email varchar(40) not null comment '이메일',
	pwd varchar(100) not null comment '암호',
	mname varchar(50) not null comment '이름',
	cre_date datetime not null comment '가입일',
	mod_date datetime not null comment '마지막암호변경일'
)
comment '회원기본정보';

alter table members
add constraint pk_members
primary key(
	mno
);

create unique index uix_members
	on members(
		email asc
	);
	
alter table members
	modify column mno integer not null auto_increment
	comment '회원일련번호';

insert into members(email, pwd, mname, cre_date, mod_date)
values('s1@test.com', '1111','홍길동',now(),now());

insert into members(email, pwd, mname, cre_date, mod_date)
values('s2@test.com', '1111','임꺽정',now(),now());

insert into members(email, pwd, mname, cre_date, mod_date)
values('s3@test.com', '1111','일지매',now(),now());

insert into members(email, pwd, mname, cre_date, mod_date)
values('s4@test.com', '1111','이몽룡',now(),now());

insert into members(email, pwd, mname, cre_date, mod_date)
values('s5@test.com', '1111','성춘향',now(),now());

select * from members;