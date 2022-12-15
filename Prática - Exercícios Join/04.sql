SELECT public.users.id, public.users.name, public.roles.name AS "role", public.companies.name AS "company", public.experiences."startDate"
FROM public.users
JOIN public.experiences
ON public.experiences."userId" = public.users.id
JOIN public.roles
ON public.experiences."roleId" = public.roles.id
JOIN public.companies
ON public.experiences."companyId" = public.companies.id
WHERE public.users.id = 50 AND public.experiences."endDate" IS NULL;