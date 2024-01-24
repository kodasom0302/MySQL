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