USE yeql_University_Mis
CREATE TABLE yeql_Listen_course(
	yql_Tno CHAR(6),yql_Tname VARCHAR(20),yql_Cno CHAR(4)
	CONSTRAINT PK_yeql_listen_course PRIMARY KEY(yql_Tno)
	CONSTRAINT FK_yeql_listen_course FOREIGN KEY(yql_Cno)
	REFERENCES yeql_Teach_course(yql_Cno)
)
CREATE TABLE yeql_Teach_course(
	yql_Cno CHAR(4),yql_Cname VARCHAR(30),yql_Tno CHAR(6)
	CONSTRAINT PK_yeql_Teach_course PRIMARY KEY(yql_Cno)
	CONSTRAINT FK_yeql_Teach_course FOREIGN KEY(yql_Tno)
	REFERENCES yeql_Listen_course(yql_Tno)
)