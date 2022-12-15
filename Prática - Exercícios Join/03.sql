SELECT public.users.id, public.users.name, public.courses.name AS "course", public.schools.name AS "school", public.educations."endDate"
FROM public.educations
JOIN public.users
ON public.users.id = public.educations."userId"
JOIN public.courses
ON public.educations."courseId" = public.courses.id
JOIN public.schools
ON public.educations."schoolId" = public.schools.id
WHERE public.educations.status = 'finished' AND public.educations."userId" = 30;