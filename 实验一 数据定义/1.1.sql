USE master
GO
CREATE DATABASE yeql_University_Mis
ON
(NAME=yeql_University_Data,
FILENAME='E:\数据库实验\实验一 数据定义\yeql_University_Data.mdf',
SIZE=10,
MAXSIZE=100,
FILEGROWTH=5)
LOG ON
(NAME=yeql_University_Log,
FILENAME='E:\数据库实验\实验一 数据定义\yeql_University_Log.ldf',
SIZE=10,
MAXSIZE=100,
FILEGROWTH=5)
GO

CREATE TABLE yeql_Students
(yql_Sno CHAR(8) NOT NULL UNIQUE,	/*具有唯一性约束*/
yql_Sname CHAR(20) NOT NULL,	/*非空*/
yql_Semail CHAR(50),
yql_Scredit FLOAT CONSTRAINT yql_sscredit CHECK(yql_Scredit>=0),	/*具有约束*/
yql_Sroom CHAR(20),
PRIMARY KEY (yql_Sno))	/*主键*/

CREATE TABLE yeql_Teachers
(yql_Tno CHAR(8) NOT NULL UNIQUE,
yql_Tname CHAR(20) NOT NULL,
yql_Temail CHAR(50),
yql_Tsalary INT,
PRIMARY KEY (yql_Tno))	/*主键*/

CREATE TABLE yeql_Courses
(yql_Cno CHAR(8) NOT NULL UNIQUE,
yql_Cname CHAR(20) NOT NULL,
yql_Ccredit INT,
PRIMARY KEY (yql_Cno))	/*主键*/

CREATE TABLE yeql_Reports
(yql_Sno CHAR(8),
yql_Tno CHAR(8),
yql_Cno CHAR(8),
yql_Score INT,
PRIMARY KEY(yql_Sno,yql_Tno,yql_Cno),	/*Sno,Tno,Cno是外键，它们共同组成Reports的主键*/
CONSTRAINT yql_sno FOREIGN KEY(yql_Sno) REFERENCES yeql_Students(yql_Sno),
CONSTRAINT yql_tno FOREIGN KEY(yql_Tno) REFERENCES yeql_Teachers(yql_Tno),
CONSTRAINT yql_cno FOREIGN KEY(yql_Cno) REFERENCES yeql_Courses(yql_Cno))

ALTER TABLE yeql_Students ADD yql_Ssex CHAR(2)
ALTER TABLE yeql_Students DROP CONSTRAINT yql_sscredit
ALTER TABLE yeql_Courses ALTER COLUMN yql_Cname CHAR(30)

ALTER TABLE yeql_Students DROP COLUMN yql_Sroom

DROP TABLE yeql_Reports

CREATE INDEX yql_cno ON yeql_Courses(yql_Cno DESC)
CREATE INDEX yql_sno ON yeql_Students(yql_Sno)
CREATE UNIQUE INDEX yql_snmae ON yeql_Students(yql_Sname)
DROP INDEX yeql_Students.yql_sno