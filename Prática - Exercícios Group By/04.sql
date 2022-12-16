SELECT MAX(j.salary) AS "maximumSalary", r.name AS "role"
FROM public.jobs j
JOIN public.roles r 
ON j."roleId" = r.id
WHERE j.active = TRUE
GROUP BY r.name
ORDER BY "maximumSalary";