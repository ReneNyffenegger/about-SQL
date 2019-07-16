select
   grp,
   percentile_cont(0.5) within group (order by val)  median
from
   tq84_perc_cont   
group by
   grp;
