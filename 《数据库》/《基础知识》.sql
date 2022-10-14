USE 体育馆管理系统 
GO
CREATE TABLE 学生管理
(
ID int not null,
NAME nvarchar(50) null,
SEX nvarchar(10) null,
Email nvarchar(50) null,
联系方式 nvarchar(max) null
)
alter table 学生管理
add Old int null
go

use 体育馆管理系统
go
insert into 学生管理
values('1','sunjiumeng','man','2818822733','1870000','21') 
select * from 学生管理

update 学生管理 set NAME='孙久猛'where ID = '1'
select * from 学生管理 where ID = '1'

use 体育馆管理系统  
go
insert into 学生管理
values('1','sunjiumeng','man','2818822733','1870000','21')
('2','kendfe','woman','232345','18904','18')
select * from 学生管理

insert into 学生管理
values('2','kendfe','woman','232345','18904','18')
select * from 学生管理

select * from 学生管理 where Old ='18'

use 体育馆管理系统
go
insert into 学生管理
values('3','同辉','man','2818822733','1870000','21') 
select * from 学生管理
