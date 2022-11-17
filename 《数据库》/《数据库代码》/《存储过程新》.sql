1.创建无参存储过程
Create Procedure Proc_stu
AS
Select *from s where sex='男'
执行存储过程
EXECUTE Proc_stu
GO

2.proc_Q_stugrade  @stuname  char(20)  @kcname  char(20) 

3.SELECT sno,sn,sex,age FROM s WHERE sex='男'

4.参数化存储过程
Create Procedure Proc_stu4
@Proc_sno char(10)
AS
Select *from s where sno=@Proc_sno

执行存储过程
EXECUTE Proc_stu4 s2
GO

5.查看存储过程定义
EXEC sp_helptext 'Proc_Stu'

6.更改-加密
USE jxsk
GO
ALTER Procedure Proc_stu
@Proc_sno int
WITH encryption
AS
Select *from s 
        where sno=@Proc_sno
GO

7.重命名
EXEC sp_rename 'Proc_stu','Proc_stu_Info'
8.删除
DROP PROCEDURE Proc_stu

