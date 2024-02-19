insert into author
values (null, '고다솜', '막내반장')
;

select * from author
;

delete from author
where author_id=8
;

select  author_id,
        author_name,
        author_desc
from author
;

update author
set author_id=7,
    author_desc='반장'
where author_id=12
;

select * from book
;