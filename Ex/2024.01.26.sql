show databases;
use hrdb;
select * from employees;

-- 계정 만들기
create user 'webdb'@'%' identified by '1234';
# 아이디 : webdb, 비밀번호 : 1234, 접속 제한 : '%' = 모든 곳에서 접속 가능(public)

-- 비밀번호 변경
alter user 'webdb'@'%' identified by 'webdb';

-- 권한 부여
grant all privileges on web_db.* to 'webdb'@'%';
# web_db의 모든 테이블에 대한 권한을 webdb에게 주겠다

-- 계정 삭제
drop user 'webdb'@'%';

-- 데이터베이스 만들기
create database web_db
	default character set utf8mb4
    collate utf8mb4_general_ci
    default encryption='n'	-- 암호화 여부 / 안 적어주면 디폴트값 no
;

-- 데이터베이스 삭제
drop database web_db;

-- 바로 적용되도록
flush privileges;