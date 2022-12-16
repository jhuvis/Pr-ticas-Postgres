SELECT c.id, COUNT(e.id) as "educations"
FROM public.users c
JOIN public.educations e 
ON c.id = e."userId"
GROUP BY c.id;