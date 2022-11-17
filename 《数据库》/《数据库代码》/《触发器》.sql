1.插入数据给出提示
CREATE TRIGGER Trig_stuDML
ON s
AFTER INSERT
AS
RAISERROR('正在向表中插入数据',16,10);

insert into s values('s11','王五','男',22,'信息')

2.重命名
sp_rename oldname,newname
sp_rename Trig_stuDML,Trig_stu

3.查看触发器
sp_helptrigger  'table'
sp_helptrigger  's'
sp_helptrigger  's','INSERT'

USE jxsk
GO
EXEC sp_helptrigger  's'
EXEC sp_helptrigger  's','INSERT'

4.查看触发器代码
sp_helptext 'trigger_name'
sp_helptext 'Trig_stu'

USE jxsk
GO
EXEC sp_helptext 'Trig_stu'

加密
CREATE TRIGGER Trig_stu1
ON s
WITH ENCRYPTION
AFTER INSERT
AS
RAISERROR('正在向表中插入数据',16,10);

USE jxsk
GO
EXEC sp_helptext 'Trig_stu1'

5.查看触发器其他信息
sp_help 'trigger_name'
sp_help 'Trig_stu'

USE jxsk
GO
EXEC sp_help 'Trig_stu'

6.禁用或启用触发器

USE jxsk
GO
ALTER TABLE s
DISABLE TRIGGER Trig_stu

USE jxsk
GO
ALTER TABLE s
ENABLE TRIGGER Trig_stu


