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

# 월급이 16000 초과 되는 직원의 수는?
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

select department_id, job_id, count(*)
from employees
group by department_id, job_id
;

# 월급(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 월급합계를 출력하세요
select department_id, count(*), sum(salary)
from employees
where sum(salary)>=20000	-- where절에는 그룹함수 사용 불가능 -> 합계 계산 전 where절 사용
group by department_id
;

-- 조건 달기/구간 지정하기
select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary)>=20000	-- having절에는 그룹함수, group by에 참려한 컬럼만 사용 가능
;

# 월급(salary)의 합계가 20000 이상이면서 부서 번호가 100인 부서의 부서 번호와 , 인원수, 월급합계를 출력하세요
select department_id, count(*), sum(salary)
from employees
-- where department_id=100		-- 부서 번호가 100인 컬럼만 출력
group by department_id
having sum(salary)>=20000	-- having절에는 그룹함수, group by에 참려한 컬럼만 사용 가능
-- and department_id=100
;

-- 조건문
select  first_name
		, commission_pct
        , if(commission_pct is null, 0, 1) state
from employees
;

/*
직원아이디, 월급, 업무아이디, 실제월급(realSalary)을 출력하세요.
실제월급은 job_id가 'AC_ACCOUNT' 면 월급+월급*0.1,
				'SA_REP' 월급+월급*0.2,
				'ST_CLERK' 면 월급+월급*0.3
				그외에는 월급으로 계산하세요
*/
select  employee_id,
		salary,
        job_id,
        case  when job_id='AC_ACCOUNT' then salary+salary*0.1
			  when job_id='SA_REP' then salary+salary*0.2
              when job_id='ST_CLERK' then salary+salary*0.3
              else salary
		end realSalary
from employees
;

/*
직원의 이름, 부서번호, 팀을 출력하세요
팀은 코드로 결정하며 부서코드가
10~50 이면 'A-TEAM'
60~100이면 'B-TEAM'
110~150이면 'C-TEAM'
나머지는 '팀없음'
으로 출력하세요.
*/
select  first_name,
		department_id,
		case when 10<=department_id<=50 then 'A-TEAM'
			 when 
from employees
;