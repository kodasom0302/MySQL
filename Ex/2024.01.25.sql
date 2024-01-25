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
where (department_id, salary)in(select  department_id,
										max(salary)
								from employees
								group by department_id)
;

# 월급 최저인 직원의 이름과 월급은?
select  first_name,
		salary
from employees
where salary = (select min(salary)
				from employees)
;

# 월급이 15000보다 큰 직원의 이름, 월급을 출력하세요
select  first_name,
		salary
from employees
where salary>15000
;

/*
부서번호가 110인 직원의 급여 보다 큰 모든 직원의
이름, 급여를 출력하세요.(or연산--> 8300보다 큰)
*/
select  first_name,
		salary
from employees
where salary >any (select salary
				 from employees
                 where department_id=110)
;	-- in은 같은 경우에만 가능 / 크거나 작은 건 불가능 -> any = or (느슨)

/*
부서번호가 110인 직원의 급여 보다 큰 모든 직원의
이름, 급여를 출력하세요.(and연산--> 12008보다 큰)
*/
select  first_name,
		salary
from employees
where salary >all  (select salary	-- all = and (깐깐)
					from employees
					where department_id=110)
;

# 각 부서별로 최고급여를 받는 사원을 출력하세요
select *
from employees
where (department_id, salary)  in  (select  department_id,
											max(salary)
									from employees
									group by department_id)
;

-- 없는 테이블 제작
select *
from employees e, (select  	department_id,		-- join하겠다
							max(salary) salary
							from employees
							group by department_id) s
where e.department_id=s.department_id
and e.salary=s.salary
;

-- x부터 y개까지의 row만 출력
select *
from employees
order by employee_id asc
limit 1, 10
;
-- y부터 x개까지의 row 출력
select *
from employees
order by employee_id asc
limit 5 offset 2
;

# 07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름, 급여, 입사일은?
select  first_name,
		salary,
		hire_date
from employees
where hire_date between '2007/01/01' and '2007/12/31'
order by salary desc
limit 2, 5
;