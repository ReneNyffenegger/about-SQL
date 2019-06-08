select
   ntile(3) over (order by val) group_no,
   item,
   val
from
   tq84_n
order by
   1,
   item;
