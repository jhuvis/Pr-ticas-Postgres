SELECT public.testimonials.id, t1.name AS "writer", t2.name AS "recipient", public.testimonials.message 
FROM public.testimonials
JOIN public.users t1
ON public.testimonials."writerId" = t1.id
JOIN public.users t2
ON public.testimonials."recipientId" = t2.id;
