SELECT public.users.id, public.users.name, public.cities.name AS "city" 
FROM public.users 
JOIN public.cities 
ON public.cities.id = public.users."cityId" 
WHERE public.cities.name = 'Rio de Janeiro';