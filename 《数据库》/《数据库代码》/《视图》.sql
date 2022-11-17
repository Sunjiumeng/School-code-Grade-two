（2）定义视图View_student2,学生表中dept是信息的学生所有信息。
CREATE VIEW  View_student2
AS  SELECT   *
FROM  dbo.s
WHERE   (dept = '信息')
（3）定义视图View_student3，课程成绩大于85分的学生学号,姓名,性别,出生日期
CREATE VIEW View_student3
AS  
SELECT s.sno,s.sn,s.sex,s.age
FROM s INNER JOIN
        sc ON s.sno = sc.sno
WHERE (sc.score >= 85) 

SELECT * FROM View_student3
或者
CREATE VIEW View_student3
AS  
SELECT s.sno, s.sn, s.sex,s.age
FROM  s,sc        
WHERE s.sno = sc.sno AND (dbo.sc.score>= 85) 

SELECT * FROM View_student3
(4) 创建一个新视图从原来视图View_student3中查询年龄大于等于18的学生信息。
CREATE VIEW View_student4
AS
SELECT *
FROM View_student3
WHERE (age >= 18)

SELECT * FROM View_student3
SELECT * FROM View_student4
 (5)通过视图对基本表进行插入、修改、删除行的操作，有一定的限制条件.在视图View_student2中插入一条新的记录，
其各字段的值分别为's10', '杨勋','男',18,'信息'。
USE jxsk
GO
INSERT INTO View_student2
(sno,sn,sex,age,dept) 
VALUES ('s10', '杨勋','男',18,'信息')
GO

SELECT * FROM View_student2
SELECT * FROM s
修改记录:将视图View_student2中的学生姓名为“杨勋”的年龄改为20。
USE jxsk
GO
UPDATE View_student2
SET age =20
WHERE sn= '杨勋'
GO

SELECT * FROM View_student2
（7）删除视图View_BOOKS
使用T-SQL语句
DROP VIEW View_student2
GO
