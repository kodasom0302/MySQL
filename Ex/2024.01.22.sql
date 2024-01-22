use hrbd;

-- 양수면 1, 0이면 0, 음수면 -1 출력
select sign(123),
		sign(0),
        sign(-123)
;

-- 절댓값 출력
select abs(123),
		abs(0),
        abs(-123)
;

-- 가장 큰 값 출력
select greatest(2, 0, -2),
		greatest(4, 3.2, 5.25),
        greatest('B', 'A', 'C'),
        greatest('B', 'A', 'C', 'c')
;
select employee_id,
		manager_id,
        department_id,
        greatest(employee_id, manager_id, department_id)
from employees
;

-- 가장 작은 값 출력
select least(2, 0, -2),
		least(4, 3.2, 5.25),
        least('B', 'A', 'C'),
        least('B', 'A', 'C', 'c')

#단일행 함수>문자 함수
select concat('안녕', '하세요')
from dual;
select concat('안녕', ' ', '하세요');
select concat('안녕', '-', "'하'세요");

select concat(first_name, ' ', last_name)
from employees
;

-- 맨 처음에 넣은 기호로 그 뒤 문자 구분
select concat_ws('-', 'abc', '123', '가나다')
from dual;
select concat_ws('-', first_name, last_name, salary)
from employees
;

-- 대문자를 소문자로 변환
select first_name,
		lcase(first_name),
        lower(first_name),
        lower('ABCabc!@#$'),
        lower('가나다라마바사')
from employees;

-- 소문자를 대문자로 변환
select first_name,
		ucase(first_name),
        upper(first_name),
        upper('ABCabc!@#$'),
        upper('가나다라마바사')
from employees;

-- 문자 개수
select first_name,
		length(first_name),
        char_length(first_name),
        character_length(first_name)
from employees;
select length('a'),
		char_length('a'),
        character_length('a')
from dual;
select length('가'),		-- byte로 반환
		char_length('가'),
        character_length('가')
from dual;

-- 문자열 잘라내기
select first_name,
		substr(first_name, 1, 3),	-- 1번부터 세 글자
        substr(first_name, 2, 2),	-- 2번부터 두 글자
        substr(first_name, -3, 2)	-- 뒤에서 3번째 문자부터 두 글자
from employees
where department_id=100;
#주민번호로 성별 알아내기
select substr('901112-1234567', 8, 1);

-- 정한 문자수 만큼 만드는데 빈칸에 기호 추가
select first_name,
		lpad(first_name, 10, '*'),	-- left 왼쪽에 빈칸만큼 기호 추가
        rpad(first_name, 10, '#')	-- 오른쪽에 빈칸 채우기
from employees;

-- 공백 없애기
select concat('ㅣ', '   안녕하세요   ', 'ㅣ'),
		concat('ㅣ', trim('   안녕하세요   '), 'ㅣ'),
        concat('ㅣ', ltrim('   안녕하세요   '), 'ㅣ'),	-- 왼쪽 공백 제거
        concat('ㅣ', rtrim('   안녕하세요   '), 'ㅣ')	-- 오른쪽 공백 제거
;

-- a를 b로 바꿔라
select first_name,
		replace(first_name, 'a', '*'),
        replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id=100;

#단일행 함수>날짜 함수
select current_date(), curdate();
select current_time(), curtime();
select current_timestamp(), now();

# 날짜/시간 계산 함수
-- 더하기
select adddate('2021-06-20 00:00:00', INTERVAL 1 YEAR),
		adddate('2021-06-20 00:00:00', INTERVAL 1 MONTH),
		adddate('2021-06-20 00:00:00', INTERVAL 1 WEEK),
		adddate('2021-06-20 00:00:00', INTERVAL 1 DAY),
		adddate('2021-06-20 00:00:00', INTERVAL 1 HOUR),
		adddate('2021-06-20 00:00:00', INTERVAL 1 MINUTE),
        adddate('2021-06-20 00:00:00', INTERVAL 1 SECOND)
;

-- 빼기
select subdate('2021-06-20 00:00:00', INTERVAL 1 YEAR),
		subdate('2021-06-20 00:00:00', INTERVAL 1 MONTH),
		subdate('2021-06-20 00:00:00', INTERVAL 1 WEEK),
		subdate('2021-06-20 00:00:00', INTERVAL 1 DAY),
		subdate('2021-06-20 00:00:00', INTERVAL 1 HOUR),
		subdate('2021-06-20 00:00:00', INTERVAL 1 MINUTE),
        subdate('2021-06-20 00:00:00', INTERVAL 1 SECOND)
;

-- 날짜/시간차
select datediff('2021-06-21 01:05:05', '2021-06-21 01:00:00'),
		timediff('2021-06-21 01:05:05', '2021-06-20 01:00:00')
;
#근무일 출력
select first_name,
		hire_date,
        round(datediff(now(), hire_date)/365, 1) workday	-- 소수점 몇 자리까지 보여줄지
from employees
order by workday desc;	-- 큰 수부터 출력

#변환 함수
-- 날짜/시간을 문자열로 변환
select now(),
		date_format(now(), '%y'),	-- 연도 두 자리
        date_format(now(), '%Y');	-- 연도 네 자리
select now(),
		date_format(now(), '%y-%m-%d %H:%i:%s'),
        date_format(now(), '%Y-%m-%d(%a) %H:%i:%s %p')
from dual;

-- 문자열을 날짜/시간으로 변환
select datediff('2021-06-21 01:05:05', '2021-06-20 01:00:00');
select datediff('2021-Jun-04', '2021-06-01');
select str_to_date('2021-Jun-04 07:48:52', '%Y-%b-%d');
select str_to_date('2021-06-01 12:30:05', '%Y-%m-%d');
select datediff(str_to_date('2021-Jun-04 07:48:52', '%Y-%b-%d'), str_to_date('2021-06-01 12:30:05', '%Y-%m-%d'));

-- 숫자를 문자열로 변환
select format(1234567.89, 3),	-- 소수점 몇 번째 자리까지 나타내겠냐
		format(1234567.89, 0);	-- 정수로 변환 (반올림) / '-(음수)'넣으면 0과 똑같이 출력
        
select first_name, ifnull(commision_pct, '0')
from employees;