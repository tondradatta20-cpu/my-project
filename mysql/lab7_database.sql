CREATE DATABASE IF NOT EXISTS university;
USE university;
-- Drop table if already exists (to avoid duplicate error)
DROP TABLE IF EXISTS main;
create table main(
    id int primary key,
    salary int
);

insert into main values (1,1500);
insert into main values (2,5500);
insert into main values (3,2500);
insert into main values (4,3500);
select * from main;

create table backup(
    id int,
    salary int
);

delimiter $$
create trigger t2
before delete on main
for each row
begin
    insert into backup(id, salary) values (old.id, old.salary);
end$$
delimiter ;

delete from main where id=1;
select * from main;
select * from backup;
