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
-- 그 직원의 이름, 월급, 사번을 구한다
select  first_name,
		salary,
        employee_id
from employees
where salary = (select min(salary)
				from employees)
;

# 평균 월급보다 적게 받는 사람의 이름, 월급을 출력하세요
-- 월급의 평균을 구한다
-- 평균 월급보다 적게 받는 직원을 구한다
select  first_name,
		salary
from employees
where salary < (select avg(salary)
				from employees)
;

/*
부서번호가 110인 직원의 급여와 같은 월급을 받는
모든 직원의 사번, 이름, 급여를 출력하세요
*/
-- 부서번호가 110인 직원의 월급을 구한다
-- 그 직원과 같은 월급을 받는 모든 직원을 구한다
select  employee_id,
		first_name,
        salary
from employees
where salary = (select salary
				from employees
                where department_id=110)
;	# 결과값이 2개
-- 결과의 row가 1개 이상일 때 -> in
select  employee_id,
		first_name,
        salary
from employees
where salary in (select salary
				from employees
                where department_id=110)
;

# 각 부서별로 최고급여를 받는 사원의 이름과 월급을 출력하세요
-- 부서별 최고급여를 받는 직원 구하기
-- 해당 직원의 이름, 월급 구하기
select  first_name,
		salary,
        department_id
from employees
where salary in (select max(salary)
				from employees e
                group by department_id)
;

select  department_name,
		max(salary)
from employees e, departments d
group by department_name