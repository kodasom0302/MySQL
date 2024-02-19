/*
문제1.
평균 월급보다 적은 월급을 받는 직원은 몇명인지 구하시요. (56건)
*/
select count(salary)
from employees
where salary < (select avg(salary)
				from employees)
;

/*
문제2.
평균월급 이상, 최대월급 이하의 월급을 받는 사원의
직원번호(employee_id), 이름(first_name), 월급(salary), 평균월급, 최대월급을 월급의 오름차
순으로 정렬하여 출력하세요 (51건)
*/
select  employee_id,
		first_name,
        salary,
        avg(salary),
        max(salary)
from employees
where salary >= (select avg(salary)
				from employees)
and salary <= (select max(salary)
				from employees)
group by employee_id
order by salary asc
;

/* ??? 컬럼 개수가 맞지 않아 오류
문제3.
직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소
를 알아보려고 한다.
도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 도시명(city), 주
(state_province), 나라아이디(country_id) 를 출력하세요 (1건)
*/
select  l.location_id,
		street_address,
        postal_code,
        city,
        state_province,
        country_id
from departments d, locations l, employees e
where (e.department_id, first_name, last_name) in (select first_name,
                              last_name,
                              department_id
						from employees
                        where (first_name, last_name)=('Steven', 'King'))
;

/* !!!
문제4.
job_id 가 'ST_MAN' 인 직원의 월급보다 작은 직원의 사번,이름,월급을 월급의 내림차순으로
출력하세요 -ANY연산자 사용 (74건)
*/
select  employee_id,
		first_name,
        salary
from employees
where salary <any (select salary
				from employees
                where job_id='ST_MAN')
order by salary desc
;

/* !!!
문제5.
각 부서별로 최고의 월급을 받는 사원의 직원번호(employee_id), 이름(first_name)과 월급
(salary) 부서번호(department_id)를 조회하세요
단 조회결과는 월급의 내림차순으로 정렬되어 나타나야 합니다.
조건절비교, 테이블조인 2가지 방법으로 작성하세요 (11건)
*/
select  employee_id,
		first_name,
        salary,
        department_id
from employees
where (department_id, salary) in (select department_id,
								max(salary)
						from employees
                        group by department_id)
order by salary desc
;
select  employee_id,
		first_name,
        e.salary,
        e.department_id
from employees e, (select department_id,
						max(salary) salary
				from employees
                group by department_id) s
where e.department_id=s.department_id
and e.salary=s.salary
order by salary desc
;

/* ???
문제6.
각 업무(job) 별로 월급(salary)의 총합을 구하고자 합니다.
월급 총합이 가장 높은 업무부터 업무명(job_title)과 월급 총합을 조회하시오 (19건)
*/
select  job_title,
		sum(salary)
from employees e, jobs j
where (e.job_id, salary) = (select job_id,
									salary
				 from employees
                 group by job_id)
group by job_title
order by sum(salary) desc
;

/*
문제7.
자신의 부서 평균 월급보다 월급(salary)이 많은 직원의 직원번호(employee_id), 이름
(first_name)과 월급(salary)을 조회하세요 (38건)
*/
select  employee_id,
		first_name,
        e.salary,
        s.salary
from employees e, (select department_id,
						  avg(salary) salary
				   from employees
                   group by department_id) s
where e.salary>s.salary
and e.department_id=s.department_id
;

/*
문제8.
직원 입사일이 11번째에서 15번째인 직원의 사번, 이름, 월급, 입사일을 입사일 순서로 출력
하세요
*/
select  employee_id,
		first_name,
        salary,
        hire_date
from employees
order by hire_date asc
limit 10, 5
;