create database Stu_status

--学生表
create table Student(
   id varchar(20) primary key not null,
   name varchar(20) not null,
   sex char(2) not null check(sex in('男','女')),
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


--院系表 
create table Department(
   Did varchar(30) primary key not null,
   Dname varchar(30) not null,
)

--专业表 
create table Major(
   Mid varchar(30) primary key not null,
   Did varchar(30) not null,
   Mname varchar(30) not null,
   foreign key (Did) references Department (Did)
      on delete cascade
      on update cascade,
)

--班级表 
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

--课程表
create table Course(
   Kid varchar(30) primary key not null,
   Kname varchar(30) not null,
   Kcredit int not null,
   Kperiod int not null,
)

--课程成绩表
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

--奖惩表
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
insert into Department values('RJ111','软件学院')
insert into Department values('XC222','新闻与传播学院')
insert into Department values('JSJY333','教师教育学院')
insert into Department values('Y444','医学院')
insert into Department values('ST555','数学与统计学院')
insert into Department values('WGY666','外国语学院')
insert into Department values('DQ777','电气与机械工程学院')


select * from Major
insert into Major values('RJ11','RJ111','软件工程')
insert into Major values('JSJ22','RJ111','计算机科学与技术')

insert into Major values('GG11','XC222','广告学')
insert into Major values('XW22','XC222','新闻学')

insert into Major values('XQ11','JSJY333','学前教育')
insert into Major values('XX22','JSJY333','小学教育')

insert into Major values('LC11','Y444','临床医学')
insert into Major values('JP22','Y444','解剖学')

insert into Major values('JR11','ST555','金融工程')
insert into Major values('YT22','ST555','应用统计学')

insert into Major values('YY11','WGY666','英语')
insert into Major values('XBY22','WGY666','西班牙语')

insert into Major values('JD11','DQ777','机械电子工程')
insert into Major values('DZ22','DQ777','电气工程及其自动化')


select * from Class
insert into Class values('RG1','RJ11','RJ111','软工一班',6)
insert into Class values('JK1','JSJ22','RJ111','计科一班',6)

insert into Class values('GG1','GG11','XC222','广告一班',5)
insert into Class values('XW1','XW22','XC222','新闻一班',7)

insert into Class values('CJ1','XQ11','JSJY333','初教一班',6)
insert into Class values('XJ1','XX22','JSJY333','小教一班',5)

insert into Class values('LC1','LC11','Y444','临床一班',6)
insert into Class values('JP1','JP22','Y444','解剖一班',6)

insert into Class values('JR1','JR11','ST555','金融一班',5)
insert into Class values('YT1','YT22','ST555','应统一班',5)

insert into Class values('YY1','YY11','WGY666','英语一班',5)
insert into Class values('XBY1','XBY22','WGY666','西班牙语一班',6)


select * from Student
insert into Student values('201130320','王淑华','女','RG1','RJ11','RJ111','汉族',20,'2001-06-12','河南郑州','2020-09-30')
insert into Student values('201130321','张小旦','男','RG1','RJ11','RJ111','汉族',21,'2000-02-22','河南周口','2020-09-30')
insert into Student values('201130322','刘家兴','男','RG1','RJ11','RJ111','回族',19,'2002-03-14','河南三门峡','2020-09-30')
insert into Student values('201130323','徐嘉灿','女','RG1','RJ11','RJ111','汉族',20,'2001-01-09','河南漯河','2020-09-30')
insert into Student values('201130324','周小华','女','RG1','RJ11','RJ111','汉族',20,'2001-02-03','四川成都','2020-09-30')
insert into Student values('201130325','王小虎','男','RG1','RJ11','RJ111','汉族',19,'2002-04-03','湖南株洲','2020-09-30')

insert into Student values('201130326','王小华','女','JK1','JSJ22','RJ111','汉族',20,'2001-02-11','新疆喀什','2020-09-30')
insert into Student values('201130327','张家壮','男','JK1','JSJ22','RJ111','汉族',21,'2000-02-22','河南周口','2020-09-30')
insert into Student values('201130328','刘心驰','男','JK1','JSJ22','RJ111','汉族',19,'2002-06-16','河南平顶山','2020-09-30')
insert into Student values('201130329','徐琳琳','女','JK1','JSJ22','RJ111','汉族',20,'2001-08-09','河南漯河','2020-09-30')
insert into Student values('201130330','周莹莹','女','JK1','JSJ22','RJ111','汉族',20,'2001-02-02','四川重庆','2020-09-30')
insert into Student values('201130331','王大壮','男','JK1','JSJ22','RJ111','回族',19,'2002-04-01','湖南株洲','2020-09-30')

insert into Student values('201230320','张全蛋','男','GG1','GG11','XC222','汉族',20,'2001-01-10','四川成都','2020-09-30')
insert into Student values('201230321','李保民','男','GG1','GG11','XC222','汉族',21,'2000-02-22','河南周口','2020-09-30')
insert into Student values('201230322','王小龙','男','GG1','GG11','XC222','回族',19,'2002-03-11','河南信阳','2020-09-30')
insert into Student values('201230323','徐果果','女','GG1','GG11','XC222','汉族',20,'2001-07-09','河南漯河','2020-09-30')
insert into Student values('201230324','周大山','男','GG1','GG11','XC222','汉族',20,'2001-02-04','上海浦东','2020-09-30')

insert into Student values('201230325','王铁柱','男','XW1','XW22','XC222','壮族',19,'2002-06-03','湖南株洲','2020-09-30')
insert into Student values('201230326','赵中华','男','XW1','XW22','XC222','汉族',20,'2000-07-19','浙江绍兴','2020-09-30')
insert into Student values('201230327','孙苗苗','女','XW1','XW22','XC222','汉族',21,'2000-09-10','江苏苏州','2020-09-30')
insert into Student values('201230328','李天方','男','XW1','XW22','XC222','汉族',20,'2001-11-12','江苏南京','2020-09-30')
insert into Student values('201230329','毛利兰','女','XW1','XW22','XC222','苗族',19,'2002-12-27','江苏徐州','2020-09-30')
insert into Student values('201230330','张大虎','男','XW1','XW22','XC222','汉族',20,'2001-11-12','河北天津','2020-09-30')
insert into Student values('201230331','毛井然','男','XW1','XW22','XC222','苗族',19,'2002-12-27','甘肃兰州','2020-09-30')


insert into Student values('201330320','刘晓芳','女','CJ1','XQ11','JSJY333','汉族',20,'2000-07-19','浙江绍兴','2020-09-30')
insert into Student values('201330321','孙颖亮','女','CJ1','XQ11','JSJY333','汉族',21,'2000-09-10','江苏苏州','2020-09-30')
insert into Student values('201330322','李华','男','CJ1','XQ11','JSJY333','汉族',20,'2001-12-12','江苏南京','2020-09-30')
insert into Student values('201330323','徐新龙','男','CJ1','XQ11','JSJY333','汉族',19,'2002-10-27','江苏昆山','2020-09-30')
insert into Student values('201330324','赵权游','男','CJ1','XQ11','JSJY333','汉族',20,'2000-01-19','浙江绍兴','2020-09-30')
insert into Student values('201330325','孙莹莹','女','CJ1','XQ11','JSJY333','壮族',21,'2000-09-10','广州佛山','2020-09-30')

insert into Student values('201330326','张光光','女','YT1','XX22','JSJY333','汉族',21,'2000-09-10','河南郑州','2020-09-30')
insert into Student values('201330327','李天启','男','YT1','XX22','JSJY333','黎族',20,'2001-12-12','江苏镇江','2020-09-30')
insert into Student values('201330328','徐广成','男','YT1','XX22','JSJY333','汉族',20,'2001-10-27','广州中山','2020-09-30')
insert into Student values('201330329','赵光华','男','YT1','XX22','JSJY333','汉族',20,'2000-01-19','浙江绍兴','2020-09-30')
insert into Student values('201330330','孙小文','女','YT1','XX22','JSJY333','壮族',21,'2000-09-10','广州东莞','2020-09-30')


insert into Student values('201430320','王果果','女','LC1','LC11','Y444','汉族',20,'2001-06-12','河南鹤壁','2020-09-30')
insert into Student values('201430321','张龙龙','男','LC1','LC11','Y444','汉族',21,'2000-02-22','安徽合肥','2020-09-30')
insert into Student values('201430322','刘家国','男','LC1','LC11','Y444','回族',19,'2002-03-14','河南安阳','2020-09-30')
insert into Student values('201430323','徐欣欣','女','LC1','LC11','Y444','汉族',20,'2001-01-09','河南漯河','2020-09-30')
insert into Student values('201430324','钱多多','女','LC1','LC11','Y444','汉族',20,'2001-02-03','四川成都','2020-09-30')
insert into Student values('201430325','王龙龙','男','LC1','LC11','Y444','汉族',19,'2002-04-03','海南文昌','2020-09-30')

insert into Student values('201430326','王玲珑','女','JP1','JP22','Y444','壮族',20,'2001-06-12','河南南阳','2020-09-30')
insert into Student values('201430327','张佳慧','男','JP1','JP22','Y444','汉族',21,'2000-02-22','安徽合肥','2020-09-30')
insert into Student values('201430328','刘新宇','男','JP1','JP22','Y444','回族',19,'2002-03-14','河南洛阳','2020-09-30')
insert into Student values('201430329','徐家旺','女','JP1','JP22','Y444','汉族',20,'2001-01-09','河南漯河','2020-09-30')
insert into Student values('201430330','钱宇宇','女','JP1','JP22','Y444','汉族',20,'2001-02-03','河北唐山','2020-09-30')
insert into Student values('201430331','王嘉华','男','JP1','JP22','Y444','汉族',19,'2002-04-03','山西运城','2020-09-30')

insert into Student values('201530321','王书龙','男','JR1','JR11','ST555','汉族',21,'2000-02-22','湖南长沙','2020-09-30')
insert into Student values('201530322','刘心驰','男','JR1','JR11','ST555','回族',19,'2002-03-14','湖北襄阳','2020-09-30')
insert into Student values('201530323','徐向荣','女','JR1','JR11','ST555','汉族',20,'2001-01-09','河南开封','2020-09-30')
insert into Student values('201530334','范期望','男','JR1','JR11','ST555','汉族',20,'2001-02-03','江苏盐城','2020-09-30')
insert into Student values('201530335','王嘉尔','男','JR1','JR11','ST555','汉族',19,'2002-04-03','山西大同','2020-09-30')

insert into Student values('201530336','王冰冰','男','JR1','YT22','ST555','汉族',21,'2000-02-22','湖南岳阳','2020-09-30')
insert into Student values('201530337','王尼玛','男','JR1','YT22','ST555','回族',19,'2002-03-14','湖北武汉','2020-09-30')
insert into Student values('201530338','徐麒麟','女','JR1','YT22','ST555','汉族',20,'2001-01-09','河南周口','2020-09-30')
insert into Student values('201530339','范国家','男','JR1','YT22','ST555','苗族',20,'2001-02-03','江苏盐城','2020-09-30')
insert into Student values('201530340','王隆隆','男','JR1','YT22','ST555','汉族',19,'2002-04-03','安徽合肥','2020-09-30')

insert into Student values('201630321','刘运达','男','YY1','YY11','WGY666','汉族',21,'2000-02-22','江苏扬州','2020-09-30')
insert into Student values('201630322','王鹏辉','男','YY1','YY11','WGY666','回族',19,'2002-03-14','湖北武汉','2020-09-30')
insert into Student values('201630323','孙悟空','男','YY1','YY11','WGY666','汉族',20,'2001-01-09','河南郑州','2020-09-30')
insert into Student values('201630324','孙悟饭','男','YY1','YY11','WGY666','苗族',20,'2001-02-03','江苏盐城','2020-09-30')
insert into Student values('201630325','孙悟天','男','YY1','YY11','WGY666','汉族',19,'2002-04-03','云南大理','2020-09-30')

insert into Student values('201630326','盛嘉诚','男','XBY1','XBY22','WGY666','汉族',21,'2000-02-22','福建温州','2020-09-30')
insert into Student values('201630327','刘苏良','女','XBY1','XBY22','WGY666','壮族',19,'2002-03-14','广西赣州','2020-09-30')
insert into Student values('201630328','张无忌','男','XBY1','XBY22','WGY666','汉族',20,'2001-01-09','湖北遵义','2020-09-30')
insert into Student values('201630329','孙贞建','女','XBY1','XBY22','WGY666','苗族',20,'2001-02-03','河北唐山','2020-09-30')
insert into Student values('201630330','徐当归','男','XBY1','XBY22','WGY666','汉族',19,'2002-04-03','浙江绍兴','2020-09-30')
insert into Student values('201630331','孙天天','男','XBY1','XBY22','WGY666','汉族',19,'2002-04-03','云南大理','2020-09-30')

select * from Course
insert into Course values('YY1','大学英语',4,72)
insert into Course values('GS2','高等数学',4,120)
insert into Course values('SJK3','数据库',4,72)
insert into Course values('SJ4','数据结构',4,72)
insert into Course values('LC5','Linux操作系统',3,68)

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
insert into Award_punish values('JL1','201130321','RJ11','RJ111','三好学生','授予三好学生奖状')
insert into Award_punish values('JL2','201330325','XQ11','JSJY333','精神文明奖','授予精神文明奖奖状')
insert into Award_punish values('JL3','201530336','YT22','ST555','三好学生','授予三好学生奖状')
insert into Award_punish values('JL4','201330324','XQ11','JSJY333','国家励志奖学金','奖励国家励志奖学金奖金')
insert into Award_punish values('JL5','201230329','XW22','XC222','三好学生','授予三好学生奖状')
insert into Award_punish values('JL6','201630328','XBY22','WGY666','精神文明奖','授予精神文明奖奖状')

