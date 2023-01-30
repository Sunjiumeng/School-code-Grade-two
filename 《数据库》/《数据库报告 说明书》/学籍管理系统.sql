create database Stu_status

--ѧ����
create table Student(
   id varchar(20) primary key not null,
   name varchar(20) not null,
   sex char(2) not null check(sex in('��','Ů')),
   Cid varchar(30) not null,
   Mid varchar(30) not null,
   Did varchar(30) not null,
   nation varchar(20) not null,
   age int not null,
   birthday date not null,
   location varchar(20) not null,
   enrol date not null,
   foreign key (Cid) references Class (Cid)
      on delete cascade
      on update cascade,
   foreign key (Mid) references Major (Mid)
     on delete no action
     on update no action,
   foreign key (Did) references Department (Did)
      on delete no action
      on update no action,
)


--Ժϵ�� 
create table Department(
   Did varchar(30) primary key not null,
   Dname varchar(30) not null,
)

--רҵ�� 
create table Major(
   Mid varchar(30) primary key not null,
   Did varchar(30) not null,
   Mname varchar(30) not null,
   foreign key (Did) references Department (Did)
      on delete cascade
      on update cascade,
)

--�༶�� 
create table Class(
   Cid varchar(30) primary key not null,
   Mid varchar(30) not null,
   Did varchar(30) not null,
   Cname varchar(30) not null,
   Cnumber int not null,
   foreign key (Did) references Department (Did)
      on delete cascade
      on update cascade,
   foreign key (Mid) references Major (Mid)
      on delete no action
      on update no action,
)

--�γ̱�
create table Course(
   Kid varchar(30) primary key not null,
   Kname varchar(30) not null,
   Kcredit int not null,
   Kperiod int not null,
)

--�γ̳ɼ���
create table Grade(
  Kid varchar(30) not null,
  id varchar(20) not null,
  Ggrade int not null,
  primary key(Kid,id),
  foreign key (Kid) references Course (Kid)
     on delete cascade
     on update cascade,
  foreign key (id) references Student (id)
     on delete cascade
     on update cascade,
)

--���ͱ�
create table Award_punish(
  Aid varchar(20) primary key not null,
  id varchar(20) not null,
  Mid varchar(30) not null,
  Did varchar(30) not null,
  Aname varchar(30) not null,
  Aproject varchar(100) not null,
  foreign key (id) references Student (id)
     on delete cascade
     on update cascade,
  foreign key (Mid) references Major (Mid)
     on delete no action
     on update no action,
  foreign key (Did) references Department (Did)
     on delete no action
     on update no action,
)

select * from Department
insert into Department values('RJ111','���ѧԺ')
insert into Department values('XC222','�����봫��ѧԺ')
insert into Department values('JSJY333','��ʦ����ѧԺ')
insert into Department values('Y444','ҽѧԺ')
insert into Department values('ST555','��ѧ��ͳ��ѧԺ')
insert into Department values('WGY666','�����ѧԺ')
insert into Department values('DQ777','�������е����ѧԺ')


select * from Major
insert into Major values('RJ11','RJ111','�������')
insert into Major values('JSJ22','RJ111','�������ѧ�뼼��')

insert into Major values('GG11','XC222','���ѧ')
insert into Major values('XW22','XC222','����ѧ')

insert into Major values('XQ11','JSJY333','ѧǰ����')
insert into Major values('XX22','JSJY333','Сѧ����')

insert into Major values('LC11','Y444','�ٴ�ҽѧ')
insert into Major values('JP22','Y444','����ѧ')

insert into Major values('JR11','ST555','���ڹ���')
insert into Major values('YT22','ST555','Ӧ��ͳ��ѧ')

insert into Major values('YY11','WGY666','Ӣ��')
insert into Major values('XBY22','WGY666','��������')

insert into Major values('JD11','DQ777','��е���ӹ���')
insert into Major values('DZ22','DQ777','�������̼����Զ���')


select * from Class
insert into Class values('RG1','RJ11','RJ111','��һ��',6)
insert into Class values('JK1','JSJ22','RJ111','�ƿ�һ��',6)

insert into Class values('GG1','GG11','XC222','���һ��',5)
insert into Class values('XW1','XW22','XC222','����һ��',7)

insert into Class values('CJ1','XQ11','JSJY333','����һ��',6)
insert into Class values('XJ1','XX22','JSJY333','С��һ��',5)

insert into Class values('LC1','LC11','Y444','�ٴ�һ��',6)
insert into Class values('JP1','JP22','Y444','����һ��',6)

insert into Class values('JR1','JR11','ST555','����һ��',5)
insert into Class values('YT1','YT22','ST555','Ӧͳһ��',5)

insert into Class values('YY1','YY11','WGY666','Ӣ��һ��',5)
insert into Class values('XBY1','XBY22','WGY666','��������һ��',6)


