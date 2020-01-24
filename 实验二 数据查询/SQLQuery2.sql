﻿INSERT
INTO yeql_Students
VALUES('S78','李迪','LD@zjut.edu.cn',0,'男')

/*对每个课程，求学生的选课人数和学生的平均成绩，并把结果存入数据库。
使用SELECT INTO 和INSERT INTO 两种方法实现。*/
CREATE TABLE yeql_Courese2(
	yql_Cno char(5) PRIMARY KEY,
	yql_CourseNum INT,
	yql_AvgScore FLOAT)
INSERT
INTO yeql_Courese2
SELECT yql_Cno,COUNT(yql_Sno),AVG(yql_Score)
FROM yeql_Reports
GROUP BY yql_Cno

UPDATE yeql_Students
SET yql_Sno='S70'
WHERE yql_Sname='李迪'

UPDATE yeql_Teachers
SET yql_Tsalary=yql_Tsalary+500

UPDATE yeql_Reports
SET yql_Score=yql_Score+6
WHERE yql_Sno =(
	SELECT yql_Sno
	FROM yeql_Students
	WHERE yql_Sname='刘华')
	AND
	yql_Sno=(SELECT yql_Cno
	FROM yeql_Courses
	WHERE yql_Cname='数据库原理及应用')

DELETE
FROM yeql_Students
WHERE yql_Sname='李迪'

DELETE
FROM yeql_Reports
WHERE yql_Cno IN(
	SELECT yql_Cno
	FROM yeql_Courses
	WHERE yql_Cname='JAVA')

/*对Courses表做删去学分<=4的元组   是不行的*/
DELETE
FROM yeql_Courses
WHERE yql_Ccredit<=4