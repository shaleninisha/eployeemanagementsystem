create table sector(sectorid int primary key,
sectorname varchar(50),
place varchar(100));
create table role(roleid int primary key,
rolename varchar(50)not null,
roleduration varchar(50));
select *from role;
create table employee(employeeid int primary key,
firstname varchar(50)not null,
lastname varchar(50),
email varchar(100),
phoneno varchar(100) not null,
hiredate date,
salary int not null,
sectorid int,
foreign key(sectorid)references sector(sectorid),
roleid int,
foreign key(roleid)references role(roleid));
select *from employee;
create table absent (absentid int primary key,
employeeid int,
startdate date,
enddate date,
absentreason varchar(50),
permission varchar(50),
foreign key(employeeid)references employee(employeeid));
insert into sector values
(1,"finance","anex block"),
(2,"sales","new block"),
(3,"marketing","old block"),
(4,"corporate tax","c block"),
(5,"executive","e block"),
(6,"IT","main block"),
(7,"accounting","a block"),
(8,"administration","admin block"),
(9,"production","p block"),
(10,"human resource","h block");
select *from sector;
insert into role values
(1,"software engineer","1 year"),
(2,"project manager","2 years"),
(3,"HR specialist","5 years"),
(4,"data analyst","3 years"),
(5,"marketing manager","2 years"),
(6,"sales rep","3 years"),
(7,"UX designer","4 years"),
(8,"financial analyst","6 years"),
(9,"network administrator","3 years"),
(10,"customer supporter","1 year");
insert into employee values
(1,"mithra","shree","mii2000@gmail.com",7865334210,"2024-09-11",30000,1,1),
(2,"harish","kalyan","hari99@gmail.com",9866315045,"2024-06-20",25000,2,2),
(3,"anbu","selvan","anbu445@yahoo.com",7889654367,"2024-03-01",20000,3,3),
(4,"harini","priya","haruu51@gmail.com",9905831527,"2024-01-15",25000,4,4),
(5,"vijay","kumar","viju11@gmail.com",9980065312,"2024-08-11",30000,5,5),
(6,"divya","shree","divu87@yahoo.com",8874531209,"2024-04-29",20000,6,6),
(7,"gopal","krishnan","gk1971@gmail.com",9090675443,"2024-06-27",15000,7,7),
(8,"vishnu","kannan","vishu22@gmail.com",8874212376,"2024-02-18",20000,8,8),
(9,"kavi","arjun","kavii999@gmail.com",9126604326,"2024-12-12",30000,9,9),
(10,"kavya","shree","shree33@gmail.com",8821335467,"2024-01-30",35000,10,10);
insert into absent values 
(11,01,"2024-09-11","2024-09-15", "fever", "granted");
insert into absent values
(12,02,"2024-02-01","2024-02-20","trip","not approved"),
(13,03,"2024-05-05","2024-05-10","health issue","approved"),
(14,04,"2024-03-13","2024-03-20","marriage","approved"),
(15,05,"2024-06-23","2024-06-26","fever","approved"),
(16,06,"2024-01-01","2024-01-11","vacationtrip","not approved"),
(17,07,"2024-07-02","2024-07-08","cold","not approved"),
(18,08,"2024-10-01","2024-10-12","healthissue","approved"),
(19,09,"2024-11-03","2024-11-10","trip","not approved"),
(20,10,"2024-12-11","2024-12-20","festival","not approved");
delimiter $$
create procedure workerdetails(in id int)
begin
select *from employee
where employeeid=id;
select firstname from employee;
end $$
call workerdetails(5);

create view status AS
select absentreason, permission
from absent
where absentid<15;
select *from status;
create view workers AS
select firstname from employee
where firstname like '%A';
select *from workers;