select * from Student
insert into Student values('201130320','���绪','Ů','RG1','RJ11','RJ111','����',20,'2001-06-12','����֣��','2020-09-30')
insert into Student values('201130321','��С��','��','RG1','RJ11','RJ111','����',21,'2000-02-22','�����ܿ�','2020-09-30')
insert into Student values('201130322','������','��','RG1','RJ11','RJ111','����',19,'2002-03-14','��������Ͽ','2020-09-30')
insert into Student values('201130323','��β�','Ů','RG1','RJ11','RJ111','����',20,'2001-01-09','�������','2020-09-30')
insert into Student values('201130324','��С��','Ů','RG1','RJ11','RJ111','����',20,'2001-02-03','�Ĵ��ɶ�','2020-09-30')
insert into Student values('201130325','��С��','��','RG1','RJ11','RJ111','����',19,'2002-04-03','��������','2020-09-30')

insert into Student values('201130326','��С��','Ů','JK1','JSJ22','RJ111','����',20,'2001-02-11','�½���ʲ','2020-09-30')
insert into Student values('201130327','�ż�׳','��','JK1','JSJ22','RJ111','����',21,'2000-02-22','�����ܿ�','2020-09-30')
insert into Student values('201130328','���ĳ�','��','JK1','JSJ22','RJ111','����',19,'2002-06-16','����ƽ��ɽ','2020-09-30')
insert into Student values('201130329','������','Ů','JK1','JSJ22','RJ111','����',20,'2001-08-09','�������','2020-09-30')
insert into Student values('201130330','��ӨӨ','Ů','JK1','JSJ22','RJ111','����',20,'2001-02-02','�Ĵ�����','2020-09-30')
insert into Student values('201130331','����׳','��','JK1','JSJ22','RJ111','����',19,'2002-04-01','��������','2020-09-30')

insert into Student values('201230320','��ȫ��','��','GG1','GG11','XC222','����',20,'2001-01-10','�Ĵ��ɶ�','2020-09-30')
insert into Student values('201230321','���','��','GG1','GG11','XC222','����',21,'2000-02-22','�����ܿ�','2020-09-30')
insert into Student values('201230322','��С��','��','GG1','GG11','XC222','����',19,'2002-03-11','��������','2020-09-30')
insert into Student values('201230323','�����','Ů','GG1','GG11','XC222','����',20,'2001-07-09','�������','2020-09-30')
insert into Student values('201230324','�ܴ�ɽ','��','GG1','GG11','XC222','����',20,'2001-02-04','�Ϻ��ֶ�','2020-09-30')

insert into Student values('201230325','������','��','XW1','XW22','XC222','׳��',19,'2002-06-03','��������','2020-09-30')
insert into Student values('201230326','���л�','��','XW1','XW22','XC222','����',20,'2000-07-19','�㽭����','2020-09-30')
insert into Student values('201230327','������','Ů','XW1','XW22','XC222','����',21,'2000-09-10','��������','2020-09-30')
insert into Student values('201230328','���췽','��','XW1','XW22','XC222','����',20,'2001-11-12','�����Ͼ�','2020-09-30')
insert into Student values('201230329','ë����','Ů','XW1','XW22','XC222','����',19,'2002-12-27','��������','2020-09-30')
insert into Student values('201230330','�Ŵ�','��','XW1','XW22','XC222','����',20,'2001-11-12','�ӱ����','2020-09-30')
insert into Student values('201230331','ë��Ȼ','��','XW1','XW22','XC222','����',19,'2002-12-27','��������','2020-09-30')


insert into Student values('201330320','������','Ů','CJ1','XQ11','JSJY333','����',20,'2000-07-19','�㽭����','2020-09-30')
insert into Student values('201330321','��ӱ��','Ů','CJ1','XQ11','JSJY333','����',21,'2000-09-10','��������','2020-09-30')
insert into Student values('201330322','�','��','CJ1','XQ11','JSJY333','����',20,'2001-12-12','�����Ͼ�','2020-09-30')
insert into Student values('201330323','������','��','CJ1','XQ11','JSJY333','����',19,'2002-10-27','������ɽ','2020-09-30')
insert into Student values('201330324','��Ȩ��','��','CJ1','XQ11','JSJY333','����',20,'2000-01-19','�㽭����','2020-09-30')
insert into Student values('201330325','��ӨӨ','Ů','CJ1','XQ11','JSJY333','׳��',21,'2000-09-10','���ݷ�ɽ','2020-09-30')

