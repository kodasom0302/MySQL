-- left outer join을 중심으로 왼쪽에 있는 테이블이 기준
select *
from employees e
left outer join departments d	-- outer 생략 가능
	on e.department_id=d.department_id
;

# 모든 직원의 부서번호, 이름, 부서명을 출력하세요
select  e.department_id,
		first_name,
        department_name
from employees e
left join departments d
	on e.department_id=d.department_id
;

-- right outer join을 중심으로 오른쪽 테이블이 기준
select *
from employees e
right outer join departments d		-- outer 생략 가능
	on e.department_id=d.department_id
;

-- left>right로 바꿀 때 테이블 순서 바꾸고 join 바꾸면 결과값 동일하게 됨
select  first_name,
		e.department_id,
        department_name
from departments d
left join employees e
	on e.department_id=d.department_id
;

-- 이어붙이기
(select  e.department_id,
		first_name,
        department_name
from employees e
left join departments d
	on e.department_id=d.department_id)
union
(select  e.department_id,
		first_name,
        department_name
from employees e
right join departments d
	on e.department_id=d.department_id)
;

select  employee_id,
		first_name,
		manager_id,
        department_id,
        job_id
from employees
;

select  e.employee_id,
		e.first_name,
        m.first_name manager_name
from employees e, employees m
where e.manager_id=m.manager_id
;

select  first_name,
		salary,
		location_id,
        street_address,
        city
from employees e, locations l
where e.salary=l.location_id
;