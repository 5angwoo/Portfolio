CREATE TABLE `user_info` (
  `userid` varchar(16) NOT NULL,
  `password` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `regdate` date DEFAULT NULL,
  `manager` varchar(2) DEFAULT NULL,
  `temp` varchar(100) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `lastconn` date DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8