insert into Student values('201330326','�Ź��','Ů','YT1','XX22','JSJY333','����',21,'2000-09-10','����֣��','2020-09-30')
insert into Student values('201330327','������','��','YT1','XX22','JSJY333','����',20,'2001-12-12','������','2020-09-30')
insert into Student values('201330328','����','��','YT1','XX22','JSJY333','����',20,'2001-10-27','������ɽ','2020-09-30')
insert into Student values('201330329','�Թ⻪','��','YT1','XX22','JSJY333','����',20,'2000-01-19','�㽭����','2020-09-30')
insert into Student values('201330330','��С��','Ů','YT1','XX22','JSJY333','׳��',21,'2000-09-10','���ݶ�ݸ','2020-09-30')


insert into Student values('201430320','������','Ů','LC1','LC11','Y444','����',20,'2001-06-12','���Ϻױ�','2020-09-30')
insert into Student values('201430321','������','��','LC1','LC11','Y444','����',21,'2000-02-22','���պϷ�','2020-09-30')
insert into Student values('201430322','���ҹ�','��','LC1','LC11','Y444','����',19,'2002-03-14','���ϰ���','2020-09-30')
insert into Student values('201430323','������','Ů','LC1','LC11','Y444','����',20,'2001-01-09','�������','2020-09-30')
insert into Student values('201430324','Ǯ���','Ů','LC1','LC11','Y444','����',20,'2001-02-03','�Ĵ��ɶ�','2020-09-30')
insert into Student values('201430325','������','��','LC1','LC11','Y444','����',19,'2002-04-03','�����Ĳ�','2020-09-30')

insert into Student values('201430326','������','Ů','JP1','JP22','Y444','׳��',20,'2001-06-12','��������','2020-09-30')
insert into Student values('201430327','�żѻ�','��','JP1','JP22','Y444','����',21,'2000-02-22','���պϷ�','2020-09-30')
insert into Student values('201430328','������','��','JP1','JP22','Y444','����',19,'2002-03-14','��������','2020-09-30')
insert into Student values('201430329','�����','Ů','JP1','JP22','Y444','����',20,'2001-01-09','�������','2020-09-30')
insert into Student values('201430330','Ǯ����','Ů','JP1','JP22','Y444','����',20,'2001-02-03','�ӱ���ɽ','2020-09-30')
insert into Student values('201430331','���λ�','��','JP1','JP22','Y444','����',19,'2002-04-03','ɽ���˳�','2020-09-30')

insert into Student values('201530321','������','��','JR1','JR11','ST555','����',21,'2000-02-22','���ϳ�ɳ','2020-09-30')
insert into Student values('201530322','���ĳ�','��','JR1','JR11','ST555','����',19,'2002-03-14','��������','2020-09-30')
insert into Student values('201530323','������','Ů','JR1','JR11','ST555','����',20,'2001-01-09','���Ͽ���','2020-09-30')
insert into Student values('201530334','������','��','JR1','JR11','ST555','����',20,'2001-02-03','�����γ�','2020-09-30')
insert into Student values('201530335','���ζ�','��','JR1','JR11','ST555','����',19,'2002-04-03','ɽ����ͬ','2020-09-30')

insert into Student values('201530336','������','��','JR1','YT22','ST555','����',21,'2000-02-22','��������','2020-09-30')
insert into Student values('201530337','������','��','JR1','YT22','ST555','����',19,'2002-03-14','�����人','2020-09-30')
insert into Student values('201530338','������','Ů','JR1','YT22','ST555','����',20,'2001-01-09','�����ܿ�','2020-09-30')
insert into Student values('201530339','������','��','JR1','YT22','ST555','����',20,'2001-02-03','�����γ�','2020-09-30')
insert into Student values('201530340','��¡¡','��','JR1','YT22','ST555','����',19,'2002-04-03','���պϷ�','2020-09-30')

insert into Student values('201630321','���˴�','��','YY1','YY11','WGY666','����',21,'2000-02-22','��������','2020-09-30')
insert into Student values('201630322','������','��','YY1','YY11','WGY666','����',19,'2002-03-14','�����人','2020-09-30')
insert into Student values('201630323','�����','��','YY1','YY11','WGY666','����',20,'2001-01-09','����֣��','2020-09-30')
insert into Student values('201630324','����','��','YY1','YY11','WGY666','����',20,'2001-02-03','�����γ�','2020-09-30')
insert into Student values('201630325','������','��','YY1','YY11','WGY666','����',19,'2002-04-03','���ϴ���','2020-09-30')

insert into Student values('201630326','ʢ�γ�','��','XBY1','XBY22','WGY666','����',21,'2000-02-22','��������','2020-09-30')
insert into Student values('201630327','������','Ů','XBY1','XBY22','WGY666','׳��',19,'2002-03-14','��������','2020-09-30')
insert into Student values('201630328','���޼�','��','XBY1','XBY22','WGY666','����',20,'2001-01-09','��������','2020-09-30')
insert into Student values('201630329','���꽨','Ů','XBY1','XBY22','WGY666','����',20,'2001-02-03','�ӱ���ɽ','2020-09-30')
insert into Student values('201630330','�쵱��','��','XBY1','XBY22','WGY666','����',19,'2002-04-03','�㽭����','2020-09-30')
insert into Student values('201630331','������','��','XBY1','XBY22','WGY666','����',19,'2002-04-03','���ϴ���','2020-09-30')

