--查询年龄小于20的学生的基本信息
select * from Student where age < 20

--查询班级为“软工一班”，且家庭住址的省会为“河南”的学生基本信息
select * from Student where Cid = 'RG1' and location like '河南%'

--查询选修了“SJK3”课程的学生的学号、姓名、成绩，其中按照成绩从大到小的顺序排列
select Student.id,name,Ggrade from Student,Grade
where Student.id = Grade.id and Grade.Kid = 'SJK3' 
order by Ggrade desc

--查询选修“大学英语”课程所有学生的平均成绩
select avg(Ggrade) 平均成绩 from Grade,Course 
where Grade.Kid = Course.Kid 
and Course.Kname = '大学英语'

--查询获得“三好学生”称号的学生的学号、姓名、专业、院系
select Student.id 学号,name 姓名,Mname 专业名称,Dname 院系名称
from Student,Major,Department,Award_punish 
where Student.id = Award_punish.id
and Major.Mid = Award_punish.Mid
and Department.Did = Award_punish.Did 
and Aname = '三好学生'

--将家庭地址为“江苏南京”的学生的家庭地址更改为“河南郑州”
select * from Student where location = '河南郑州'
select * from Student where location = '江苏南京'
update Student set location = '河南郑州' where location = '江苏南京'

--将课程“大学英语"的学时更改为68
select * from Course where Kname = '大学英语'
update Course set Kperiod = 68 where Kname = '大学英语' 

--删除学号为“201130321”学生的奖惩信息
select * from Award_punish
delete from Award_punish where id = '201130321'

--创建视图，实现查询各个学生的学号、姓名、班级编号、专业编号、院系编号。
create view A_Student(id,name,Cname,Mname,Dname)
as
select id,name,Cname,Mname,Dname
from Student,Class,Major,Department
where Class.Did = Department.Did
and Class.Mid = Major.Mid
and Student.Did = Department.Did
and Student.Mid = Major.Mid
with check option

select * from A_Student

--创建学生成绩视图，实现查询各个学生的学号、姓名、课程、成绩
create view B_Grade(id,name,Kname,Ggrade)
as
select Student.id,name,Kname,Ggrade
from Student,Grade,Course
where Student.id = Grade.id
and Grade.Kid = Course.Kid
with check option

select * from B_Grade

--创建学生奖惩视图，实现查询各个学生的学号、姓名、班级、专业、院系、奖惩号、奖惩名、奖惩方案
create view C_Award_punish(id,name,Cname,Mname,Dname,Aid,Aname,Aproject)
as
select Student.id,name,Cname,Mname,Dname,Aid,Aname,Aproject
from Student,Class,Major,Department,Award_punish
where Student.id = Award_punish.id
and Award_punish.Mid = Major.Mid
and Award_punish.Did = Department.Did
and Class.Did = Department.Did
and Class.Mid = Major.Mid
with check option

select * from C_Award_punish

--创建触发器，当增加学生班级信息时自动修改相应班级学生人数
create trigger insert_stu
on Student for insert
as
 begin
  declare @cid varchar(30)
  select @cid=Cid from inserted
  update Class set Cnumber = Cnumber + 1 where Cid = @cid
 end
 
 select * from Class where Cname = '软工一班'
 insert into Student values('201130332','陈思宇','男','RG1','RJ11','RJ111','汉族',20,'2001-02-03','海南文昌','2020-09-30')
 select * from Class where Cname = '软工一班'

--创建触发器，当删除学生班级信息时自动修改相应班级学生人数
create trigger delete_stu
on Student for delete
as
 begin
  declare @cid varchar(30)
  select @cid=Cid from deleted
  update Class set Cnumber = Cnumber - 1 where Cid = @cid
 end
 
 select * from Class where Cname = '软工一班'
 delete from Student where name = '陈思宇'
 select * from Class where Cname = '软工一班'
 
 --创建触发器，当修改学生班级信息时自动修改相应班级学生人数
create trigger update_stu
on Student for update
as
 begin
  declare @cid1 varchar(30)
  declare @cid2 varchar(30)
  --存放更新前的数据
  select @cid1=Cid from deleted
  --存放更新后的数据
  select @cid2=Cid from inserted
  update Class set Cnumber = Cnumber - 1 where Cid = @cid1
  update Class set Cnumber = Cnumber + 1 where Cid = @cid2
 end
 
  select * from Student where name = '王小虎'
  select * from Class where Cname = '软工一班'
  select * from Class where Cname = '英语一班'
  update Student set Cid = 'YY1' where name = '王小虎'
  
--创建存储过程查询指定学生的成绩单

create procedure pro_grade
@id varchar(30)=null,
@name varchar(30)=null
 as
    if(@id is null or @name is null )
    begin 
      print '请输入学号与姓名！'
    end
    
    else if(
        (select name from Student where id = @id) != @name 
    or (select id from Student where name = @name) != @id 
    )
     begin
      print '输入有误！'
     end
    
    else
    begin
      select Student.id,name,Kname,Ggrade
      from Student,Grade,Course
      where Student.id = Grade.id
      and Grade.Kid = Course.Kid
      and name = @name
    end
 go
 
 select * from Student
 exec pro_grade '201130320','王淑华'
 
 
 
 