-- 작가 테이블 만들기
create table author (
	author_id int primary key,
	author_name varchar(100) not null,
    author_desc varchar(500)
);
-- 책 테이블 만들기
create table book (
	book_id int primary key,	-- not null, unique 해당
    title varchar(100) not null,
    pubs varchar(100),
    pub_date datetime,
    author_id int,
    constraint book_fk foreign key(author_id)
    references author(author_id)	-- author 테이블 먼저 제작
);
-- 작가 등록
# 묵시적 방법
insert into author
values (1, '박경리', '토지 작가')
;
# 명시적 방법
insert into author(author_id, author_name)
values (2, '이문열')
;
insert into author(author_name, author_id)
values ('고다솜', 3)
;
insert into author(author_id, author_name)
values (4, '정우성')
;
insert into author(author_name)
values ('박명수')
;
insert into author
values (5, '김종국', null)
;
-- 작가 수정
update author
set author_name='기안84',
	author_desc='웹툰 작가'
where author_id=3
;
update author
set author_desc='영화배우'
where author_id=4
;
-- 작가 삭제
delete from author
where author_id=5
;
-- 현재 몇 번인지 궁금할 때
select last_insert_id();

select * from author;