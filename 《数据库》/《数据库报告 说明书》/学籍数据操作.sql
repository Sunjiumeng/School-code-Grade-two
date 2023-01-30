--��ѯ����С��20��ѧ���Ļ�����Ϣ
select * from Student where age < 20

--��ѯ�༶Ϊ����һ�ࡱ���Ҽ�ͥסַ��ʡ��Ϊ�����ϡ���ѧ��������Ϣ
select * from Student where Cid = 'RG1' and location like '����%'

--��ѯѡ���ˡ�SJK3���γ̵�ѧ����ѧ�š��������ɼ������а��ճɼ��Ӵ�С��˳������
select Student.id,name,Ggrade from Student,Grade
where Student.id = Grade.id and Grade.Kid = 'SJK3' 
order by Ggrade desc

--��ѯѡ�ޡ���ѧӢ��γ�����ѧ����ƽ���ɼ�
select avg(Ggrade) ƽ���ɼ� from Grade,Course 
where Grade.Kid = Course.Kid 
and Course.Kname = '��ѧӢ��'

--��ѯ��á�����ѧ�����ƺŵ�ѧ����ѧ�š�������רҵ��Ժϵ
select Student.id ѧ��,name ����,Mname רҵ����,Dname Ժϵ����
from Student,Major,Department,Award_punish 
where Student.id = Award_punish.id
and Major.Mid = Award_punish.Mid
and Department.Did = Award_punish.Did 
and Aname = '����ѧ��'

--����ͥ��ַΪ�������Ͼ�����ѧ���ļ�ͥ��ַ����Ϊ������֣�ݡ�
select * from Student where location = '����֣��'
select * from Student where location = '�����Ͼ�'
update Student set location = '����֣��' where location = '�����Ͼ�'

--���γ̡���ѧӢ��"��ѧʱ����Ϊ68
select * from Course where Kname = '��ѧӢ��'
update Course set Kperiod = 68 where Kname = '��ѧӢ��' 

--ɾ��ѧ��Ϊ��201130321��ѧ���Ľ�����Ϣ
select * from Award_punish
delete from Award_punish where id = '201130321'

--������ͼ��ʵ�ֲ�ѯ����ѧ����ѧ�š��������༶��š�רҵ��š�Ժϵ��š�
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

--����ѧ���ɼ���ͼ��ʵ�ֲ�ѯ����ѧ����ѧ�š��������γ̡��ɼ�
create view B_Grade(id,name,Kname,Ggrade)
as
select Student.id,name,Kname,Ggrade
from Student,Grade,Course
where Student.id = Grade.id
and Grade.Kid = Course.Kid
with check option

select * from B_Grade

--����ѧ��������ͼ��ʵ�ֲ�ѯ����ѧ����ѧ�š��������༶��רҵ��Ժϵ�����ͺš������������ͷ���
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

--������������������ѧ���༶��Ϣʱ�Զ��޸���Ӧ�༶ѧ������
create trigger insert_stu
on Student for insert
as
 begin
  declare @cid varchar(30)
  select @cid=Cid from inserted
  update Class set Cnumber = Cnumber + 1 where Cid = @cid
 end
 
 select * from Class where Cname = '��һ��'
 insert into Student values('201130332','��˼��','��','RG1','RJ11','RJ111','����',20,'2001-02-03','�����Ĳ�','2020-09-30')
 select * from Class where Cname = '��һ��'

--��������������ɾ��ѧ���༶��Ϣʱ�Զ��޸���Ӧ�༶ѧ������
create trigger delete_stu
on Student for delete
as
 begin
  declare @cid varchar(30)
  select @cid=Cid from deleted
  update Class set Cnumber = Cnumber - 1 where Cid = @cid
 end
 
 select * from Class where Cname = '��һ��'
 delete from Student where name = '��˼��'
 select * from Class where Cname = '��һ��'
 
 --���������������޸�ѧ���༶��Ϣʱ�Զ��޸���Ӧ�༶ѧ������
create trigger update_stu
on Student for update
as
 begin
  declare @cid1 varchar(30)
  declare @cid2 varchar(30)
  --��Ÿ���ǰ������
  select @cid1=Cid from deleted
  --��Ÿ��º������
  select @cid2=Cid from inserted
  update Class set Cnumber = Cnumber - 1 where Cid = @cid1
  update Class set Cnumber = Cnumber + 1 where Cid = @cid2
 end
 
  select * from Student where name = '��С��'
  select * from Class where Cname = '��һ��'
  select * from Class where Cname = 'Ӣ��һ��'
  update Student set Cid = 'YY1' where name = '��С��'
  
--�����洢���̲�ѯָ��ѧ���ĳɼ���

create procedure pro_grade
@id varchar(30)=null,
@name varchar(30)=null
 as
    if(@id is null or @name is null )
    begin 
      print '������ѧ����������'
    end
    
    else if(
        (select name from Student where id = @id) != @name 
    or (select id from Student where name = @name) != @id 
    )
     begin
      print '��������'
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
 exec pro_grade '201130320','���绪'
 
 
 
 