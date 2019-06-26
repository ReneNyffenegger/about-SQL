select
-- t1.id,
-- t2.id,
-- t3.id,
   --
   t1.txt,
   t2.txt,
   t3.txt
from
   tab_1 t1                                   full outer join
   tab_2 t2 on          t1.id         = t2.id full outer join
   tab_3 t3 on coalesce(t1.id, t2.id) = t3.id
;
