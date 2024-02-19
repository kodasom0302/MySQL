use member_db;

create table departments(
   department_id   int auto_increment primary key,
    department_name   varchar(20),
    manager_id   int
);

create table members(
   member_id   int  auto_increment  primary key,
    id   varchar(20) not null,
    pw   varchar(20) not null,
    name   varchar(20) not null,
    hp   varchar(20) not null,
    birth   varchar(20),
    department_id   int,
    hire_date   varchar(20) not null,
    manager_id   int,
    position   varchar(20),
   CONSTRAINT members_fk FOREIGN KEY (department_id)
   REFERENCES departments(department_id)
);

create table history(
   member_id   int,
    date   varchar(20),
    state   varchar(20),
    primary key (member_id, date),
   CONSTRAINT history_fk FOREIGN KEY (member_id)
   REFERENCES members(member_id)
);