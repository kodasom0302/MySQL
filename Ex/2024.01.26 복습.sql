create table author (
	author_id int auto_increment primary key,
    author_name varchar(100),
    author_desc varchar(500)
);

create table book (
	book_id int auto_increment primary key,
    title varchar(100) not null,
    pubs varchar(100),
    pub_date datetime,
    author_id int,
    constraint book_fk foreign key(author_id)
    references author(author_id)
);

insert into author(author_name, author_desc)
values ('김문열', '경북 양양');
insert into author(author_name, author_desc)
values ('박경리', '경상남도 통영');
insert into author(author_name, author_desc)
values ('유시민', '17대 국회의원');
insert into author(author_name, author_desc)
values ('기안84', '기안동에서 산 84년생');
insert into author(author_name, author_desc)
values ('강풀', '온라인 만화가 1세대');
insert into author(author_name, author_desc)
values ('김영하', '알쓸신잡');

/*
insert into book
values (3, '토지', '마로니에복스', '2012-08-15', 1)

insert into book
values (4, '오직두사람', '문학동네', '2017-05-04', )

-- 작가 테이블 auto_increment
create table autor (
	author_id int auto_increment primary key,
	author_name varchar(100) not null,
	author_desc varchar(500)
);

-- 작가 추가
insert into author (author_name, author_desc)
values ('박경리', '경상남도 통영')
;

insert into author
values (null, '유시민', '17대 국회의원')
;
*/