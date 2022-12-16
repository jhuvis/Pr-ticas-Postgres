SELECT c.name AS "writer", COUNT(t.id) as "testimonialCount"
FROM public.users c
JOIN public.testimonials t 
ON c.id = t."writerId"
WHERE c.id = 435
GROUP BY c.name;