select * from Course
insert into Course values('YY1','��ѧӢ��',4,72)
insert into Course values('GS2','�ߵ���ѧ',4,120)
insert into Course values('SJK3','���ݿ�',4,72)
insert into Course values('SJ4','���ݽṹ',4,72)
insert into Course values('LC5','Linux����ϵͳ',3,68)

select * from Grade
insert into Grade values('YY1','201130320',99)
insert into Grade values('LC5','201130321',96)
insert into Grade values('GS2','201130322',94)
insert into Grade values('SJK3','201130323',100)
insert into Grade values('SJ4','201130324',99)
insert into Grade values('YY1','201130325',99)
insert into Grade values('LC5','201130326',96)
insert into Grade values('GS2','201130327',94)
insert into Grade values('SJK3','201130328',79)
insert into Grade values('SJ4','201130329',99)
insert into Grade values('SJ4','201130330',89)
insert into Grade values('SJ4','201130331',91)

insert into Grade values('YY1','201230320',49)
insert into Grade values('LC5','201230321',90)
insert into Grade values('GS2','201230322',88)
insert into Grade values('SJK3','201230323',100)
insert into Grade values('SJ4','201230324',59)
insert into Grade values('YY1','201230325',68)
insert into Grade values('LC5','201230326',96)
insert into Grade values('GS2','201230327',94)
insert into Grade values('SJK3','201230328',79)
insert into Grade values('SJ4','201230329',99)
insert into Grade values('GS2','201230330',89)
insert into Grade values('SJK3','201230331',91)

insert into Grade values('GS2','201330320',99)
insert into Grade values('LC5','201330321',90)
insert into Grade values('GS2','201330322',88)
insert into Grade values('SJK3','201330323',100)
insert into Grade values('SJ4','201330324',79)
insert into Grade values('YY1','201330325',68)
insert into Grade values('LC5','201330326',79)
insert into Grade values('GS2','201330327',70)
insert into Grade values('SJK3','201330328',79)
insert into Grade values('SJ4','201330329',99)
insert into Grade values('GS2','201330330',89)

insert into Grade values('GS2','201430320',69)
insert into Grade values('LC5','201430321',90)
insert into Grade values('GS2','201430322',88)
insert into Grade values('SJK3','201430323',89)
insert into Grade values('SJ4','201430324',79)
insert into Grade values('SJK3','201430325',68)
insert into Grade values('LC5','201430326',79)
insert into Grade values('GS2','201430327',70)
insert into Grade values('SJK3','201430328',79)
insert into Grade values('SJ4','201430329',62)
insert into Grade values('YY1','201430330',89)
insert into Grade values('GS2','201430331',89)

insert into Grade values('LC5','201530321',60)
insert into Grade values('GS2','201530322',88)
insert into Grade values('SJK3','201530323',89)
insert into Grade values('SJ4','201530334',79)
insert into Grade values('SJK3','201530335',68)
insert into Grade values('LC5','201530336',79)
insert into Grade values('GS2','201530337',70)
insert into Grade values('SJK3','201530338',79)
insert into Grade values('SJ4','201530339',100)
insert into Grade values('YY1','201530340',89)


insert into Grade values('LC5','201630321',89)
insert into Grade values('GS2','201630322',88)
insert into Grade values('SJK3','201630323',89)
insert into Grade values('SJ4','201630324',79)
insert into Grade values('SJK3','201630325',68)
insert into Grade values('LC5','201630326',79)
insert into Grade values('GS2','201630327',70)
insert into Grade values('SJK3','201630328',79)
insert into Grade values('SJ4','201630329',62)
insert into Grade values('YY1','201630330',89)
insert into Grade values('GS2','201630331',89)

select * from Award_punish
insert into Award_punish values('JL1','201130321','RJ11','RJ111','����ѧ��','��������ѧ����״')
insert into Award_punish values('JL2','201330325','XQ11','JSJY333','����������','���辫����������״')
insert into Award_punish values('JL3','201530336','YT22','ST555','����ѧ��','��������ѧ����״')
insert into Award_punish values('JL4','201330324','XQ11','JSJY333','������־��ѧ��','����������־��ѧ�𽱽�')
insert into Award_punish values('JL5','201230329','XW22','XC222','����ѧ��','��������ѧ����״')
insert into Award_punish values('JL6','201630328','XBY22','WGY666','����������','���辫����������״')

