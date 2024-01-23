#그룹 함수 : 최종 값이 하나 -> 단일행 함수처럼 다른 값이랑 동시 사용 불가능
select first_name,
		sum(employee_id)
from employees;

-- 해당 컬럼의 개수(row의 개수) 출력
select count(*)		-- * : 가장 많은 컬럼의 수 표시 / null 포함
from employees;

select count(first_name)
from employees;

select count(manager_id)	-- null은 제외 / 0은 포함
from employees;

select count(commission_pct)
from employees;

select count(*),
		count(commission_pct)
from employees;

-- 월급이 16000 초과 되는 직원의 수는?
select count(*)
from employees
where salary>16000
;

-- 합계
select  count(*)
		,sum(salary)
        ,sum(employee_id)
from employees
;

-- 평균
select  count(*)
		,sum(salary)
        ,avg(salary)	-- null은 제외하고 계산
from employees
;


-- 가장 큰/작은 값
select  count(*)
		,max(salary)
        ,min(salary)
from employees
;

-- 해당 칼럼 하나로 묶기
select  department_id
		,sum(salary)
        ,avg(salary)
from employees
group by department_id	-- 다른 칼럼도 있을 경우 그룹함수 사용 -> 묶음별 row 수가 하나여야 함
;