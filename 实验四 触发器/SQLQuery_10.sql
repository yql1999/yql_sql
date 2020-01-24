/*为yeql_Teacher表建立触发器T1，当插入或使更新表中的数据时，
保证所操作的纪录的Tage值大于0*/
USE yeql_University_Mis
GO
CREATE TRIGGER T1 ON yeql_Teacher
FOR INSERT,UPDATE
AS
IF(SELECT yql_Tage FROM INSERTED)<1
BEGIN
PRINT '职工年龄必须是大于0的整数!?操作失败！'
ROLLBACK TRANSACTION
END

/*为yeql_Teacher表建立触发器T2，禁止删除编号为S01的CEO*/
USE yeql_University_Mis
GO
CREATE TRIGGER T2 ON yeql_Teacher
FOR DELETE
AS
IF(SELECT yql_Tno FROM DELETED)='T01'
BEGIN
PRINT '此人是CEO!?删除操作失败！'
ROLLBACK TRANSACTION
END

/*为yeql_Teacher表建立触发器T3，实现更新中编号的不可改变性*/
USE yeql_University_Mis
GO
CREATE TRIGGER T3 ON yeql_Teacher
FOR UPDATE
AS
IF UPDATE(yql_Tno)
BEGIN
PRINT '职工编号不能修改！'
ROLLBACK TRANSACTION
END

USE yeql_University_Mis
INSERT INTO yeql_Teacher VALUES('T03','李宏','F',-10,'开发部')

USE yeql_University_Mis
UPDATE yeql_Teacher 
SET yql_Tage=-7 
WHERE yql_Tno='T01'

USE yeql_University_Mis
UPDATE yeql_Teacher 
SET yql_Tno='T07'
WHERE yql_Tsex='F'