-- 데이터베이스(스키마) 접속
use book_db
;
-- book 테이블 생성
create table book(
	book_id int,
    title varchar(50),
    author varchar(20),
    pub_date datetime
);
-- 테이블 보기
show tables
;
-- 컬럼 추가
alter table book add pubs varchar(50)
;	-- book 테이블에 'pubs'라는 이름의 varchar(50)짜리 컬럼을 추가하겠다
# alter : 수정
-- 컬럼 수정 > 자료형
alter table book modify title varchar(100)
;	-- book 테이블에 'title'이라는 컬럼의 자료형을 varchar(100)으로 바꾸겠다
-- 컬럼 수정 > 이름
alter table book rename column title to subject
;	-- book 테이블에 'title' 컬럼명을 'subject'로 바꾸겠다
-- 컬럼 삭제
alter table book drop author
;	-- 'book' 테이블에서 'author'라는 컬럼을 지우겠다
-- 테이블명 수정
rename table book to article
;	-- 'book' 테이블명을 'article'로 바꾸겠다
-- 테이블 삭제
drop table article
;	-- 'article'이라는 테이블을 지우겠다