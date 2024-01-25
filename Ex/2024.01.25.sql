# 'Den'보다 월급이 많은 사람의 이름과 월급은?
-- Den의 월급을 구한다
select *
from employees
where first_name='Den'	-- 11000
;
-- 직원 테이블에서 월급이 11000보다 많은 사람을 구한다
select *
from employees
where salary>=11000
;
-- 위 2가지 한번에
select *
from employees
where salary>=(select salary
				from employees
                where first_name='Den')
;

# 월급을 가장 적게 받는 사람의 이름, 월급, 사원번호는?
-- 가장 적은 월급을 구한다
-- 그 사람의 이름, 월급, 사번을 구한다
select  first_name,
		salary,
        employee_id
from employees
where salary = (select min(salary)
				from employees)
;

# 평균 월급보다 적게 받는 사람의 이름, 월급을 출력하세요
-- 월급의 평균을 구한다
-- 평균 월급보다 적게 받는 사람의 이름, 월급을 구한다
select *
from employees
where salary > (seelct avg(salary)
;