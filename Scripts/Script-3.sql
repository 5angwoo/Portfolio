use shop;

CREATE TABLE shop.salesorder (
	id INT NULL,
	name varchar(20) NOT NULL,
	orderdate varchar(20) NOT NULL,
	addr varchar(50) NOT NULL,
	tel varchar(20) NOT NULL,
	pay varchar(20) NOT NULL,
	cardno varchar(20) NULL,
	prodcount int NULL,
	total INT NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;